#!/usr/bin/env python3
"""
Generate publication-style figures from two mmap benchmark logs (baseline vs optimized).

Example:
  cd benchmarks/report
  python mmap_generate_figures.py \\
    --baseline ../results/wali.txt \\
    --optimized ../results/waliopt.txt \\
    --labels WALI WALI_opt \\
    --outdir ../figures

Or from repo root:
  python benchmarks/report/mmap_generate_figures.py -b wali.txt -o waliopt.txt --outdir figures/
"""

from __future__ import annotations

import argparse
import csv
import sys
from pathlib import Path

import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np

# Allow `python path/to/mmap_generate_figures.py` without PYTHONPATH
_REPORT_DIR = Path(__file__).resolve().parent
if str(_REPORT_DIR) not in sys.path:
    sys.path.insert(0, str(_REPORT_DIR))

from mmap_benchmark_parse import load_log  # noqa: E402


def setup_rc() -> None:
    mpl.rcParams.update(
        {
            "figure.dpi": 150,
            "savefig.dpi": 300,
            "font.size": 10,
            "axes.labelsize": 11,
            "axes.titlesize": 12,
            "legend.fontsize": 9,
            "axes.grid": True,
            "grid.alpha": 0.25,
            "axes.prop_cycle": mpl.cycler(
                color=["#0072B2", "#D55E00", "#009E73", "#CC79A7", "#F0E442"]
            ),
        }
    )


def _fmt_size(n: int) -> str:
    if n >= 1024 * 1024:
        return f"{n // (1024 * 1024)}MiB"
    if n >= 1024:
        return f"{n // 1024}KiB"
    return str(n)


def perf_agg(records: list[dict]) -> tuple[list[tuple[int, int]], list[float], list[float], list[str]]:
    """Mean latency per (load_id, map_size) over rounds."""
    from collections import defaultdict

    m: dict[tuple[int, int], list[float]] = defaultdict(list)
    for r in records:
        if r["kind"] != "perf":
            continue
        key = (r["load_id"], int(r["map_size"]))
        m[key].append(float(r["avg_ns_per_map"]))
    keys = sorted(m.keys())
    means = [float(np.mean(m[k])) for k in keys]
    stds = [
        float(np.std(m[k], ddof=1)) if len(m[k]) > 1 else 0.0 for k in keys
    ]
    xlabels = [f"id{k[0]}\n{_fmt_size(k[1])}" for k in keys]
    return keys, means, stds, xlabels


def fig_latency_microbench(
    base_path: Path,
    opt_path: Path,
    labels: tuple[str, str],
    outdir: Path,
) -> None:
    rb = load_log(base_path)
    ro = load_log(opt_path)
    kb, mb, sb, xb = perf_agg(rb)
    ko, mo, so, _ = perf_agg(ro)

    if not kb:
        return

    key_to_o = {k: i for i, k in enumerate(ko)}
    mo_aligned = [mo[key_to_o[k]] if k in key_to_o else float("nan") for k in kb]
    so_aligned = [so[key_to_o[k]] if k in key_to_o else 0.0 for k in kb]

    x = np.arange(len(kb))
    w = 0.36
    fig, ax = plt.subplots(figsize=(8.5, 3.5))
    ax.bar(x - w / 2, mb, w, yerr=sb, capsize=3, label=labels[0])
    ax.bar(x + w / 2, mo_aligned, w, yerr=so_aligned, capsize=3, label=labels[1])
    ax.set_xticks(x)
    ax.set_xticklabels(xb, fontsize=8)
    ax.set_ylabel("Mean ns / map–touch–unmap")
    ax.set_xlabel("Microbenchmark load (id + region size)")
    ax.set_title("mmap microbenchmark latency")
    ax.legend()
    fig.tight_layout()
    for ext in ("pdf", "png"):
        fig.savefig(outdir / f"fig01_latency_microbench.{ext}")
    plt.close(fig)


def sizesweep_agg(records: list[dict]) -> tuple[list[int], list[float], list[float]]:
    from collections import defaultdict

    g: dict[int, list[float]] = defaultdict(list)
    for r in records:
        if r["kind"] != "suite_sizesweep":
            continue
        g[int(r["size_bytes"])].append(float(r["avg_ns_per_map"]))
    xs = sorted(g.keys())
    ys = [float(np.mean(g[s])) for s in xs]
    es = [float(np.std(g[s], ddof=1)) if len(g[s]) > 1 else 0.0 for s in xs]
    return xs, ys, es


