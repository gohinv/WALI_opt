#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$(dirname "$0")"

IWASM="${IWASM:-$ROOT/iwasm}"
WALI_ENV_FILE="${WALI_ENV_FILE:-/tmp/wali.env}"
VARIANT="${VARIANT:-run}"
WASM_PERF="${1:-./mmap_bench.wasm}"
WASM_FRAG="${2:-./mmap_frag_bench.wasm}"
WASM_SUITE="${3:-./mmap_suite_bench.wasm}"

echo "# variant=$VARIANT iwasm=$IWASM"
echo "## perf (run_mmap_bench_perf loads)"
VARIANT="$VARIANT" IWASM="$IWASM" WALI_ENV_FILE="$WALI_ENV_FILE" \
  ./run_mmap_bench_perf.sh "$WASM_PERF" | sed "s/^/${VARIANT},perf,/"

echo "## frag"
while IFS= read -r line; do echo "${VARIANT},frag,${line}"; done < <(
  IWASM="$IWASM" WALI_ENV_FILE="$WALI_ENV_FILE" ./run_mmap_bench_frag.sh "$WASM_FRAG" 2>&1
)

ROUNDS="${ROUNDS:-3}"
for mode in "roundtrip 200 65536 $ROUNDS" "sizesweep 100 $ROUNDS" "many_live 256" "frag_hole"; do
  set -- $mode
  echo "${VARIANT},suite,--- $* ---"
  "$IWASM" --env-file="$WALI_ENV_FILE" "$WASM_SUITE" "$@" 2>&1 | while IFS= read -r line; do
    echo "${VARIANT},suite,${line}"
  done
done