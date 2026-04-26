#!/usr/bin/env bash
# rebuild-mmap.sh
#
# Enforces the correct rebuild order for the WALI mmap allocator stack so that
# stale objects never mask allocator changes during development.
#
# Usage:
#   ./scripts/rebuild-mmap.sh [--rt] [--musl] [--engine] [--all]
#
# Flags (combinable):
#   --rt        Rebuild compiler-rt builtins and install into clang.
#               Use after editing wali_mmap_alloc.c or wali_rt.c.
#   --musl      Clean-rebuild musl libc sysroot.
#               Use after editing wali-musl/arch/wasm32/syscall_arch.h
#               or any musl syscall glue.
#   --engine    Rebuild the iwasm engine binary.
#               Use after editing wasm-micro-runtime/.../wali.c.
#   --all       Equivalent to --musl --rt --engine.
#
# The script always finishes with:
#   1. A targeted rebuild of the mmap_allocator test.
#   2. WAT symbol verification (checks correct raw-import / Wasm-export wiring).
#   3. Execution of the three allocator sub-tests via iwasm.
#
# Exit code: 0 if every step succeeds, non-zero on first failure.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

source "$ROOT_DIR/toolchains/wali.sh"

# ---------------------------------------------------------------------------
# Argument parsing
# ---------------------------------------------------------------------------
DO_RT=0
DO_MUSL=0
DO_ENGINE=0

if [[ $# -eq 0 ]]; then
    echo "[rebuild-mmap] No component flag given — running test + verify only."
fi

for arg in "$@"; do
    case "$arg" in
        --rt)     DO_RT=1 ;;
        --musl)   DO_MUSL=1 ;;
        --engine) DO_ENGINE=1 ;;
        --all)    DO_RT=1; DO_MUSL=1; DO_ENGINE=1 ;;
        *)
            echo "Unknown flag: $arg" >&2
            echo "Usage: $0 [--rt] [--musl] [--engine] [--all]" >&2
            exit 1
            ;;
    esac
done

# ---------------------------------------------------------------------------
# Step 1: musl clean + libc (must precede rt so sysroot headers are current)
# ---------------------------------------------------------------------------
if [[ $DO_MUSL -eq 1 ]]; then
    echo ""
    echo "=== [1/4] Rebuilding musl libc (clean) ==="
    make -C "$ROOT_DIR/wali-musl" clean
    make -C "$ROOT_DIR" libc
    echo "=== musl libc rebuilt ==="
fi

# ---------------------------------------------------------------------------
# Step 2: compiler-rt builtins -> install into clang
# ---------------------------------------------------------------------------
if [[ $DO_RT -eq 1 ]]; then
    echo ""
    echo "=== [2/4] Rebuilding compiler-rt builtins ==="
    (cd "$ROOT_DIR/toolchains/rt_builtins" && bash update.sh)
    make -C "$ROOT_DIR" wali-compiler
    echo "=== compiler-rt archive installed into clang ==="
fi

# ---------------------------------------------------------------------------
# Step 3: engine (iwasm)
# ---------------------------------------------------------------------------
if [[ $DO_ENGINE -eq 1 ]]; then
    echo ""
    echo "=== [3/4] Rebuilding iwasm engine ==="
    make -C "$ROOT_DIR" iwasm
    echo "=== iwasm engine rebuilt ==="
fi

# ---------------------------------------------------------------------------
# Step 4: (Re)build the mmap_allocator test in isolation
# ---------------------------------------------------------------------------
echo ""
echo "=== [4/4] Building mmap_allocator test ==="
WASM_OUT="$ROOT_DIR/tests/bin/unit/wasm/mmap_allocator.wasm"
WAT_OUT="${WASM_OUT%.wasm}.wat"
mkdir -p "$(dirname "$WASM_OUT")"

"$WALI_CC" $WALI_COMMON_CFLAGS $WALI_COMMON_LDFLAGS \
    -I"$ROOT_DIR/tests" \
    -I"$ROOT_DIR/tests/common" \
    -nostartfiles -Wl,--no-entry -Wl,--allow-undefined \
    -o "$WASM_OUT" \
    "$ROOT_DIR/tests/unit/mmap_allocator.c"

wasm2wat --enable-threads "$WASM_OUT" -o "$WAT_OUT"
echo "=== mmap_allocator.wasm + .wat written ==="

# ---------------------------------------------------------------------------
# WAT symbol verification
# ---------------------------------------------------------------------------
echo ""
echo "=== WAT symbol verification ==="

fail=0

wat_must_contain() {
    local pattern="$1"
    local label="$2"
    if grep -qF "$pattern" "$WAT_OUT"; then
        echo "  [OK ] $label"
    else
        echo "  [FAIL] $label  -- expected: $pattern" >&2
        fail=1
    fi
}

wat_must_not_contain() {
    local pattern="$1"
    local label="$2"
    if ! grep -qF "$pattern" "$WAT_OUT"; then
        echo "  [OK ] $label"
    else
        echo "  [FAIL] $label  -- unexpected: $pattern" >&2
        fail=1
    fi
}

# Raw engine imports must be present (allocator path active)
wat_must_contain     '(import "wali" "SYS_mmap_raw"'   "import wali.SYS_mmap_raw"
wat_must_contain     '(import "wali" "SYS_munmap_raw"' "import wali.SYS_munmap_raw"
wat_must_contain     '(import "wali" "SYS_mremap_raw"' "import wali.SYS_mremap_raw"

# Wasm-side allocator shim must be exported so the engine can resolve it
wat_must_contain     '(export "SYS_mmap"'    "export SYS_mmap (Wasm allocator shim)"
wat_must_contain     '(export "SYS_munmap"'  "export SYS_munmap"
wat_must_contain     '(export "SYS_mremap"'  "export SYS_mremap"

# The module itself must NOT import the non-raw variants; musl must route
# through the Wasm-side shim, not bypass it to the engine directly.
wat_must_not_contain '(import "wali" "SYS_mmap"'    "no direct import of wali.SYS_mmap (non-raw)"
wat_must_not_contain '(import "wali" "SYS_munmap"'  "no direct import of wali.SYS_munmap (non-raw)"

if [[ $fail -ne 0 ]]; then
    echo ""
    echo "WAT verification FAILED. The wasm module does not have the expected" >&2
    echo "allocator wiring. Likely causes:" >&2
    echo "  - compiler-rt archive not updated (run --rt)" >&2
    echo "  - musl libc not rebuilt after syscall_arch.h change (run --musl)" >&2
    echo "  - make wali-compiler not run after update.sh (run --rt)" >&2
    exit 1
fi
echo "=== WAT verification passed ==="

# ---------------------------------------------------------------------------
# Run allocator sub-tests
# ---------------------------------------------------------------------------
echo ""
echo "=== Running allocator tests via iwasm ==="

IWASM="$ROOT_DIR/iwasm"
run_subtest() {
    local mode="$1"
    printf "  %-8s " "$mode:"
    if "$IWASM" "$WASM_OUT" "$mode"; then
        echo "PASS"
    else
        echo "FAIL" >&2
        fail=1
    fi
}

run_subtest basic
run_subtest reuse
run_subtest grow

if [[ $fail -ne 0 ]]; then
    echo ""
    echo "One or more allocator sub-tests FAILED." >&2
    exit 1
fi

echo "=== All allocator tests passed ==="
echo ""
echo "Rebuild complete."
