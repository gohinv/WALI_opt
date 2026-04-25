#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./run_mmap_bench.sh [wasm_path]
# Example:
#   ./run_mmap_bench.sh ./mmap_bench.wasm

WASM="${1:-./mmap_bench.wasm}"
IWASM="${IWASM:-../iwasm}"
ROUNDS="${ROUNDS:-5}"

# (maps_per_round, map_size)
LOADS=(
  "100 4096"
  "500 4096"
  "1000 4096"
  "200 65536"
  "500 65536"
  "100 1048576"
)

echo "load_id,maps,map_size,round,total_ns,avg_ns_per_map"

load_id=0
for l in "${LOADS[@]}"; do
  maps="$(awk '{print $1}' <<<"$l")"
  size="$(awk '{print $2}' <<<"$l")"

  # Skip CSV header from benchmark output with tail -n +2
  "$IWASM" "$WASM" "$maps" "$size" "$ROUNDS" | tail -n +2 | while IFS=, read -r round maps_out size_out total avg; do
    echo "${load_id},${maps_out},${size_out},${round},${total},${avg}"
  done

  load_id=$((load_id + 1))
done