def fig_latency_sizesweep(
    base_path: Path,
    opt_path: Path,
    labels: tuple[str, str],
    outdir: Path,
) -> None:
    fig, ax = plt.subplots(figsize=(7.0, 4.0))
    for path, lab in zip((base_path, opt_path), labels):
        xs, ys, es = sizesweep_agg(load_log(path))
        if not xs:
            continue
        ax.errorbar(
            xs,
            ys,
            yerr=es,
            marker="o",
            linewidth=1.6,
            label=lab,
            capsize=3,
        )
    ax.set_xscale("log", base=2)
    ax.set_yscale("log")
    ax.set_xlabel("Mapped region size (bytes)")
    ax.set_ylabel("Mean ns / map–touch–unmap")
    ax.set_title("Latency vs allocation size (suite sizesweep)")
    ax.legend()
    fig.tight_layout()
    for ext in ("pdf", "png"):
        fig.savefig(outdir / f"fig02_latency_sizesweep.{ext}")
    plt.close(fig)


def frag_series(records: list[dict]) -> dict[str, dict[str, list]]:
    from collections import defaultdict

    d: dict[str, dict[str, list]] = defaultdict(lambda: {"step": [], "frag": []})
    for r in records:
        if r["kind"] != "frag":
            continue
        f = r["frag"]
        lab = f.label
        d[lab]["step"].append(f.step)
        d[lab]["frag"].append(f.frag_ratio)
    return dict(d)


def fig_frag_timeline(
    base_path: Path,
    opt_path: Path,
    labels: tuple[str, str],
    outdir: Path,
) -> None:
    sb = frag_series(load_log(base_path))
    so = frag_series(load_log(opt_path))
    labels_union = sorted(set(sb) | set(so))
    if not labels_union:
        return

    fig, axes = plt.subplots(
        len(labels_union),
        1,
        figsize=(7.5, 2.8 * len(labels_union)),
        squeeze=False,
    )
    flat_axes = axes.flatten()
    for ax, lab in zip(flat_axes, labels_union):
        if lab in sb:
            ax.plot(
                sb[lab]["step"],
                sb[lab]["frag"],
                marker=".",
                label=labels[0],
            )
        if lab in so:
            ax.plot(
                so[lab]["step"],
                so[lab]["frag"],
                marker=".",
                label=labels[1],
            )
        ax.set_ylabel("Fragmentation ratio")
        ax.set_title(f'Workload "{lab}"')
        ax.legend(loc="upper right")
    flat_axes[-1].set_xlabel("Instrumentation step (benchmark phase)")
    fig.suptitle(
        "Allocator fragmentation proxy over benchmark steps",
        y=1.01,
    )
    fig.tight_layout()
    for ext in ("pdf", "png"):
        fig.savefig(outdir / f"fig03_frag_timeline.{ext}", bbox_inches="tight")
    plt.close(fig)


def memory_series(records: list[dict]) -> dict[str, dict[str, list]]:
    from collections import defaultdict

    d: dict[str, dict[str, list]] = defaultdict(
        lambda: {"step": [], "wasm": [], "live": []}
    )
    for r in records:
        if r["kind"] != "frag":
            continue
        f = r["frag"]
        lab = f.label
        d[lab]["step"].append(f.step)
        d[lab]["wasm"].append(f.wasm_bytes)
        d[lab]["live"].append(f.live_bytes)
    return dict(d)


