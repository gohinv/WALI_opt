#include "../common/wali_mmap_wrap.h"
#include <fcntl.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <time.h>
#include <unistd.h>

static uint64_t now_ns(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (uint64_t)ts.tv_sec * 1000000000ull + (uint64_t)ts.tv_nsec;
}

/* --- roundtrip: same shape as mmap_perf_bench (CSV for scripting) --- */
static int bench_roundtrip(int maps_per_round, size_t map_size, int rounds) {
    printf("bench,round,maps,map_size,total_ns,avg_ns_per_map\n");
    for (int r = 0; r < rounds; r++) {
        uint64_t t0 = now_ns();
        for (int i = 0; i < maps_per_round; i++) {
            void *p = wali_bench_mmap(NULL, map_size, PROT_READ | PROT_WRITE,
                                      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
            if (p == MAP_FAILED) return 1;
            for (size_t off = 0; off < map_size; off += 4096)
                ((volatile char *)p)[off] = (char)(off & 0xff);
            if (wali_bench_munmap(p, map_size) != 0) return 1;
        }
        uint64_t t1 = now_ns();
        uint64_t total = t1 - t0;
        double avg = (double)total / (double)maps_per_round;
        printf("roundtrip,%d,%d,%zu,%" PRIu64 ",%.2f\n", r, maps_per_round, map_size, total, avg);
    }
    return 0;
}

/* --- sizesweep: several allocation sizes, fixed maps per size --- */
static int bench_sizesweep(int maps_per_round, int rounds) {
    static const size_t sizes[] = { 4096, 16384, 65536, 262144, 1048576 };
    const int ns = (int)(sizeof sizes / sizeof sizes[0]);
    printf("bench,size_bytes,round,maps,total_ns,avg_ns_per_map\n");
    for (int si = 0; si < ns; si++) {
        size_t map_size = sizes[si];
        for (int r = 0; r < rounds; r++) {
            uint64_t t0 = now_ns();
            for (int i = 0; i < maps_per_round; i++) {
                void *p = wali_bench_mmap(NULL, map_size, PROT_READ | PROT_WRITE,
                                          MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
                if (p == MAP_FAILED) return 1;
                for (size_t off = 0; off < map_size; off += 4096)
                    ((volatile char *)p)[off] = (char)(off & 0xff);
                if (wali_bench_munmap(p, map_size) != 0) return 1;
            }
            uint64_t total = now_ns() - t0;
            double avg = (double)total / (double)maps_per_round;
            printf("sizesweep,%zu,%d,%d,%" PRIu64 ",%.2f\n", map_size, r, maps_per_round, total, avg);
        }
    }
    return 0;
}

/* --- many_live: peak simultaneous VMAs + bytes live (RSS proxy via touches) --- */
static int bench_many_live(int count) {
    void **ptrs = calloc((size_t)count, sizeof(void *));
    size_t *sizes = calloc((size_t)count, sizeof(size_t));
    if (!ptrs || !sizes) return 1;

    printf("bench,phase,count,note\n");
    printf("many_live,map_start,%d,\n", count);
    uint64_t t0 = now_ns();
    for (int i = 0; i < count; i++) {
        size_t sz = 4096u * (1u + (unsigned)(i % 16u)); /* 4KiB .. 64KiB */
        void *p = wali_bench_mmap(NULL, sz, PROT_READ | PROT_WRITE,
                                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
        if (p == MAP_FAILED) {
            free(ptrs);
            free(sizes);
            return 1;
        }
        ((volatile char *)p)[0] = 1;
        ptrs[i] = p;
        sizes[i] = sz;
    }
    uint64_t map_ns = now_ns() - t0;
    printf("many_live,map_done,%d,map_total_ns=%" PRIu64 "\n", count, map_ns);

    t0 = now_ns();
    for (int i = 0; i < count; i++) {
        for (size_t off = 0; off < sizes[i]; off += 4096)
            ((volatile char *)ptrs[i])[off] ^= 1;
    }
    uint64_t touch_ns = now_ns() - t0;
    printf("many_live,touch_done,%d,touch_total_ns=%" PRIu64 "\n", count, touch_ns);

    for (int i = 0; i < count; i++)
        wali_bench_munmap(ptrs[i], sizes[i]);
    printf("many_live,unmap_done,%d,\n", count);
    free(ptrs);
    free(sizes);
    return 0;
}

/* --- file_map: file-backed mmap + touch + unmap (engine + host FS) --- */
static int bench_file_map(const char *path) {
    int fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0600);
    if (fd < 0) return 1;
    const size_t sz = 256 * 1024;
    if (ftruncate(fd, (off_t)sz) != 0) {
        close(fd);
        return 1;
    }
    printf("bench,phase,size_bytes,total_ns,note\n");
    uint64_t t0 = now_ns();
    void *p = wali_bench_mmap(NULL, sz, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    uint64_t t1 = now_ns();
    if (p == MAP_FAILED) {
        close(fd);
        return 1;
    }
    printf("file_map,mmap,%zu,%" PRIu64 ",\n", sz, t1 - t0);
    t0 = now_ns();
    for (size_t off = 0; off < sz; off += 4096)
        ((volatile char *)p)[off] = (char)(off & 0xff);
    t1 = now_ns();
    printf("file_map,touch,%zu,%" PRIu64 ",\n", sz, t1 - t0);
    t0 = now_ns();
    wali_bench_munmap(p, sz);
    t1 = now_ns();
    printf("file_map,munmap,%zu,%" PRIu64 ",\n", sz, t1 - t0);
    close(fd);
    unlink(path);
    return 0;
}

/* --- frag_hole: tracker-based; include mmap_tracker with hooks --- */
#define MMAP_TRACKER_MMAP(addr, len, prot, flags, fd, off) \
    wali_bench_mmap((addr), (len), (prot), (flags), (fd), (off))
#define MMAP_TRACKER_MUNMAP(addr, len) wali_bench_munmap((addr), (len))
#include "../common/mmap_tracker.h"

#define TM MMAP_TRACKER_MMAP
#define TU MMAP_TRACKER_MUNMAP
#define TRK(label, step) mmap_tracker_print_stats((label), (step))

static int bench_frag_hole(void) {
    enum { N = 96 };
    void *a[N];
    size_t sz_small = 8192, sz_big = 65536;

    for (int i = 0; i < N; i++) {
        size_t z = (i & 1) ? sz_small : sz_big;
        a[i] = TM(NULL, z, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
        if (a[i] == MAP_FAILED) return 1;
    }
    TRK("hole", 1);

    for (int i = 0; i < N; i += 2)
        TU(a[i], (i & 1) ? sz_small : sz_big);
    TRK("hole", 2);

    for (int i = 0; i < N; i += 2) {
        size_t z = (i & 1) ? sz_small : sz_big;
        a[i] = TM(NULL, z, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
        if (a[i] == MAP_FAILED) return 1;
    }
    TRK("hole", 3);

    for (int i = 0; i < N; i++)
        TU(a[i], (i & 1) ? sz_small : sz_big);
    TRK("hole", 4);
    return 0;
}

static void usage(const char *p) {
    fprintf(stderr,
            "usage:\n"
            "  %s roundtrip <maps_per_round> <map_size_bytes> <rounds>\n"
            "  %s sizesweep <maps_per_round> <rounds>\n"
            "  %s many_live <count>\n"
            "  %s file_map [path]\n"
            "  %s frag_hole\n",
            p, p, p, p, p);
}

int main(int argc, char **argv) {
    setvbuf(stdout, NULL, _IONBF, 0);
    if (argc < 2) {
        usage(argv[0]);
        return 2;
    }
    const char *mode = argv[1];
    if (strcmp(mode, "roundtrip") == 0) {
        if (argc < 5) { usage(argv[0]); return 2; }
        return bench_roundtrip(atoi(argv[2]), (size_t)strtoull(argv[3], NULL, 10), atoi(argv[4]));
    }
    if (strcmp(mode, "sizesweep") == 0) {
        if (argc < 4) { usage(argv[0]); return 2; }
        return bench_sizesweep(atoi(argv[2]), atoi(argv[3]));
    }
    if (strcmp(mode, "many_live") == 0) {
        if (argc < 3) { usage(argv[0]); return 2; }
        return bench_many_live(atoi(argv[2]));
    }
    if (strcmp(mode, "file_map") == 0) {
        const char *path = (argc > 2) ? argv[2] : "/tmp/mmap_suite_bench.dat";
        return bench_file_map(path);
    }
    if (strcmp(mode, "frag_hole") == 0)
        return bench_frag_hole();

    usage(argv[0]);
    return 2;
}