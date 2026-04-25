// CMD: args="basic"
// CMD: args="reuse"
// CMD: args="grow"

#include "wali_start.c"
#include <sys/mman.h>
#include <unistd.h>
#include <string.h>
#include <stdint.h>

#ifdef WALI_TEST_WRAPPER
int test_setup(int argc, char **argv) { (void)argc; (void)argv; return 0; }
int test_cleanup(int argc, char **argv) { (void)argc; (void)argv; return 0; }
#endif

static int test_basic(void) {
    size_t n = 4096;
    char *p = (char *)mmap(NULL, n, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (p == MAP_FAILED) return -1;
    p[0] = 'A';
    p[n - 1] = 'Z';
    if (p[0] != 'A' || p[n - 1] != 'Z') return -1;
    if (munmap(p, n) != 0) return -1;
    return 0;
}

static int test_reuse(void) {
    size_t n = 4096;
    void *a = mmap(NULL, n, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (a == MAP_FAILED) return -1;
    if (munmap(a, n) != 0) return -1;

    void *b = mmap(NULL, n, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (b == MAP_FAILED) return -1;

#ifdef __wasm__
    // wasm allocator should recycle the freed segment for same-size request.
    if (b != a) return -1;
#endif

    if (munmap(b, n) != 0) return -1;
    return 0;
}

static int test_grow(void) {
    // Bigger than one wasm page to force allocator growth path.
    size_t n = 128 * 1024;
    char *p = (char *)mmap(NULL, n, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (p == MAP_FAILED) return -1;

    p[0] = 'Q';
    p[n - 1] = 'W';
    if (p[0] != 'Q' || p[n - 1] != 'W') return -1;

    if (munmap(p, n) != 0) return -1;
    return 0;
}

int test(void) {
    if (test_init_args() != 0) return -1;
    const char *mode = (argc > 0) ? argv[0] : "basic";

    if (strcmp(mode, "basic") == 0) return test_basic();
    if (strcmp(mode, "reuse") == 0) return test_reuse();
    if (strcmp(mode, "grow") == 0) return test_grow();
    return -1;
}