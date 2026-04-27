/*
 * wali_mmap_alloc.c
 *
 * Runs entirely as Wasm.
 * All address-selection policy lives here.
 * The WALI engine only handles raw page growth via memory.grow and the
 * final MAP_FIXED kernel syscall.
 */

#define _GNU_SOURCE

#include <stdint.h>
#include <stddef.h>
#include <sys/mman.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>

/* ------------------------------------------------------------------ */
/* Primitives from wali_rt.c                                          */
/* ------------------------------------------------------------------ */

int32_t __walirt_wasm_memory_grow(int32_t pages);
int32_t __walirt_wasm_memory_size(void);

/* ------------------------------------------------------------------ */
/* Engine import declarations                                          */
/*                                                                     */
/* Raw engine syscalls: caller selects the Wasm address.              */
/*   SYS_mmap_raw   — MAP_FIXED passthrough; rejects addr == 0.       */
/*   SYS_munmap_raw — thin host SYS_munmap wrapper.                   */
/*   SYS_mremap_raw — requires MREMAP_FIXED + explicit new address.   */
/* ------------------------------------------------------------------ */

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
#define WASM_PAGE_SIZE            65536u

/* ------------------------------------------------------------------ */
/* Free-list data structures                                           */
/* ------------------------------------------------------------------ */

/*
 * Nodes kept sorted ascending by offset.
 */
typedef struct free_node {
    uint32_t          offset; /* Wasm byte address of segment start */
    uint32_t          size;   /* segment size in bytes (page-aligned) */
    struct free_node *next;
} free_node_t;

#define FREE_POOL_SIZE 512

static free_node_t node_pool[FREE_POOL_SIZE];
static uint8_t     node_pool_used[FREE_POOL_SIZE];

static free_node_t *free_list       = NULL;
static uint32_t     arena_top       = 0;
static int          arena_initialised = 0;

/* Cached native page size (initialised lazily via sysconf). */
static uint32_t native_page_size = 0;

/* ------------------------------------------------------------------ */
/* Pool helpers                                                        */
/* ------------------------------------------------------------------ */

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
    return NULL; /* pool exhausted */
}

static void pool_free(free_node_t *node)
{
    if (!node)
        return;
    int idx = (int)(node - node_pool);
    if (idx >= 0 && idx < FREE_POOL_SIZE)
        node_pool_used[idx] = 0;
}

/* ------------------------------------------------------------------ */
/* Utility helpers                                                     */
/* ------------------------------------------------------------------ */

static uint32_t get_native_page_size(void)
{
    if (!native_page_size) {
        long ps = sysconf(_SC_PAGE_SIZE);
        native_page_size = (ps > 0) ? (uint32_t)ps : NATIVE_PAGE_SIZE_FALLBACK;
    }
    return native_page_size;
}

static uint32_t page_align_up(uint32_t n, uint32_t page_sz)
{
    uint32_t r = (n + page_sz - 1u) & ~(page_sz - 1u);
    return r ? r : page_sz;
}

/*
 * freelist_insert_coalesce — insert [offset, offset+size) into the free list,
 * maintaining sorted order, coalescing adjacent blocks.  If the resulting
 * block reaches arena_top, trim arena_top and remove the node.
 */
