/*
 * wali_mmap_alloc.c — Wasm-level mmap allocator for WALI
 *
 * Runs entirely as Wasm.  All address-selection policy (first-fit free-list,
 * arena growth) lives here; the engine only handles raw page growth via
 * memory.grow and the final MAP_FIXED kernel syscall.
 *
 * Layering
 * --------
 *   musl libc  --[import "wali" "SYS_mmap"]--> __walirt_mmap   (this file)
 *   __walirt_mmap --> __walirt_wasm_memory_grow                  (wali_rt.c)
 *   __walirt_mmap --> __syscall_SYS_mmap (MAP_FIXED passthrough) (engine)
 */

#include <stdint.h>
#include <stddef.h>
#include <pthread.h>
#include <sys/mman.h>
#include <errno.h>

/* ------------------------------------------------------------------ */
/* Primitives from wali_rt.c (same archive, direct calls at link time) */
/* ------------------------------------------------------------------ */

int32_t __walirt_wasm_memory_grow(int32_t pages);
int32_t __walirt_wasm_memory_size(void);

/* ------------------------------------------------------------------ */
/* Engine import declarations                                          */
/*                                                                     */
/* The engine provides stripped versions of these syscalls:            */
/*   SYS_mmap   — MAP_FIXED-only passthrough; returns MAP_FAILED if   */
/*                addr == 0.                                           */
/*   SYS_munmap — thin wrapper around the kernel SYS_munmap.          */
/*   SYS_mremap — requires MREMAP_FIXED; no placement policy.         */
/* ------------------------------------------------------------------ */

__attribute__((__import_module__("wali"), __import_name__("SYS_mmap")))
long __engine_mmap(void *addr, unsigned int len, int prot, int flags,
                   int fd, long long offset);

__attribute__((__import_module__("wali"), __import_name__("SYS_munmap")))
long __engine_munmap(void *addr, unsigned int len);

__attribute__((__import_module__("wali"), __import_name__("SYS_mremap")))
long __engine_mremap(void *old_addr, unsigned int old_len,
                     unsigned int new_len, int flags, void *new_addr);

/* ------------------------------------------------------------------ */
/* Constants                                                           */
/* ------------------------------------------------------------------ */

/* Native OS page size.  4 KiB on x86-64 and most WALI targets. */
#define NATIVE_PAGE_SIZE  4096u

/* Wasm linear-memory page size (fixed by the spec). */
#define WASM_PAGE_SIZE    65536u

/* ------------------------------------------------------------------ */
/* Free-list data structures                                           */
/* ------------------------------------------------------------------ */

/*
 * One entry in the free list: a contiguous, page-aligned hole inside
 * the mmap arena that is currently not backed by any kernel mapping.
 * Nodes are kept sorted in ascending order by offset.
 */
typedef struct free_node {
    uint32_t          offset;  /* Wasm byte address of the hole start */
    uint32_t          size;    /* hole size in bytes (page-aligned)    */
    struct free_node *next;    /* next node sorted ascending by offset */
} free_node_t;

/*
 * Static pool of free_node_t objects.
 *
 * malloc() cannot be called here (that would re-enter the allocator via
 * sbrk/mmap), so free_node_t instances are carved from this fixed slab.
 * 512 entries cover the expected number of simultaneously live holes for
 * any realistic workload; the allocator returns ENOMEM if the pool is
 * exhausted.
 */
#define FREE_POOL_SIZE  512

static free_node_t node_pool[FREE_POOL_SIZE];

/*
 * Allocation bitmap for node_pool[].  A byte value of 0 means the
 * corresponding slot is available; 1 means it is in use.
 */
static uint8_t node_pool_used[FREE_POOL_SIZE];

/* Head of the sorted free-hole list. */
static free_node_t *free_list = NULL;

/*
 * High-water mark of the mmap arena expressed as a Wasm byte address.
 * All Wasm pages in [arena_base, arena_top) have been committed via
 * memory.grow; some sub-ranges may be logically free (in free_list).
 * Initialised to 0; set on first allocation from the current memory top.
 */
static uint32_t arena_top = 0;

/*
 * Whether the arena has been initialised.  Checked under alloc_lock.
 * Uses int rather than bool to avoid a <stdbool.h> dependency.
 */
static int arena_initialised = 0;

/*
 * Serialises access to free_list, arena_top, arena_initialised, and
 * node_pool_used[].
 */
static pthread_mutex_t alloc_lock = PTHREAD_MUTEX_INITIALIZER;

/* ------------------------------------------------------------------ */
/* Pool helpers                                                        */
/* ------------------------------------------------------------------ */

/*
 * pool_alloc — obtain a free_node_t from the static pool.
 *
 * Must be called with alloc_lock held.
 * Returns NULL when the pool is exhausted.
 */
static free_node_t *pool_alloc(void)
{
    for (int i = 0; i < FREE_POOL_SIZE; i++) {
        if (!node_pool_used[i]) {
            node_pool_used[i] = 1;
            node_pool[i].offset = 0;
            node_pool[i].size   = 0;
            node_pool[i].next   = NULL;
            return &node_pool[i];
        }
    }
    return NULL;
}

/*
 * pool_free — return a free_node_t to the static pool.
 *
 * Must be called with alloc_lock held.
 */
static void pool_free(free_node_t *node)
{
    if (!node)
        return;
    int idx = (int)(node - node_pool);
    if (idx >= 0 && idx < FREE_POOL_SIZE)
        node_pool_used[idx] = 0;
}
