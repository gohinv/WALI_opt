# Benchmarks for WALIopt




## Performance 
Here, we profile the performance of the `mmap`, `munmap`, and `mremap` system calls within WALI and WALIopt.
In WALI, these system calls are linked and implemented in the engine, which contains logic for the simple memory allocator.

In WALIopt, we update this by creating a Wasm module within the toolchain itself to provide memory allocation capability. This redirects the linking to the toolchain for memory allocation before the engine.

We are interested in benchmarking the overall performance between both. The benchmarking script accumulates the combined cost of the mmap syscall path, the page-touch loop, and the munmap syscall path to help gauge the efficiency of the memory allocator. 

```
cd benchmarks

# compile mmap_bench.c to mmap_bench.wasm
# we have provided options for INPUT_C_FILE under workloads/
../examples/compile-wali-standalone.sh -o mmap_bench.wasm INPUT_C_FILE

# run shell script to gather metrics into mmap_results.csv
IWASM=../iwasm WALI_ENV_FILE=/tmp/wali.env ./run_mmap_bench_perf.sh ./mmap_bench.wasm > out.csv
```


## Fragmentation
```
# compile mmap_frag_bench.c into .wasm
../examples/compile-wali-standalone.sh -o wasm_artifacts/mmap_frag_bench.wasm workloads/mmap_frag_bench.c

# run shell script to gather fragmentation details (fed into frag_results.txt)
IWASM=../iwasm WALI_ENV_FILE=/tmp/wali.env ./run_mmap_bench_frag.sh ./wasm_artifacts/mmap_frag_bench.wasm | tee

```