static void freelist_insert_coalesce(uint32_t offset, uint32_t size)
{
    free_node_t *prev = NULL;
    free_node_t *cur  = free_list;
    while (cur && cur->offset < offset) {
        prev = cur;
        cur  = cur->next;
    }

    free_node_t *merged;

    int fwd = cur  && (offset + size == cur->offset);
    int bwd = prev && (prev->offset + prev->size == offset);

    if (fwd && bwd) {
        /* Coalesce both neighbours into prev */
        prev->size += size + cur->size;
        prev->next  = cur->next;
        pool_free(cur);
        merged = prev;
    } else if (fwd) {
        /* Extend cur backwards */
        cur->offset = offset;
        cur->size  += size;
        merged = cur;
    } else if (bwd) {
        /* Extend prev forwards */
        prev->size += size;
        merged = prev;
    } else {
        /* No neighbours to coalesce: allocate a new node */
        free_node_t *node = pool_alloc();
        if (!node)
            return; /* pool exhausted; leak the range rather than corrupt */
        node->offset = offset;
        node->size   = size;
        node->next   = cur;
        if (prev)
            prev->next = node;
        else
            free_list = node;
        merged = node;
    }

    /* Trim arena_top if this block now extends to it */
    if (merged->offset + merged->size == arena_top) {
        arena_top = merged->offset;
        /* Find and unlink merged */
        free_node_t *p = NULL;
        free_node_t *c = free_list;
        while (c && c != merged) { p = c; c = c->next; }
        if (c == merged) {
            if (p) p->next = merged->next;
            else   free_list = merged->next;
        }
        pool_free(merged);
    }
}

/*
 * arena_ensure_init — lazily initialise arena_top and bootstrap if zero.
 * Returns 0 on success, -1 on OOM.
 */
static int arena_ensure_init(void)
{
    if (!arena_initialised) {
        int32_t cur_pages = __walirt_wasm_memory_size();
        arena_top = (uint32_t)cur_pages * WASM_PAGE_SIZE;
        arena_initialised = 1;
    }
    /* mmap_raw rejects addr == 0; grow at least one page */
    if (arena_top == 0) {
        if (__walirt_wasm_memory_grow(1) < 0)
            return -1;
        arena_top = WASM_PAGE_SIZE;
    }
    return 0;
}

/*
 * alloc_wasm_range — choose an address for a new allocation of alloc_len bytes
 * from the free list or by growing Wasm memory.  Fills *chosen_addr on
 * success.  Returns 0 on success, -1 on OOM.
 */
static int alloc_wasm_range(uint32_t alloc_len, uint32_t *chosen_addr)
{
    if (arena_ensure_init() < 0)
        return -1;

    /* First-fit search */
    free_node_t *prev = NULL;
    free_node_t *cur  = free_list;
    while (cur) {
        if (cur->size >= alloc_len) {
            *chosen_addr = cur->offset;
            uint32_t remainder = cur->size - alloc_len;
            if (remainder > 0) {
                cur->offset += alloc_len;
                cur->size    = remainder;
            } else {
                if (prev) prev->next = cur->next;
                else      free_list  = cur->next;
                pool_free(cur);
            }
            return 0;
        }
        prev = cur;
        cur  = cur->next;
    }

    /* Bump-allocate from arena_top */
    uint32_t wasm_pages = (alloc_len + WASM_PAGE_SIZE - 1u) / WASM_PAGE_SIZE;
    if (__walirt_wasm_memory_grow((int32_t)wasm_pages) < 0)
        return -1;

    *chosen_addr = arena_top;
    arena_top   += wasm_pages * WASM_PAGE_SIZE;
    return 0;
}

/* ------------------------------------------------------------------ */
/* Exported entry-points                                               */
/* ------------------------------------------------------------------ */

/*
 * __walirt_mmap — exported as "SYS_mmap" so wasm-ld links musl's import here.
 */
__attribute__((__export_name__("SYS_mmap")))
long __walirt_mmap(void *addr, unsigned int len, int prot, int flags,
                   int fd, long long offset)
{
    (void)addr; /* allocator picks the address; ignore caller hint */

    uint32_t page_sz   = get_native_page_size();
    uint32_t alloc_len = page_align_up((uint32_t)len, page_sz);

    uint32_t chosen_addr;
    if (alloc_wasm_range(alloc_len, &chosen_addr) < 0) {
        errno = ENOMEM;
        return (long)MAP_FAILED;
    }

    long ret = __engine_mmap((void *)(uintptr_t)chosen_addr,
                             alloc_len, prot, MAP_FIXED | flags, fd, offset);

    if (ret == (long)MAP_FAILED) {
        freelist_insert_coalesce(chosen_addr, alloc_len);
        errno = ENOMEM;
        return (long)MAP_FAILED;
    }

    return ret;
}

