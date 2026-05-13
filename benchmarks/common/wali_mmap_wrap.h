#ifndef WALI_MMAP_WRAP_H_
#define WALI_MMAP_WRAP_H_

#include <errno.h>
#include <sys/mman.h>
#include <sys/syscall.h>
#include <unistd.h>

#ifdef __wasm__
__attribute__((__import_module__("wali"), __import_name__("SYS_mmap")))
long long __imported_wali_mmap(void *addr, size_t length, int prot, int flags, int fd, long long offset);
__attribute__((__import_module__("wali"), __import_name__("SYS_munmap")))
long long __imported_wali_munmap(void *addr, size_t length);

static inline void *wali_bench_mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset) {
    long long r = __imported_wali_mmap(addr, length, prot, flags, fd, (long long)offset);
    if (r < 0 && r > -4096) return MAP_FAILED;
    return (void *)(long)r;
}

static inline int wali_bench_munmap(void *addr, size_t length) {
    return (int)__imported_wali_munmap(addr, length);
}
#else
static inline void *wali_bench_mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset) {
    return (void *)syscall(SYS_mmap, addr, length, prot, flags, fd, offset);
}

static inline int wali_bench_munmap(void *addr, size_t length) {
    return (int)syscall(SYS_munmap, addr, length);
}
#endif

#endif /* WALI_MMAP_WRAP_H_ */