/*
 * wali_signal.c
 *
 * Wasm-side signal management module.  Mirrors the role of wali_mmap_alloc.c
 * for memory: policy, tables, and libc-facing sigaction() live here in Wasm;
 * the engine exposes one narrow import (SYS_rt_sigaction_install) that only
 * performs the kernel syscall with a forced native handler stub.
 *
 * Compile target: wasm32-unknown-linux-muslwali (same flags as wali_mmap_alloc.c).
 * Linked into the builtins archive; the strong sigaction() definition here
 * supersedes the musl one at link time.
 *
 * Engine contract
 * ---------------
 * Import  wali::SYS_rt_sigaction_install(signo, mode, flags, mask_lo, mask_hi)
 *   mode 0 = SIG_DFL  (engine installs kernel SIG_DFL)
 *   mode 1 = SIG_IGN  (engine installs kernel SIG_IGN)
 *   mode 2 = Wasm handler (engine installs its one native stub; Wasm side
 *            stores the actual table index in s_handler_idx[signo])
 *   Returns 0 on success, -errno on failure.
 *
 * Export  __wali_deliver_pending(int signo)
 *   Called by the engine poll path (HANDLE_WALI_SIGNAL / aot_poll_pending_signal)
 *   for each bit set in the host-side pending bitmask.  Dispatches to the
 *   registered Wasm handler via an indirect call (call_indirect through the
 *   function table).
 */

#define _GNU_SOURCE
#include <signal.h>
#include <string.h>
#include <errno.h>
#include <stdint.h>

/* ------------------------------------------------------------------ */
/* Engine import                                                        */
/* ------------------------------------------------------------------ */

/*
 * Installs a signal action on the host kernel.
 *   signo        : Linux signal number
 *   mode         : 0=SIG_DFL, 1=SIG_IGN, 2=Wasm handler
 *   flags        : sa_flags (unsigned int, 32-bit in wasm32)
 *   mask_lo/hi   : low and high 32 bits of the 64-bit kernel signal mask
 *
 * The engine always forces sa_handler to its one async-safe native stub when
 * mode==2; the Wasm function table index is not passed to the engine at all.
 */
__attribute__((__import_module__("wali"),
               __import_name__("SYS_rt_sigaction_install")))
long __engine_rt_sigaction_install(int signo, int mode,
                                   unsigned int flags,
                                   unsigned int mask_lo,
                                   unsigned int mask_hi);

/* ------------------------------------------------------------------ */
/* Wasm-side per-signal state                                          */
/*                                                                     */
/* All state lives in linear memory — no engine involvement required.  */
/* ------------------------------------------------------------------ */

#define WALI_NSIG 64

/*
 * s_handler_idx[signo]: the raw Wasm function-table index (or SIG_DFL/
 * SIG_IGN/SIG_ERR cast to uintptr_t).  Valid Wasm indices are small
 * non-negative integers; SIG_DFL=0, SIG_ERR=(uintptr_t)-1, SIG_IGN=-2
 * are sentinel values (matching wali-musl's signal.h defines).
 */
static uintptr_t s_handler_idx[WALI_NSIG];

/* sa_flags and sa_mask (first 64 bits) as last installed. */
static uint32_t s_flags[WALI_NSIG];
static uint32_t s_mask_lo[WALI_NSIG];
static uint32_t s_mask_hi[WALI_NSIG];

/* ------------------------------------------------------------------ */
/* Deliver export: called by engine poll for each pending signal        */
/* ------------------------------------------------------------------ */

/*
 * __wali_deliver_pending(signo)
 *
 * The engine's HANDLE_WALI_SIGNAL / aot_poll_pending_signal drains the
 * host-side atomic pending bitmask and calls this export once per bit.
 * We resolve the Wasm handler from the table and call it indirectly.
 *
 * This function must NOT be renamed; the engine looks it up by name.
 */
__attribute__((__export_name__("__wali_deliver_pending")))
void __wali_deliver_pending(int signo)
{
    if (signo <= 0 || signo >= WALI_NSIG)
        return;

    uintptr_t idx = s_handler_idx[signo];

    /*
     * Sentinel values: SIG_DFL=0, SIG_ERR=(uintptr_t)-1, SIG_IGN=(uintptr_t)-2
     * For DFL/IGN the kernel stub will never fire or will reset; for ERR
     * we should not have registered it.  Guard defensively.
     */
    if (idx == (uintptr_t)SIG_DFL || idx == (uintptr_t)SIG_IGN
        || idx == (uintptr_t)SIG_ERR)
        return;

    /*
     * Cast the stored index to a function pointer and call indirectly.
     * In wasm32, a void(*)(int) is an index into the module's function
     * table; the compiler emits call_indirect here.
     */
    typedef void (*sig_handler_t)(int);
    sig_handler_t handler = (sig_handler_t)idx;
    handler(signo);
}

/* ------------------------------------------------------------------ */
/* sigaction() — replaces musl's implementation                        */
/* ------------------------------------------------------------------ */

/*
 * Standard sigaction(2) entry called by application libc code.
 *
 * Design:
 *  - oldact is filled entirely from Wasm-side state (s_handler_idx,
 *    s_flags, s_mask_*), so the engine never needs to deal with oldact.
 *  - act is parsed here; only mode + flags + mask are sent to the engine.
 *  - After a successful engine install, Wasm state is updated.
 */
int sigaction(int signo, const struct sigaction *act, struct sigaction *oldact)
{
    if (signo <= 0 || signo >= WALI_NSIG) {
        errno = EINVAL;
        return -1;
    }

    /* --- Fill oldact from stored Wasm state (before any update) --- */
    if (oldact) {
        memset(oldact, 0, sizeof(*oldact));
        /*
         * Restore the handler field: cast stored uintptr_t back to
         * void(*)(int).  This is valid for both real table indices and
         * the SIG_DFL/IGN/ERR sentinels.
         */
        oldact->sa_handler = (void (*)(int))s_handler_idx[signo];
        oldact->sa_flags   = (unsigned long)s_flags[signo];
        /* Write 8 bytes of kernel mask into sa_mask. */
        ((uint32_t *)&oldact->sa_mask)[0] = s_mask_lo[signo];
        ((uint32_t *)&oldact->sa_mask)[1] = s_mask_hi[signo];
    }

    /* Query-only call (act == NULL) */
    if (!act)
        return 0;

    /* --- Parse new action --- */
    uintptr_t new_idx    = (uintptr_t)act->sa_handler;
    uint32_t  new_flags  = (uint32_t)act->sa_flags;
    uint32_t  new_mlo    = ((const uint32_t *)&act->sa_mask)[0];
    uint32_t  new_mhi    = ((const uint32_t *)&act->sa_mask)[1];

    int mode;
    if (new_idx == (uintptr_t)SIG_DFL)
        mode = 0;
    else if (new_idx == (uintptr_t)SIG_IGN)
        mode = 1;
    else
        mode = 2;

    /* --- Ask the engine to perform the kernel rt_sigaction --- */
    long retval = __engine_rt_sigaction_install(signo, mode,
                                                new_flags, new_mlo, new_mhi);
    if (retval != 0) {
        errno = (int)-retval;
        return -1;
    }

    /* --- Update Wasm state on success --- */
    s_handler_idx[signo] = new_idx;
    s_flags[signo]       = new_flags;
    s_mask_lo[signo]     = new_mlo;
    s_mask_hi[signo]     = new_mhi;

    return 0;
}