/*
 * __walirt_munmap — exported as "SYS_munmap".
 *
 * Calls the engine to actually unmap, then reclaims the Wasm address range
 * into the free list with coalescing and logical arena_top trimming.
 */
__attribute__((__export_name__("SYS_munmap")))
long __walirt_munmap(void *addr, unsigned int len)
{
    long ret = __engine_munmap(addr, len);
    if (ret != 0)
        return ret;

    uint32_t page_sz     = get_native_page_size();
    uint32_t aligned_len = page_align_up((uint32_t)len, page_sz);
    uint32_t wasm_addr   = (uint32_t)(uintptr_t)addr;

    freelist_insert_coalesce(wasm_addr, aligned_len);
    return 0;
}

/*
 * __walirt_mremap — exported as "SYS_mremap".
 *
 * Staged implementation:
 *   1. Shrink  — unmap tail pages, return the same address.
 *   2. Grow at arena_top — extend Wasm memory and place extra pages with mmap.
 *   3. Grow into adjacent free hole — consume/split the hole, place extra pages.
 *   4. Move fallback — allocate a fresh region, mremap kernel mapping there,
 *      reclaim old address range.
 *
 * Note: for in-place extension (stages 2 & 3) we map the delta with
 * PROT_READ|PROT_WRITE|MAP_ANONYMOUS since mremap carries no prot argument.
 * File-backed mremap extension is not supported in this stage.
 */
__attribute__((__export_name__("SYS_mremap")))
long __walirt_mremap(void *old_addr, unsigned int old_len, unsigned int new_len,
                     int flags, void *new_addr)
{
    uint32_t page_sz     = get_native_page_size();
    uint32_t old_aligned = page_align_up((uint32_t)old_len, page_sz);
    uint32_t new_aligned = page_align_up((uint32_t)new_len, page_sz);
    uint32_t old_wasm    = (uint32_t)(uintptr_t)old_addr;

    /* -----------------------------------------------------------------
     * Stage 1: Shrink
     * ----------------------------------------------------------------- */
    if (new_aligned <= old_aligned) {
        uint32_t tail_offset = old_wasm + new_aligned;
        uint32_t tail_len    = old_aligned - new_aligned;
        if (tail_len > 0) {
            __engine_munmap((void *)(uintptr_t)tail_offset, tail_len);
            freelist_insert_coalesce(tail_offset, tail_len);
        }
        return (long)old_wasm;
    }

    /* Growing: need delta more bytes immediately after the old mapping */
    uint32_t delta      = new_aligned - old_aligned;
    uint32_t ext_offset = old_wasm + old_aligned;

    /* -----------------------------------------------------------------
     * Stage 2: Grow at arena_top (old mapping ends exactly at arena_top)
     * ----------------------------------------------------------------- */
    if (ext_offset == arena_top) {
        uint32_t wasm_pages = (delta + WASM_PAGE_SIZE - 1u) / WASM_PAGE_SIZE;
        if (__walirt_wasm_memory_grow((int32_t)wasm_pages) >= 0) {
            arena_top += wasm_pages * WASM_PAGE_SIZE;
            long mret = __engine_mmap((void *)(uintptr_t)ext_offset, delta,
                                      PROT_READ | PROT_WRITE,
                                      MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS,
                                      -1, 0);
            if (mret != (long)MAP_FAILED)
                return (long)old_wasm;
            /* Rollback arena_top and fall through */
            arena_top -= wasm_pages * WASM_PAGE_SIZE;
        }
    }

    /* -----------------------------------------------------------------
     * Stage 3: Grow into an adjacent free hole
     * ----------------------------------------------------------------- */
    {
        free_node_t *prev = NULL;
        free_node_t *cur  = free_list;
        while (cur && cur->offset != ext_offset) {
            prev = cur;
            cur  = cur->next;
        }
        if (cur && cur->size >= delta) {
            uint32_t remainder = cur->size - delta;
            if (remainder > 0) {
                cur->offset += delta;
                cur->size    = remainder;
            } else {
                if (prev) prev->next = cur->next;
                else      free_list  = cur->next;
                pool_free(cur);
            }
            long mret = __engine_mmap((void *)(uintptr_t)ext_offset, delta,
                                      PROT_READ | PROT_WRITE,
                                      MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS,
                                      -1, 0);
            if (mret != (long)MAP_FAILED)
                return (long)old_wasm;
            /* Rollback consumed hole and fall through */
            freelist_insert_coalesce(ext_offset, delta);
        }
    }

    /* -----------------------------------------------------------------
     * Stage 4: Move fallback
     * Allocate a fresh region, use engine mremap to move the kernel mapping
     * there (MREMAP_FIXED unmaps the destination first), then reclaim old.
     * ----------------------------------------------------------------- */
    {
        uint32_t chosen_addr;
        if (alloc_wasm_range(new_aligned, &chosen_addr) < 0) {
            errno = ENOMEM;
            return (long)MAP_FAILED;
        }

        long mret = __engine_mremap(old_addr, old_aligned, new_aligned,
                                    MREMAP_MAYMOVE | MREMAP_FIXED,
                                    (void *)(uintptr_t)chosen_addr);
        if (mret == (long)MAP_FAILED) {
            freelist_insert_coalesce(chosen_addr, new_aligned);
            errno = ENOMEM;
            return (long)MAP_FAILED;
        }

        freelist_insert_coalesce(old_wasm, old_aligned);
        return (long)chosen_addr;
    }
}


