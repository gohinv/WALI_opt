#!/usr/bin/env python3
"""
Profile mmap/munmap syscall latency for a program or an already-running process.

Uses strace (-T = time spent in syscall). Requires: strace, Python 3.6+.

Examples:
  ./mmap_profile.py run -- ./myapp arg1
  ./mmap_profile.py attach 12345
  ./mmap_profile.py run --strace-bin /usr/bin/strace -- ./iwasm prog.wasm
"""

from __future__ import annotations

import argparse
import os
import re
import shutil
import signal
import statistics
import subprocess
import sys
import tempfile
from dataclasses import dataclass, field
from typing import List, Optional, Tuple


# With strace -f: "811489 mmap(NULL, 4096, ...) = 0x... <0.000012>"
# Older: "[pid 811489] mmap(...)" — allow optional pid / thread prefix.
MMAP_RE = re.compile(
    r"^(?:\d+\s+)?(?:\[[^]]*\]\s+)?mmap\([^,]*,\s*(\d+),.*\)\s*=\s*[^\s]+\s*<([\d.]+)>"
)
MUNMAP_RE = re.compile(
    r"^(?:\d+\s+)?(?:\[[^]]*\]\s+)?munmap\([^,]*,\s*(\d+)\)\s*=\s*[^\s]+\s*<([\d.]+)>"
)


@dataclass
class SyscallStats:
    times_s: List[float] = field(default_factory=list)
    sizes: List[int] = field(default_factory=list)

    def add(self, size: int, t_s: float) -> None:
        self.sizes.append(size)
        self.times_s.append(t_s)


def percentile(sorted_vals: List[float], q: float) -> float:
    if not sorted_vals:
        return 0.0
    n = len(sorted_vals)
    pos = q * (n - 1)
    lo = int(pos)
    hi = min(lo + 1, n - 1)
    frac = pos - lo
    return sorted_vals[lo] + (sorted_vals[hi] - sorted_vals[lo]) * frac


def summarize(name: str, st: SyscallStats) -> None:
    if not st.times_s:
        print(f"  {name}: no events")
        return
    t = sorted(st.times_s)
    us = [x * 1e6 for x in t]
    print(f"  {name}:")
    print(f"    count     : {len(t)}")
    print(f"    time (µs) : min={us[0]:.3f}  max={us[-1]:.3f}  mean={statistics.mean(us):.3f}  "
          f"stdev={statistics.pstdev(us) if len(us) > 1 else 0.0:.3f}")
    print(f"              p50={percentile(t, 0.50) * 1e6:.3f}  "
          f"p95={percentile(t, 0.95) * 1e6:.3f}  p99={percentile(t, 0.99) * 1e6:.3f}")
    if st.sizes and name == "mmap":
        sz = st.sizes
        print(f"    sizes (B) : min={min(sz)}  max={max(sz)}  "
              f"mean={statistics.mean(sz):.1f}")


def parse_strace_log(path: str) -> Tuple[SyscallStats, SyscallStats]:
    mmap_s = SyscallStats()
    munmap_s = SyscallStats()
    with open(path, "r", errors="replace") as f:
        for line in f:
            line = line.strip()
            m = MMAP_RE.match(line)
            if m:
                size, t = int(m.group(1)), float(m.group(2))
                mmap_s.add(size, t)
                continue
            m = MUNMAP_RE.match(line)
            if m:
                size, t = int(m.group(1)), float(m.group(2))
                munmap_s.add(size, t)
    return mmap_s, munmap_s


