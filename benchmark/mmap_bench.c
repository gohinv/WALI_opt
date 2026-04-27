#include <errno.h>
#include <fcntl.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/syscall.h>
#include <time.h>
#include <unistd.h>

#ifdef __wasm__
__attribute__((__import_module__("wali"), __import_name__("SYS_mmap")))
long long __imported_wali_mmap(void *addr, size_t length, int prot, int flags, int fd, long long offset);
__attribute__((__import_module__("wali"), __import_name__("SYS_munmap")))
long long __imported_wali_munmap(void *addr, size_t length);

static void *bench_mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset) {
    long long r = __imported_wali_mmap(addr, length, prot, flags, fd, (long long)offset);
    if (r < 0 && r > -4096) return MAP_FAILED;
    return (void *)(long)r;
}
static int bench_munmap(void *addr, size_t length) {
    return (int)__imported_wali_munmap(addr, length);
}
#else
static void *bench_mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset) {
    return (void *)syscall(SYS_mmap, addr, length, prot, flags, fd, offset);
}
static int bench_munmap(void *addr, size_t length) {
    return (int)syscall(SYS_munmap, addr, length);
}
#endif

static uint64_t now_ns(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (uint64_t)ts.tv_sec * 1000000000ull + (uint64_t)ts.tv_nsec;
}

int main(int argc, char **argv) {
    if (argc < 4) {
        fprintf(stderr, "usage: %s <maps_per_round> <map_size_bytes> <rounds>\n", argv[0]);
        return 2;
    }

	setvbuf(stdout, NULL, _IONBF, 0);

    int maps_per_round = atoi(argv[1]);
    size_t map_size = (size_t)strtoull(argv[2], NULL, 10);
    int rounds = atoi(argv[3]);

    if (maps_per_round <= 0 || map_size == 0 || rounds <= 0) {
        fprintf(stderr, "invalid arguments\n");
        return 2;
    }

    // CSV header for easy post-processing.
    printf("round,maps,map_size,total_ns,avg_ns_per_map\n");

    for (int r = 0; r < rounds; r++) {
        uint64_t t0 = now_ns();

        for (int i = 0; i < maps_per_round; i++) {
            void *p = bench_mmap(NULL, map_size, PROT_READ | PROT_WRITE,
                                 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
            if (p == MAP_FAILED) {
                fprintf(stderr, "mmap failed at round=%d i=%d errno=%d\n", r, i, errno);
                return 1;
            }

            // Touch one byte per page so lazy allocation is represented in load.
            for (size_t off = 0; off < map_size; off += 4096) {
                ((volatile char *)p)[off] = (char)(off & 0xff);
            }

            if (bench_munmap(p, map_size) != 0) {
                fprintf(stderr, "munmap failed at round=%d i=%d errno=%d\n", r, i, errno);
                return 1;
            }
        }

        uint64_t t1 = now_ns();
        uint64_t total = t1 - t0;
        double avg = (double)total / (double)maps_per_round;
        printf("%d,%d,%zu,%" PRIu64 ",%.2f\n", r, maps_per_round, map_size, total, avg);
		fflush(stdout);
    }

    return 0;
}