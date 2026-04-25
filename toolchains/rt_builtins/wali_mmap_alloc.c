/*
 * wali_mmap_alloc.c
 *
 * Runs entirely as Wasm.  
 * All address-selection policy lives here. 
 * WALI Engine only handles raw page growth via
 * memory.grow and the final MAP_FIXED kernel syscall.
 *
 */

#include <stdint.h>
#include <stddef.h>
#include <pthread.h>
#include <sys/mman.h>
#include <errno.h>
#include <unistd.h>

/* ------------------------------------------------------------------ */
/* Primitives from wali_rt.c  */
/* ------------------------------------------------------------------ */

int32_t __walirt_wasm_memory_grow(int32_t pages);
int32_t __walirt_wasm_memory_size(void);

/* ------------------------------------------------------------------ */
/* Engine import declarations                                          */
/*                                                                     */
/* The engine provides stripped versions of these syscalls:            */
/*   SYS_mmap   — MAP_FIXED-only passthrough; returns MAP_FAILED if    */
/*                addr == 0.                                           */
/*   SYS_munmap — thin wrapper around kernel SYS_munmap.               */
/*   SYS_mremap — requires MREMAP_FIXED                                */
/*  ------------------------------------------------------------------  */

__attribute__((__import_module__("wali"), __import_name__("SYS_mmap_raw")))
long __engine_mmap(void *addr, unsigned int len, int prot, int flags,
                   int fd, long long offset);

__attribute__((__import_module__("wali"), __import_name__("SYS_munmap_raw")))
long __engine_munmap(void *addr, unsigned int len);

__attribute__((__import_module__("wali"), __import_name__("SYS_mremap_raw")))
long __engine_mremap(void *old_addr, unsigned int old_len,
                     unsigned int new_len, int flags, void *new_addr);

/* ------------------------------------------------------------------ */
/* Constants                                                           */
/* ------------------------------------------------------------------ */

#define NATIVE_PAGE_SIZE_FALLBACK 4096u

#define WASM_PAGE_SIZE      65536u

/* ------------------------------------------------------------------ */
/* Free-list data structures                                           */
/* ------------------------------------------------------------------ */

/*
 * Nodes kept sorted in ascending order by offset.
 */
typedef struct free_node {
    uint32_t          offset;  /* Wasm byte address of the segment start */
    uint32_t          size;    /* free segment size in bytes (page-aligned)    */
    struct free_node *next;    /* next node sorted ascending by offset */
} free_node_t;

/*
 * Static pool of free_node_t objects, allocator returns ENOMEM if the pool is
 * exhausted.
 */
#define FREE_POOL_SIZE  512

static free_node_t node_pool[FREE_POOL_SIZE];

/*
 * Allocation bitmap for node_pool[]
 */
static uint8_t node_pool_used[FREE_POOL_SIZE];

/* Head of sorted list */
static free_node_t *free_list = NULL;

/*
 * High-water mark of mmap arena expressed as a Wasm byte address.
 */
static uint32_t arena_top = 0;

/*
 * Whether the arena has been initialized.
 */
static int arena_initialised = 0;

/*
 * Guards access to free_list, arena_top, arena_initialised, and
 * node_pool_used[].
 */
static pthread_mutex_t alloc_lock = PTHREAD_MUTEX_INITIALIZER;

/* ------------------------------------------------------------------ */
/* Pool helpers                                                        */
/* ------------------------------------------------------------------ */

/*
 * pool_alloc — obtain free segment from the static pool.
 *
 * Must be called with alloc_lock held.
 * Returns NULL when pool is exhausted.
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

/* ------------------------------------------------------------------ */
/* Exported entry-points                                               */
/* ------------------------------------------------------------------ */

/*
 * __walirt_mmap
 *
 * Exported as SYS_mmap so wasm-ld resolves musl's import
 * ("wali","SYS_mmap") to this function.
 */
