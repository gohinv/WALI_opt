#!/usr/bin/env python3
"""
Parse mmap benchmark logs produced by run_mmap_bench_perf.sh, run_mmap_bench_frag.sh,
run_mmap_suite.sh, or raw workload stdout.

Typical prefixed lines (run_mmap_suite.sh):
  wali,perf,load_id,maps,map_size,round,total_ns,avg_ns_per_map
  wali,suite,FRAG,churn,1,wasm_bytes=...,live=...,...
  wali,frag,FRAG,churn,1,...

Legacy / bare:
  0,100,4096,0,12345,123.45
  FRAG,churn,1,wasm_bytes=...
"""

from __future__ import annotations

import re
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterator


@dataclass
class FragSnapshot:
    variant: str
    label: str
    step: int
    wasm_bytes: int
    live_bytes: int
    wasted_bytes: int
    frag_ratio: float
    peak_live: int
    mmap_calls: int
    munmap_calls: int
    live_count: int


FRAG_RE = re.compile(
    r"FRAG,(?P<label>[^,]+),(?P<step>\d+),"
    r"wasm_bytes=(?P<wasm>\d+),live=(?P<live>\d+),wasted=(?P<wasted>\d+),"
    r"frag=(?P<frag>[\d.eE+-]+),"
    r"peak_live=(?P<peak>\d+),mmap_calls=(?P<mmaps>\d+),munmap_calls=(?P<munmaps>\d+),"
    r"live_count=(?P<live_count>-?\d+)"
)


def iter_lines(path: Path | str) -> Iterator[str]:
    text = Path(path).read_text(encoding="utf-8", errors="replace")
    for line in text.splitlines():
        s = line.strip()
        if not s:
            continue
        # Comments / section headers from shell wrappers
        if s.startswith("#") or s.startswith("##"):
            continue
        if "# variant=" in s and s.startswith("#"):
            continue
        yield s


def _parse_frag_body(variant: str, body: str) -> dict[str, Any] | None:
    body_nospace = body.replace(" ", "")
    m = FRAG_RE.search(body_nospace)
    if not m:
        return None
    g = m.groupdict()
    return {
        "kind": "frag",
        "variant": variant,
        "frag": FragSnapshot(
            variant=variant,
            label=g["label"],
            step=int(g["step"]),
            wasm_bytes=int(g["wasm"]),
            live_bytes=int(g["live"]),
            wasted_bytes=int(g["wasted"]),
            frag_ratio=float(g["frag"]),
            peak_live=int(g["peak"]),
            mmap_calls=int(g["mmaps"]),
            munmap_calls=int(g["munmaps"]),
            live_count=int(g["live_count"]),
        ),
    }


def _parse_perf_rest(variant: str, rest: str) -> dict[str, Any] | None:
    cols = rest.split(",")
    if len(cols) < 6:
        return None
    if cols[0] == "load_id":
        return None
    if not cols[0].strip().isdigit():
        return None
    return {
        "kind": "perf",
        "variant": variant,
        "load_id": int(cols[0]),
        "maps": int(cols[1]),
        "map_size": int(cols[2]),
        "round": int(cols[3]),
        "total_ns": int(cols[4]),
        "avg_ns_per_map": float(cols[5]),
    }


def _parse_suite_rest(variant: str, rest: str) -> dict[str, Any] | None:
    rest = rest.strip()
    if not rest:
        return None
    if rest.startswith("FRAG,"):
        return _parse_frag_body(variant, rest)

    cols = rest.split(",")
    if not cols:
        return None

    if cols[0] == "bench":
        return None

    if cols[0] == "roundtrip" and len(cols) >= 6:
        return {
            "kind": "suite_roundtrip",
            "variant": variant,
            "round": int(cols[1]),
            "maps": int(cols[2]),
            "map_size": int(cols[3]),
            "total_ns": int(cols[4]),
            "avg_ns_per_map": float(cols[5]),
        }

    if cols[0] == "sizesweep" and len(cols) >= 6:
        return {
            "kind": "suite_sizesweep",
            "variant": variant,
            "size_bytes": int(cols[1]),
            "round": int(cols[2]),
            "maps": int(cols[3]),
            "total_ns": int(cols[4]),
            "avg_ns_per_map": float(cols[5]),
        }

    if cols[0] == "many_live" and len(cols) >= 3:
        phase = cols[1]
        if phase == "map_done" and len(cols) >= 4 and "map_total_ns=" in cols[3]:
            ns = int(cols[3].split("=", 1)[1])
            return {
                "kind": "suite_many_live_map",
                "variant": variant,
                "count": int(cols[2]),
                "total_ns": ns,
            }
        if phase == "touch_done" and len(cols) >= 4 and "touch_total_ns=" in cols[3]:
            ns = int(cols[3].split("=", 1)[1])
            return {
                "kind": "suite_many_live_touch",
                "variant": variant,
                "count": int(cols[2]),
                "total_ns": ns,
            }
        return None

    if cols[0] == "file_map" and len(cols) >= 4:
        return {
            "kind": "suite_file_map",
            "variant": variant,
            "phase": cols[1],
            "size_bytes": int(cols[2]),
            "total_ns": int(cols[3]),
        }

    return None


def parse_line(line: str) -> dict[str, Any] | None:
    line = line.strip()
    if not line:
        return None
    if "---" in line:
        return None

    parts = line.split(",", 2)
    if len(parts) >= 3 and parts[1] in ("perf", "suite", "frag"):
        variant = parts[0]
        section = parts[1]
        rest = parts[2]
        if section == "perf":
            return _parse_perf_rest(variant, rest)
        if section in ("suite", "frag"):
            if rest.startswith("FRAG,"):
                return _parse_frag_body(variant, rest)
            return _parse_suite_rest(variant, rest)

    if line.startswith("FRAG,"):
        return _parse_frag_body("", line)

    # Bare perf CSV (run_mmap_bench_perf.sh without variant prefix)
    cols = line.split(",")
    if len(cols) >= 6 and cols[0].isdigit():
        return _parse_perf_rest("", line)

    return _parse_suite_rest("", line)


def load_log(path: Path | str) -> list[dict[str, Any]]:
    out: list[dict[str, Any]] = []
    for raw in iter_lines(path):
        row = parse_line(raw)
        if row:
            out.append(row)
    return out