def fig_memory_timeline(
    base_path: Path,
    opt_path: Path,
    labels: tuple[str, str],
    outdir: Path,
) -> None:
    sb = memory_series(load_log(base_path))
    so = memory_series(load_log(opt_path))
    labs = sorted(set(sb) | set(so))
    if not labs:
        return

    for lab in labs:
        fig, ax = plt.subplots(figsize=(8.0, 4.0))
        if lab in sb:
            ax.plot(
                sb[lab]["step"],
                np.asarray(sb[lab]["wasm"], dtype=np.float64) / (1024**2),
                label=f"{labels[0]} Wasm linear",
            )
            ax.plot(
                sb[lab]["step"],
                np.asarray(sb[lab]["live"], dtype=np.float64) / (1024**2),
                linestyle="--",
                label=f"{labels[0]} live mmap",
            )
        if lab in so:
            ax.plot(
                so[lab]["step"],
                np.asarray(so[lab]["wasm"], dtype=np.float64) / (1024**2),
                label=f"{labels[1]} Wasm linear",
            )
            ax.plot(
                so[lab]["step"],
                np.asarray(so[lab]["live"], dtype=np.float64) / (1024**2),
                linestyle="--",
                label=f"{labels[1]} live mmap",
            )
        ax.set_xlabel("Step")
        ax.set_ylabel("MiB")
        ax.set_title(f'Memory footprint vs step — workload "{lab}"')
        ax.legend(ncol=2, fontsize=8)
        fig.tight_layout()
        safe = "".join(c if c.isalnum() else "_" for c in lab)
        for ext in ("pdf", "png"):
            fig.savefig(outdir / f"fig04_memory_timeline_{safe}.{ext}")
        plt.close(fig)


def perf_mean_by_load(records: list[dict]) -> tuple[list[int], list[float]]:
    from collections import defaultdict

    m: dict[int, list[float]] = defaultdict(list)
    for r in records:
        if r["kind"] != "perf":
            continue
        m[int(r["load_id"])].append(float(r["avg_ns_per_map"]))
    keys = sorted(m.keys())
    return keys, [float(np.mean(m[k])) for k in keys]


def fig_speedup(
    base_path: Path,
    opt_path: Path,
    labels: tuple[str, str],
    outdir: Path,
) -> None:
    kb, mb = perf_mean_by_load(load_log(base_path))
    ko, mo = perf_mean_by_load(load_log(opt_path))
    if not kb:
        return

    idx_o = {k: i for i, k in enumerate(ko)}
    speedup = []
    for k, b in zip(kb, mb):
        if k not in idx_o:
            speedup.append(float("nan"))
        else:
            o = mo[idx_o[k]]
            speedup.append(b / o if o > 0 else float("nan"))

    fig, ax = plt.subplots(figsize=(7.0, 3.5))
    ax.bar(np.arange(len(speedup)), speedup, color="#009E73")
    ax.axhline(1.0, color="gray", linestyle="--", linewidth=1)
    ax.set_xticks(np.arange(len(speedup)))
    ax.set_xticklabels([f"load {k}" for k in kb])
    ax.set_ylabel(f"{labels[0]} / {labels[1]} latency")
    ax.set_title("Relative latency (>1 means optimized is faster)")
    fig.tight_layout()
    for ext in ("pdf", "png"):
        fig.savefig(outdir / f"fig05_speedup_microbench.{ext}")
    plt.close(fig)


def fig_many_live(
    base_path: Path,
    opt_path: Path,
    labels: tuple[str, str],
    outdir: Path,
) -> None:
    """Bar chart for map_total_ns and touch_total_ns from many_live suite mode."""

    def pick(records: list[dict], kind: str) -> float | None:
        for r in records:
            if r["kind"] == kind:
                return float(r["total_ns"])
        return None

    rb = load_log(base_path)
    ro = load_log(opt_path)
    map_b = pick(rb, "suite_many_live_map")
    map_o = pick(ro, "suite_many_live_map")
    touch_b = pick(rb, "suite_many_live_touch")
    touch_o = pick(ro, "suite_many_live_touch")
    if map_b is None and touch_b is None:
        return

    metrics = []
    if map_b is not None or map_o is not None:
        metrics.append(("map phase (ns)", map_b, map_o))
    if touch_b is not None or touch_o is not None:
        metrics.append(("touch phase (ns)", touch_b, touch_o))

    x = np.arange(len(metrics))
    w = 0.36
    fig, ax = plt.subplots(figsize=(6.5, 3.5))
    vb = [m[1] if m[1] is not None else 0.0 for m in metrics]
    vo = [m[2] if m[2] is not None else 0.0 for m in metrics]
    ax.bar(x - w / 2, vb, w, label=labels[0])
    ax.bar(x + w / 2, vo, w, label=labels[1])
    ax.set_xticks(x)
    ax.set_xticklabels([m[0] for m in metrics])
    ax.set_ylabel("Time (ns)")
    ax.set_title("many_live suite (mmap storm + full touch)")
    ax.legend()
    fig.tight_layout()
    for ext in ("pdf", "png"):
        fig.savefig(outdir / f"fig06_many_live.{ext}")
    plt.close(fig)


