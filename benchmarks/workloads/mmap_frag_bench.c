#include "../common/mmap_tracker.h"
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <sys/mman.h>

#define MMAP(a, l, p, f, d, o)  TRACKED_MMAP((a), (l), (p), (f), (d), (o))
#define MUNMAP(a, l)            TRACKED_MUNMAP((a), (l))

#define N 128

static int test_churn(void)
{
    void *ptrs[N];
    size_t sizes[N];

    for (int i = 0; i < N; i++) {
        sizes[i] = 4096u * (1u + (unsigned)(i % 8));
        ptrs[i] = MMAP(NULL, sizes[i], PROT_READ | PROT_WRITE,
                       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
        if (ptrs[i] == MAP_FAILED)
            return -1;
    }
    mmap_tracker_print_stats("churn", 1);

    for (int i = 0; i < N; i += 2) {
        MUNMAP(ptrs[i], sizes[i]);
        ptrs[i] = NULL;
    }
    mmap_tracker_print_stats("churn", 2);

    for (int i = 0; i < N; i += 2) {
        ptrs[i] = MMAP(NULL, sizes[i], PROT_READ | PROT_WRITE,
                       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
        if (ptrs[i] == MAP_FAILED)
            return -1;
    }
    mmap_tracker_print_stats("churn", 3);

    for (int i = 0; i < N; i++)
        if (ptrs[i])
            MUNMAP(ptrs[i], sizes[i]);
    mmap_tracker_print_stats("churn", 4);
    return 0;
}

static int test_interleave(void)
{
    void *small[N / 2], *big[N / 2];
    size_t ss = 4096, bs = 32768;

    for (int i = 0; i < N / 2; i++) {
        small[i] = MMAP(NULL, ss, PROT_READ | PROT_WRITE,
                        MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
        big[i] = MMAP(NULL, bs, PROT_READ | PROT_WRITE,
                      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
        if (small[i] == MAP_FAILED || big[i] == MAP_FAILED)
            return -1;
    }
    mmap_tracker_print_stats("interleave", 1);

    for (int i = 0; i < N / 2; i++)
        MUNMAP(small[i], ss);
    mmap_tracker_print_stats("interleave", 2);

    void *huge = MMAP(NULL, 65536, PROT_READ | PROT_WRITE,
                      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    mmap_tracker_print_stats("interleave", 3);
    if (huge != MAP_FAILED)
        MUNMAP(huge, 65536);

    for (int i = 0; i < N / 2; i++)
        MUNMAP(big[i], bs);
    mmap_tracker_print_stats("interleave", 4);
    return 0;
}

static int test_sawtooth(void)
{
    for (int cycle = 0; cycle < 10; cycle++) {
        void *ptrs[32];
        size_t sz = 8192;
        for (int i = 0; i < 32; i++) {
            ptrs[i] = MMAP(NULL, sz, PROT_READ | PROT_WRITE,
                           MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
            if (ptrs[i] == MAP_FAILED)
                return -1;
        }
        mmap_tracker_print_stats("sawtooth", cycle * 2 + 1);
        for (int i = 0; i < 32; i++)
            MUNMAP(ptrs[i], sz);
        mmap_tracker_print_stats("sawtooth", cycle * 2 + 2);
    }
    return 0;
}

int main(int argc, char **argv)
{
    setvbuf(stdout, NULL, _IONBF, 0);
    const char *mode = (argc > 1) ? argv[1] : "churn";

    if (strcmp(mode, "churn") == 0)
        return test_churn() != 0;
    if (strcmp(mode, "interleave") == 0)
        return test_interleave() != 0;
    if (strcmp(mode, "sawtooth") == 0)
        return test_sawtooth() != 0;

    fprintf(stderr, "usage: %s [churn|interleave|sawtooth]\n", argv[0]);
    return 2;
}