__attribute__((__export_name__("SYS_mmap")))
long __walirt_mmap(void *addr, unsigned int len, int prot, int flags,
                   int fd, long long offset)
{
    long ret = __engine_mmap((void *)(uintptr_t)addr, len, prot, flags, fd, offset);

    // ignore caller address hint
    // (void)addr;

    // static uint32_t native_page_size = 0;

    // uint32_t page_sz = native_page_size;

    // // compute placeholder while native_page_size is not yet known
    // uint32_t alloc_len;
    // if (page_sz == 0) {
    //     alloc_len = 0;
    // } else {
    //     alloc_len = (((uint32_t)len) + page_sz - 1u) & ~(page_sz - 1u);
    //     if (alloc_len == 0)
    //         alloc_len = page_sz;
    // }

    // pthread_mutex_lock(&alloc_lock);

    // if (!native_page_size) {
    //     long ps = sysconf(_SC_PAGE_SIZE);
    //     native_page_size = (ps > 0) ? (uint32_t)ps : NATIVE_PAGE_SIZE_FALLBACK;
    //     page_sz = native_page_size;
    // }

    // /* Recompute alloc_len now that page_sz is guaranteed non-zero. */
    // alloc_len = (((uint32_t)len) + page_sz - 1u) & ~(page_sz - 1u);
    // if (alloc_len == 0)
    //     alloc_len = page_sz;

    // if (!arena_initialised) {
    //     int32_t cur_pages = __walirt_wasm_memory_size();
    //     arena_top = (uint32_t)cur_pages * WASM_PAGE_SIZE;
    //     arena_initialised = 1;
    // }


    // // first-fit search through the free list
    // uint32_t chosen_addr  = 0;
    // int      from_freelist = 0;

    // free_node_t *prev = NULL;
    // free_node_t *cur  = free_list;
    // while (cur) {
    //     if (cur->size >= alloc_len) {
    //         chosen_addr   = cur->offset;
    //         from_freelist = 1;

    //         uint32_t remainder = cur->size - alloc_len;
    //         if (remainder > 0) {
    //             // split the segment if it is larger than the allocation
    //             cur->offset += alloc_len;
    //             cur->size    = remainder;
    //         } else {
    //             // perfect fit: unlink and recycle the node
    //             if (prev)
    //                 prev->next = cur->next;
    //             else
    //                 free_list = cur->next;
    //             pool_free(cur);
    //         }
    //         break;
    //     }
    //     prev = cur;
    //     cur  = cur->next;
    // }

    // // no free segment found: extend the arena
    // if (!from_freelist) {
    //     uint32_t base = arena_top;
    //     uint32_t wasm_pages =
    //         (alloc_len + WASM_PAGE_SIZE - 1u) / WASM_PAGE_SIZE;

    //     int32_t grow_ret = __walirt_wasm_memory_grow((int32_t)wasm_pages);
    //     if (grow_ret < 0) {
    //         // memory.grow failed: Wasm address space exhausted
    //         pthread_mutex_unlock(&alloc_lock);
    //         errno = ENOMEM;
    //         return (long)MAP_FAILED;
    //     }

    //     arena_top   = base + wasm_pages * WASM_PAGE_SIZE;
    //     chosen_addr = base;
    // }

    // pthread_mutex_unlock(&alloc_lock);

    // ask the engine to place the kernel mapping
    // long ret = __engine_mmap((void *)(uintptr_t)chosen_addr,
    //                          alloc_len, prot,
    //                          MAP_FIXED | flags,
    //                          fd, offset);

    // if (ret == (long)MAP_FAILED) {
    //     pthread_mutex_lock(&alloc_lock);
    //     free_node_t *node = pool_alloc();
    //     if (node) {
    //         node->offset = chosen_addr;
    //         node->size   = alloc_len;
    //         node->next   = free_list;
    //         free_list    = node;
    //     }

    //     pthread_mutex_unlock(&alloc_lock);

    //     errno = ENOMEM;
    //     return (long)MAP_FAILED;
    // }

    return ret;
}




__attribute__((__export_name__("SYS_munmap")))
long __walirt_munmap(void *addr, unsigned int len) {
    long ret = __engine_munmap(addr, len);
    return ret;
}


__attribute__((__export_name__("SYS_mremap")))
long __walirt_mremap(void *old_addr, unsigned int old_len, unsigned int new_len, int flags, void *new_addr) {
    long ret = __engine_mremap(old_addr, old_len, new_len, flags, new_addr);
    return ret;
}