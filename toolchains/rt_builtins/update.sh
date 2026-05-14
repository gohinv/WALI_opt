#!/bin/bash
#
# Compile WALI rt builtins and bundle into LLVM builtin archive
set -euo pipefail

source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/../wali.sh"

LLVM_VERSION=22
llvm_builtin="llvm-${LLVM_VERSION}.libclang_rt.builtins-wasm32-wali.a"

# Build object files
"$WALI_CC" $WALI_COMMON_CFLAGS -c wali_rt.c -o wali_rt.o
"$WALI_CC" $WALI_COMMON_CFLAGS -c wali_mmap_alloc.c -o wali_mmap_alloc.o
"$WALI_CC" $WALI_COMMON_CFLAGS -c wali_signal.c -o wali_signal.o

# Create/update archive with all objects
"$WALI_LLVM_BIN_DIR/llvm-ar" rcs "$llvm_builtin" wali_rt.o wali_mmap_alloc.o wali_signal.o

# Optional: index archive explicitly (usually covered by rcs)
# "$WALI_LLVM_BIN_DIR/llvm-ranlib" "$llvm_builtin"

# Cleanup
rm -f wali_rt.o wali_mmap_alloc.o wali_signal.o