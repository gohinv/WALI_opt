# Benchmark report figures

Python tooling to turn captured mmap benchmark logs into PDF/PNG figures and a flattened CSV for papers.

## Dependencies

```bash
pip install -r requirements.txt
```

## Capture logs

Run the suite twice (different `IWASM` / engines), saving stdout:

```bash
cd benchmarks
VARIANT=WALI    IWASM=/path/to/iwasm_baseline ./run_mmap_suite.sh ... 2>&1 | tee results/wali_run.txt
VARIANT=WALIopt IWASM=/path/to/iwasm_opt      ./run_mmap_suite.sh ... 2>&1 | tee results/waliopt_run.txt
```

Use the **same** `.wasm` artifacts and environment flags for a fair comparison.

## Generate figures

```bash
cd benchmarks/report
python mmap_generate_figures.py \
  --baseline ../results/wali_run.txt \
  --optimized ../results/waliopt_run.txt \
  --labels WALI WALI_opt \
  --outdir ../figures
```

Outputs (300 DPI PNG + PDF where applicable):

| File | Contents |
|------|-----------|
| `fig01_latency_microbench.*` | Mean ns/map across perf script loads |
| `fig02_latency_sizesweep.*` | Mean latency vs region size (suite) |
| `fig03_frag_timeline.*` | Fragmentation ratio vs logical step per workload label |
| `fig04_memory_timeline_<label>.*` | Wasm linear vs live mmap bytes vs step |
| `fig05_speedup_microbench.*` | Baseline/optimized latency ratio per load |
| `fig06_many_live.*` | Map-phase vs touch-phase times (if suite ran many_live) |
| `summary_tables.csv` | Long-form metrics for LaTeX/table tools |

## Parser API

`mmap_benchmark_parse.load_log(path)` returns a list of dict rows (`kind` discriminant). Use `mmap_benchmark_parse.parse_line` for single-line tests.
