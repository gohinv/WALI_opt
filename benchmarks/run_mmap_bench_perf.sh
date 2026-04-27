#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./run_mmap_bench.sh [wasm_path]
# Example:
#   ./run_mmap_bench.sh ./mmap_bench.wasm

WASM="${1:-./mmap_bench.wasm}"
IWASM="${IWASM:-../iwasm}"
ROUNDS="${ROUNDS:-5}"

WALI_ENV_FILE="${WALI_ENV_FILE:-/tmp/wali.env}"

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
  # "$IWASM" --env-file="$WALI_ENV_FILE" "$WASM" "$maps" "$size" "$ROUNDS" | tail -n +2 | while IFS=, read -r round maps_out size_out total avg; do
  #   echo "${load_id},${maps_out},${size_out},${round},${total},${avg}"
  # done

  "$IWASM" --env-file="$WALI_ENV_FILE" "$WASM" "$maps" "$size" "$ROUNDS" \
    | awk -F',' '
        {
          for (i=1; i<=NF; i++) gsub(/^[[:space:]]+|[[:space:]]+$/, "", $i);
          gsub(/\r/, "", $0);
        }
        NF==5 &&
        $1 ~ /^[0-9]+$/ &&
        $2 ~ /^[0-9]+$/ &&
        $3 ~ /^[0-9]+$/ &&
        $4 ~ /^[0-9]+$/ &&
        $5 ~ /^[0-9]+(\.[0-9]+)?$/ {
          print
        }' \
    | while IFS=, read -r round maps_out size_out total avg; do
        echo "${load_id},${maps_out},${size_out},${round},${total},${avg}"
      done
  load_id=$((load_id + 1))
done