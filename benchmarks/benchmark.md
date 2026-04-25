```
cd benchmarks
../examples/compile-wali-standalone.sh -o mmap_bench.wasm mmap_bench.c
./run_mmap_bench.sh ./mmap_bench.wasm > mmap_results.csv
```