/* ------------------------------------------------------------------ */
/* Fragmentation introspection — exported for benchmarks               */
/* ------------------------------------------------------------------ */

/* Total bytes in free-list holes */
__attribute__((__export_name__("__walirt_frag_free_bytes")))
uint32_t __walirt_frag_free_bytes(void)
{
    uint32_t total = 0;
    for (free_node_t *n = free_list; n; n = n->next)
        total += n->size;
    return total;
}

/* Number of discrete holes in the free list */
__attribute__((__export_name__("__walirt_frag_hole_count")))
uint32_t __walirt_frag_hole_count(void)
{
    uint32_t count = 0;
    for (free_node_t *n = free_list; n; n = n->next)
        count++;
    return count;
}

/* Size of the largest single free hole (0 if none) */
__attribute__((__export_name__("__walirt_frag_largest_hole")))
uint32_t __walirt_frag_largest_hole(void)
{
    uint32_t max_sz = 0;
    for (free_node_t *n = free_list; n; n = n->next)
        if (n->size > max_sz) max_sz = n->size;
    return max_sz;
}

/* Current arena high-water mark (bytes) */
__attribute__((__export_name__("__walirt_frag_arena_top")))
uint32_t __walirt_frag_arena_top(void)
{
    return arena_top;
}

/* Number of pool slots currently in use */
__attribute__((__export_name__("__walirt_frag_pool_used")))
uint32_t __walirt_frag_pool_used(void)
{
    uint32_t used = 0;
    for (int i = 0; i < FREE_POOL_SIZE; i++)
        if (node_pool_used[i]) used++;
    return used;
}

/*
 * Snapshot all stats into a caller-supplied buffer (5 x uint32_t).
 * Layout: [free_bytes, hole_count, largest_hole, arena_top, pool_used]
 * Returns 0 on success.
 */
__attribute__((__export_name__("__walirt_frag_snapshot")))
int __walirt_frag_snapshot(uint32_t *buf)
{
    if (!buf) return -1;
    buf[0] = __walirt_frag_free_bytes();
    buf[1] = __walirt_frag_hole_count();
    buf[2] = __walirt_frag_largest_hole();
    buf[3] = arena_top;
    buf[4] = __walirt_frag_pool_used();
    return 0;
}

