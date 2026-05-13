#ifndef MMAP_TRACKER_H_
#define MMAP_TRACKER_H_

/*
 * mmap_tracker.h
 *
 * External-observation fragmentation tracker for the main branch, where
 * no Wasm-side allocator state is accessible.
 *
 * Wraps mmap()/munmap() calls in test code and infers fragmentation from
 * the set of live mappings plus the current Wasm linear-memory size.
 *
 * Usage:
 *   #include "mmap_tracker.h"
 *   // Use TRACKED_MMAP / TRACKED_MUNMAP instead of mmap / munmap.
 *   // Call mmap_tracker_print_stats("label", step) to snapshot.
 */

#include <sys/mman.h>
#include <stdint.h>
#include <stdio.h>

#ifndef MMAP_TRACKER_MMAP
#define MMAP_TRACKER_MMAP(addr, len, prot, flags, fd, off) \
    mmap((addr), (len), (prot), (flags), (fd), (off))
#endif
#ifndef MMAP_TRACKER_MUNMAP
#define MMAP_TRACKER_MUNMAP(addr, len) munmap((addr), (len))
#endif

#define MT_MAX_LIVE  1024   /* max simultaneously live mappings */

typedef struct {
    uintptr_t addr;
    uint32_t  size;
} mt_entry_t;

static mt_entry_t  _mt_live[MT_MAX_LIVE];
static int         _mt_live_count  = 0;
static uint32_t    _mt_total_alloc = 0;   /* bytes ever allocated     */
static uint32_t    _mt_total_freed = 0;   /* bytes ever freed         */
static uint32_t    _mt_peak_live   = 0;   /* peak bytes live at once  */
static uint32_t    _mt_cur_live    = 0;   /* bytes currently live     */
static uint32_t    _mt_mmap_calls  = 0;
static uint32_t    _mt_munmap_calls = 0;

static void _mt_record_alloc(void *ptr, size_t sz)
{
    if (!ptr || ptr == MAP_FAILED) return;
    if (_mt_live_count < MT_MAX_LIVE) {
        _mt_live[_mt_live_count].addr = (uintptr_t)ptr;
        _mt_live[_mt_live_count].size = (uint32_t)sz;
        _mt_live_count++;
    }
    _mt_total_alloc += (uint32_t)sz;
    _mt_cur_live    += (uint32_t)sz;
    _mt_mmap_calls++;
    if (_mt_cur_live > _mt_peak_live) _mt_peak_live = _mt_cur_live;
}

static void _mt_record_free(void *ptr, size_t sz)
{
    if (!ptr || ptr == MAP_FAILED) return;
    for (int i = 0; i < _mt_live_count; i++) {
        if (_mt_live[i].addr == (uintptr_t)ptr) {
            _mt_live[i] = _mt_live[--_mt_live_count];
            break;
        }
    }
    _mt_total_freed += (uint32_t)sz;
    _mt_cur_live    -= (uint32_t)sz;
    _mt_munmap_calls++;
}

static void *tracked_mmap(void *addr, size_t len, int prot, int flags, int fd, off_t off)
{
    void *p = mmap(addr, len, prot, flags, fd, off);
    _mt_record_alloc(p, len);
    return p;
}

static int tracked_munmap(void *addr, size_t len)
{
    _mt_record_free(addr, len);
    return munmap(addr, len);
}

#define TRACKED_MMAP(addr,len,prot,flags,fd,off) \
    tracked_mmap((addr),(len),(prot),(flags),(fd),(off))
#define TRACKED_MUNMAP(addr,len) \
    tracked_munmap((addr),(len))

/*
 * Compute the lowest address returned by any currently live mapping.
 * On main, mmap bump-allocates upward, so the lowest live address is
 * close to where the arena started; the highest tells us arena_top.
 */
static void _mt_arena_bounds(uint32_t *lo, uint32_t *hi)
{
    *lo = UINT32_MAX; *hi = 0;
    for (int i = 0; i < _mt_live_count; i++) {
        uint32_t a = (uint32_t)_mt_live[i].addr;
        uint32_t b = a + _mt_live[i].size;
        if (a < *lo) *lo = a;
        if (b > *hi) *hi = b;
    }
    if (*lo == UINT32_MAX) *lo = 0;
}

static void mmap_tracker_print_stats(const char *label, int step)
{
    uint32_t lo, hi;
    _mt_arena_bounds(&lo, &hi);

#ifdef __wasm__
    uint32_t wasm_pages = (uint32_t)__builtin_wasm_memory_size(0);
    uint32_t wasm_bytes = wasm_pages * 65536u;
#else
    uint32_t wasm_bytes = hi;   /* no memory.size on native */
#endif

    /* Wasted = committed Wasm bytes minus currently live mapped bytes */
    uint32_t wasted   = (wasm_bytes > _mt_cur_live) ? wasm_bytes - _mt_cur_live : 0;
    float frag_ratio  = wasm_bytes > 0 ? (float)wasted / wasm_bytes : 0.0f;

    printf("FRAG,%s,%d,"
           "wasm_bytes=%u,live=%u,wasted=%u,frag=%.4f,"
           "peak_live=%u,mmap_calls=%u,munmap_calls=%u,live_count=%d\n",
           label, step,
           wasm_bytes, _mt_cur_live, wasted, frag_ratio,
           _mt_peak_live, _mt_mmap_calls, _mt_munmap_calls, _mt_live_count);
}

#endif /* MMAP_TRACKER_H_ */