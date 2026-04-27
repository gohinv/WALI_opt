# Benchmarks for WALIopt

Here, we profile the performance of the `mmap`, `munmap`, and `mremap` system calls within WALI and WALIopt.
In WALI, these system calls are linked and implemented in the engine, which contains logic for the simple memory allocator.

In WALIopt, we update this by creating a Wasm module within the toolchain itself to provide memory allocation capability. This redirects the linking to the toolchain for memory allocation before the engine.

We are interested in benchmarking the overall performance between both. The benchmarking script accumulates the combined cost of the mmap syscall path, the page-touch loop, and the munmap syscall path to help gauge the efficiency of the memory allocator. 

```
cd benchmarks

# compile mmap_bench.c to mmap_bench.wasm
../examples/compile-wali-standalone.sh -o mmap_bench.wasm mmap_bench.c

# run shell script to gather metrics into mmap_results.csv
IWASM=../iwasm WALI_ENV_FILE=/tmp/wali.env ./run_mmap_bench.sh ./mmap_bench.wasm > out.csv
```