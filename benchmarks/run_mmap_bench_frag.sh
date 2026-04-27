#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$(dirname "$0")"

WASM="${1:-./mmap_frag_bench.wasm}"
IWASM="${IWASM:-$ROOT/iwasm}"
WALI_ENV_FILE="${WALI_ENV_FILE:-/tmp/wali.env}"

MODES=(churn interleave sawtooth)

printf '' > "$WALI_ENV_FILE"

echo "mode,exit_code"

for m in "${MODES[@]}"; do
  set +e
  out="$("$IWASM" --env-file="$WALI_ENV_FILE" "$WASM" "$m" 2>&1)"
  ec=$?
  set -e
  printf '%s\n' "$out"
  echo "${m},${ec}"
done