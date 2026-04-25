#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./scripts/sync-wali-submodules.sh
# Optional:
#   JOBS=8 ./scripts/sync-wali-submodules.sh

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [[ -z "${REPO_ROOT}" ]]; then
  echo "Error: not inside a git repository."
  exit 1
fi

cd "${REPO_ROOT}"

JOBS="${JOBS:-$(nproc)}"

echo "[1/4] Sync submodule URLs/config..."
git submodule sync -- wali-musl wasm-micro-runtime

echo "[2/4] Update submodules to commits pinned by this branch..."
git submodule update --init --recursive --checkout wali-musl wasm-micro-runtime

echo "[3/4] Rebuild WAMR runtime (iwasm)..."
make -j"${JOBS}" iwasm

echo "[4/4] Rebuild wali-musl sysroot (libc)..."
make -j"${JOBS}" libc

echo "Done. Submodules and builds are now aligned with branch: $(git rev-parse --abbrev-ref HEAD)"