def write_summary_csv(
    base_path: Path,
    opt_path: Path,
    labels: tuple[str, str],
    outdir: Path,
) -> None:
    rows: list[dict[str, object]] = []
    for tag, path in ((labels[0], base_path), (labels[1], opt_path)):
        for r in load_log(path):
            if r["kind"] == "perf":
                rows.append(
                    {
                        "variant": tag,
                        "bench": "micro_mmap",
                        "load_id": r["load_id"],
                        "map_size": r["map_size"],
                        "round": r["round"],
                        "avg_ns_per_map": r["avg_ns_per_map"],
                        "total_ns": r["total_ns"],
                    }
                )
            elif r["kind"] == "suite_sizesweep":
                rows.append(
                    {
                        "variant": tag,
                        "bench": "sizesweep",
                        "map_size": r["size_bytes"],
                        "round": r["round"],
                        "avg_ns_per_map": r["avg_ns_per_map"],
                        "total_ns": r["total_ns"],
                    }
                )
            elif r["kind"] == "frag":
                f = r["frag"]
                rows.append(
                    {
                        "variant": tag,
                        "bench": f"frag_{f.label}",
                        "step": f.step,
                        "wasm_bytes": f.wasm_bytes,
                        "live_bytes": f.live_bytes,
                        "wasted_bytes": f.wasted_bytes,
                        "frag_ratio": f.frag_ratio,
                        "peak_live": f.peak_live,
                    }
                )
            elif r["kind"] == "suite_many_live_map":
                rows.append(
                    {
                        "variant": tag,
                        "bench": "many_live_map",
                        "total_ns": r["total_ns"],
                        "count": r["count"],
                    }
                )
            elif r["kind"] == "suite_many_live_touch":
                rows.append(
                    {
                        "variant": tag,
                        "bench": "many_live_touch",
                        "total_ns": r["total_ns"],
                        "count": r["count"],
                    }
                )

    if not rows:
        return
    fields = sorted({k for row in rows for k in row})
    out = outdir / "summary_tables.csv"
    with out.open("w", newline="", encoding="utf-8") as fp:
        w = csv.DictWriter(fp, fieldnames=fields)
        w.writeheader()
        w.writerows(rows)


def main() -> None:
    setup_rc()
    ap = argparse.ArgumentParser(
        description="Generate mmap benchmark figures for papers / reports."
    )
    ap.add_argument(
        "--baseline",
        "-b",
        type=Path,
        required=True,
        help="Log file from baseline system (e.g. WALI)",
    )
    ap.add_argument(
        "--optimized",
        "-o",
        type=Path,
        required=True,
        help="Log file from optimized system (e.g. WALI_opt)",
    )
    ap.add_argument(
        "--labels",
        nargs=2,
        default=("WALI", "WALI_opt"),
        metavar=("BASE", "OPT"),
        help="Legend labels for baseline vs optimized",
    )
    ap.add_argument(
        "--outdir",
        type=Path,
        default=Path("figures"),
        help="Output directory for PDF/PNG and summary_tables.csv",
    )
    args = ap.parse_args()
    args.outdir.mkdir(parents=True, exist_ok=True)

    labels = (args.labels[0], args.labels[1])

    fig_latency_microbench(args.baseline, args.optimized, labels, args.outdir)
    fig_latency_sizesweep(args.baseline, args.optimized, labels, args.outdir)
    fig_frag_timeline(args.baseline, args.optimized, labels, args.outdir)
    fig_memory_timeline(args.baseline, args.optimized, labels, args.outdir)
    fig_speedup(args.baseline, args.optimized, labels, args.outdir)
    fig_many_live(args.baseline, args.optimized, labels, args.outdir)
    write_summary_csv(args.baseline, args.optimized, labels, args.outdir)

    print(f"Wrote figures and summary_tables.csv to {args.outdir.resolve()}")


if __name__ == "__main__":
    main()
