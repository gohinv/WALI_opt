// CMD: args="churn"
// CMD: args="interleave"
// CMD: args="sawtooth"

#include "wali_start.c"
#include <sys/mman.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>

#ifdef __wasm__
extern uint32_t __walirt_frag_free_bytes(void)  __attribute__((weak));
extern uint32_t __walirt_frag_hole_count(void)  __attribute__((weak));
extern uint32_t __walirt_frag_largest_hole(void) __attribute__((weak));
extern uint32_t __walirt_frag_arena_top(void)   __attribute__((weak));
extern uint32_t __walirt_frag_pool_used(void)   __attribute__((weak));
#endif

/* Fallback for base branch (main) where these symbols don't exist */
static void print_frag_stats(const char *label, int step)
{
    printf("FRAG,%s,%d,", label, step);
#ifdef __wasm__
    if (__walirt_frag_free_bytes) {
        uint32_t arena   = __walirt_frag_arena_top();
        uint32_t free_b  = __walirt_frag_free_bytes();
        uint32_t holes   = __walirt_frag_hole_count();
        uint32_t largest = __walirt_frag_largest_hole();
        uint32_t pool    = __walirt_frag_pool_used();
        float frag_ratio = arena > 0 ? (float)free_b / arena : 0.0f;
        printf("arena=%u,free=%u,holes=%u,largest=%u,pool=%u,frag=%.4f",
               arena, free_b, holes, largest, pool, frag_ratio);
    }
#else
    printf("native");
#endif
    printf("\n");
}

/* ------- Workloads ------- */

#define N_ALLOCS 128

/*
 * churn: allocate N blocks of varying sizes, free every other one,
 *        then allocate again.  Measures hole creation + reuse.
 */
static int test_churn(void)
{
    void *ptrs[N_ALLOCS];
    size_t sizes[N_ALLOCS];

    /* Phase 1: allocate */
    for (int i = 0; i < N_ALLOCS; i++) {
        sizes[i] = 4096u * (1 + (i % 8));   /* 4K..32K */
        ptrs[i] = mmap(NULL, sizes[i], PROT_READ | PROT_WRITE,
                        MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
        if (ptrs[i] == MAP_FAILED) return -1;
    }
    print_frag_stats("churn", 1);  /* after all allocs */

    /* Phase 2: free every other block */
    for (int i = 0; i < N_ALLOCS; i += 2) {
        munmap(ptrs[i], sizes[i]);
        ptrs[i] = NULL;
    }
    print_frag_stats("churn", 2);  /* after creating holes */

    /* Phase 3: re-allocate into the holes */
    for (int i = 0; i < N_ALLOCS; i += 2) {
        ptrs[i] = mmap(NULL, sizes[i], PROT_READ | PROT_WRITE,
                        MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
        if (ptrs[i] == MAP_FAILED) return -1;
    }
    print_frag_stats("churn", 3);  /* after refilling */

    /* Cleanup */
    for (int i = 0; i < N_ALLOCS; i++)
        if (ptrs[i]) munmap(ptrs[i], sizes[i]);
    print_frag_stats("churn", 4);  /* after full cleanup */
    return 0;
}

/*
 * interleave: allocate small and large blocks alternately, free only
 *             the small ones.  Worst-case for external fragmentation.
 */
static int test_interleave(void)
{
    void *small_ptrs[N_ALLOCS / 2];
    void *big_ptrs[N_ALLOCS / 2];
    size_t small_sz = 4096, big_sz = 32768;

    for (int i = 0; i < N_ALLOCS / 2; i++) {
        small_ptrs[i] = mmap(NULL, small_sz, PROT_READ | PROT_WRITE,
                              MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
        big_ptrs[i]   = mmap(NULL, big_sz, PROT_READ | PROT_WRITE,
                              MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
        if (small_ptrs[i] == MAP_FAILED || big_ptrs[i] == MAP_FAILED)
            return -1;
    }
    print_frag_stats("interleave", 1);

    /* Free all small blocks — leaves 4K holes between 32K blocks */
    for (int i = 0; i < N_ALLOCS / 2; i++)
        munmap(small_ptrs[i], small_sz);
    print_frag_stats("interleave", 2);

    /* Try to allocate a 64K block — should fail to fit in any hole */
    void *big = mmap(NULL, 65536, PROT_READ | PROT_WRITE,
                      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    print_frag_stats("interleave", 3);
    if (big != MAP_FAILED) munmap(big, 65536);

    for (int i = 0; i < N_ALLOCS / 2; i++)
        munmap(big_ptrs[i], big_sz);
    print_frag_stats("interleave", 4);
    return 0;
}

/*
 * sawtooth: repeated cycles of allocate-all then free-all.
 *           Arena should NOT grow across cycles with a good allocator.
 */
static int test_sawtooth(void)
{
    for (int cycle = 0; cycle < 10; cycle++) {
        void *ptrs[32];
        size_t sz = 8192;
        for (int i = 0; i < 32; i++) {
            ptrs[i] = mmap(NULL, sz, PROT_READ | PROT_WRITE,
                            MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
            if (ptrs[i] == MAP_FAILED) return -1;
        }
        print_frag_stats("sawtooth", cycle * 2 + 1);
        for (int i = 0; i < 32; i++)
            munmap(ptrs[i], sz);
        print_frag_stats("sawtooth", cycle * 2 + 2);
    }
    return 0;
}

int test(void)
{
    if (test_init_args() != 0) return -1;
    const char *mode = (argc > 1) ? argv[1] : "churn";

    if (strcmp(mode, "churn") == 0)      return test_churn();
    if (strcmp(mode, "interleave") == 0)  return test_interleave();
    if (strcmp(mode, "sawtooth") == 0)    return test_sawtooth();
    return -1;
}