def run_strace(
    strace_bin: str,
    out_log: str,
    attach_pid: Optional[int],
    child_cmd: Optional[List[str]],
    follow_forks: bool,
    pass_io: bool,
) -> int:
    cmd = [strace_bin, "-qq", "-e", "trace=mmap,munmap", "-T", "-o", out_log]
    if follow_forks:
        cmd.insert(1, "-f")
    if attach_pid is not None:
        cmd.extend(["-p", str(attach_pid)])
        print(f"Attaching to PID {attach_pid}; press Ctrl+C to stop and summarize.", file=sys.stderr)
        proc = subprocess.Popen(cmd)
        try:
            return proc.wait()
        except KeyboardInterrupt:
            proc.send_signal(signal.SIGINT)
            try:
                return proc.wait(timeout=10)
            except subprocess.TimeoutExpired:
                proc.terminate()
                return proc.wait()
    else:
        if not child_cmd:
            raise ValueError("child_cmd required when not attaching")
        cmd.append("--")
        cmd.extend(child_cmd)
        kwargs = {}
        if not pass_io:
            kwargs["stdout"] = subprocess.DEVNULL
            kwargs["stderr"] = subprocess.DEVNULL
        return subprocess.call(cmd, **kwargs)


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Intercept mmap/munmap via strace and summarize syscall latency."
    )
    ap.add_argument(
        "--strace-bin",
        default=shutil.which("strace") or "strace",
        help="strace executable (default: PATH)",
    )
    ap.add_argument(
        "--no-follow-forks",
        action="store_true",
        help="Omit strace -f (do not trace children).",
    )
    ap.add_argument(
        "--keep-log",
        metavar="PATH",
        help="Copy the raw strace log to PATH after the run.",
    )
    ap.add_argument(
        "--pass-io",
        action="store_true",
        help="Let the traced program inherit stdout/stderr (default: discard for cleaner reports).",
    )

    sub = ap.add_subparsers(dest="mode", required=True)

    p_run = sub.add_parser("run", help="Run a command under strace.")
    p_run.add_argument(
        "cmd",
        nargs=argparse.REMAINDER,
        help="Command after -- , e.g. run -- ./app a b",
    )

    p_att = sub.add_parser("attach", help="Attach to an existing PID (Ctrl+C to finish).")
    p_att.add_argument("pid", type=int)

    args = ap.parse_args()
    if args.mode == "run":
        if not args.cmd or args.cmd[0] != "--" or len(args.cmd) < 2:
            p_run.error("Usage: mmap_profile.py run -- <command> [args...]")
        child = list(args.cmd[1:])
    else:
        child = None

    strace_bin = args.strace_bin
    if not os.path.isfile(strace_bin) and not shutil.which(strace_bin):
        print(f"strace not found: {strace_bin}", file=sys.stderr)
        return 2

    fd, tmp_path = tempfile.mkstemp(prefix="mmap_profile_", suffix=".log")
    os.close(fd)

    try:
        attach_pid = getattr(args, "pid", None) if args.mode == "attach" else None
        rc = run_strace(
            strace_bin,
            tmp_path,
            attach_pid=attach_pid,
            child_cmd=child,
            follow_forks=not args.no_follow_forks,
            pass_io=args.pass_io,
        )
    finally:
        pass

    mmap_stats, munmap_stats = parse_strace_log(tmp_path)
    print("mmap/munmap syscall time (strace -T, seconds inside kernel for each call)\n")
    summarize("mmap", mmap_stats)
    summarize("munmap", munmap_stats)

    if args.keep_log:
        shutil.copy2(tmp_path, args.keep_log)
        print(f"\nRaw strace log: {args.keep_log}", file=sys.stderr)
    else:
        print(f"\nRaw strace log (temporary): {tmp_path}", file=sys.stderr)

    if mmap_stats.times_s or munmap_stats.times_s:
        # Non-zero rc from strace is common on attach interrupt; still useful stats
        return 0 if rc in (0, 128 + signal.SIGINT) else rc
    print("\nNo mmap/munmap lines parsed — check permissions (attach needs ptrace rights) "
          "or whether the workload calls mmap.", file=sys.stderr)
    return 1 if rc != 0 else 0


if __name__ == "__main__":
    sys.exit(main())
