(module $mmap_bench.wasm
  (type (;0;) (func (param i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32 i32 i32 i32 i32 i64) (result i64)))
  (type (;3;) (func (param i32 i32) (result i64)))
  (type (;4;) (func (result i32)))
  (type (;5;) (func (param i32) (result i64)))
  (type (;6;) (func (param i32 i32) (result i32)))
  (type (;7;) (func (param i32 i32 i32) (result i64)))
  (type (;8;) (func (param i32 i32 i64) (result i64)))
  (type (;9;) (func (param i32 i32 i32 i32 i32) (result i64)))
  (type (;10;) (func (param i32) (result i32)))
  (type (;11;) (func (param i32 i32 i32 i32) (result i64)))
  (type (;12;) (func (param i32 i32 i32 i32 i32 i32) (result i64)))
  (type (;13;) (func (param i32 i64 i32) (result i64)))
  (type (;14;) (func))
  (type (;15;) (func (result i64)))
  (type (;16;) (func (param i32 i32 i32 i32 i32 i64) (result i32)))
  (type (;17;) (func (param i64) (result i64)))
  (type (;18;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;19;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;20;) (func (param i32 i32 i32)))
  (type (;21;) (func (param i32 i32)))
  (type (;22;) (func (param f64 i32) (result f64)))
  (type (;23;) (func (param i32 i32 i32 i32 i32)))
  (type (;24;) (func (param i32 i64)))
  (type (;25;) (func (param i32 i32 i32 i64) (result i64)))
  (type (;26;) (func (param i32 i64 i64 i64 i64)))
  (import "wali" "__proc_exit" (func $__wali_proc_exit (type 1)))
  (import "wali" "SYS_mmap" (func $__imported_wali_mmap (type 2)))
  (import "wali" "SYS_munmap" (func $__imported_wali_munmap (type 3)))
  (import "wali" "__init" (func $__wali_init (type 4)))
  (import "wali" "SYS_set_tid_address" (func $__syscall_SYS_set_tid_address (type 5)))
  (import "wali" "__get_init_envfile" (func $get_init_envfile (type 6)))
  (import "wali" "SYS_open" (func $__syscall_SYS_open (type 7)))
  (import "wali" "SYS_fcntl" (func $__syscall_SYS_fcntl (type 8)))
  (import "wali" "SYS_brk" (func $__syscall_SYS_brk (type 5)))
  (import "wali" "SYS_mprotect" (func $__syscall_SYS_mprotect (type 7)))
  (import "wali" "SYS_mremap" (func $__syscall_SYS_mremap (type 9)))
  (import "wali" "__deinit" (func $__wali_deinit (type 4)))
  (import "wali" "__cl_get_argc" (func $__cl_get_argc (type 4)))
  (import "wali" "__cl_get_argv_len" (func $__cl_get_argv_len (type 10)))
  (import "wali" "__cl_copy_argv" (func $__cl_copy_argv (type 6)))
  (import "wali" "SYS_fstat" (func $__syscall_SYS_fstat (type 3)))
  (import "wali" "SYS_newfstatat" (func $__syscall_SYS_newfstatat (type 11)))
  (import "wali" "SYS_stat" (func $__syscall_SYS_stat (type 3)))
  (import "wali" "SYS_lstat" (func $__syscall_SYS_lstat (type 3)))
  (import "wali" "SYS_close" (func $__syscall_SYS_close (type 5)))
  (import "wali" "SYS_writev" (func $__syscall_SYS_writev (type 7)))
  (import "wali" "SYS_ioctl" (func $__syscall_SYS_ioctl (type 7)))
  (import "wali" "SYS_futex" (func $__syscall_SYS_futex (type 12)))
  (import "wali" "SYS_rt_sigprocmask" (func $__syscall_SYS_rt_sigprocmask (type 11)))
  (import "wali" "SYS_tkill" (func $__syscall_SYS_tkill (type 3)))
  (import "wali" "SYS_rt_sigaction" (func $__syscall_SYS_rt_sigaction (type 11)))
  (import "wali" "SYS_clock_gettime" (func $__syscall_SYS_clock_gettime (type 3)))
  (import "wali" "SYS_gettimeofday" (func $__syscall_SYS_gettimeofday (type 3)))
  (import "wali" "SYS_access" (func $__syscall_SYS_access (type 3)))
  (import "wali" "SYS_lseek" (func $__syscall_SYS_lseek (type 13)))
  (func $__wasm_init_memory (type 14)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 6604
          i32.const 0
          i32.const 1
          i32.atomic.rmw.cmpxchg
          br_table 0 (;@3;) 1 (;@2;) 2 (;@1;)
        end
        i32.const 1024
        i32.const 1024
        global.set $__tls_base
        i32.const 0
        i32.const 128
        memory.init $.tdata
        i32.const 1152
        i32.const 0
        i32.const 3498
        memory.init $.rodata
        i32.const 4656
        i32.const 0
        i32.const 304
        memory.init $.data
        i32.const 4960
        i32.const 0
        i32.const 1644
        memory.fill
        i32.const 6604
        i32.const 2
        i32.atomic.store
        i32.const 6604
        i32.const -1
        memory.atomic.notify
        drop
        br 1 (;@1;)
      end
      i32.const 6604
      i32.const 1
      i64.const -1
      memory.atomic.wait32
      drop
    end
    data.drop $.rodata
    data.drop $.data)
  (func $_start (type 14)
    (local i32)
    block  ;; label = @1
      call $__wali_startup
      local.tee 0
      br_if 0 (;@1;)
      call $__main_void
      local.tee 0
      br_if 0 (;@1;)
      call $__wali_cleanup
      local.set 0
    end
    local.get 0
    call $__wali_proc_exit)
  (func $main (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 f64 i32)
    global.get $__stack_pointer
    i32.const 160
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=156
    local.get 2
    local.get 0
    i32.store offset=152
    local.get 2
    local.get 1
    i32.store offset=148
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load offset=152
        i32.const 4
        i32.lt_s
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=1696
        local.set 3
        local.get 2
        local.get 2
        i32.load offset=148
        i32.load
        i32.store
        local.get 3
        i32.const 1371
        local.get 2
        call $fprintf
        drop
        local.get 2
        i32.const 2
        i32.store offset=156
        br 1 (;@1;)
      end
      local.get 2
      local.get 2
      i32.load offset=148
      i32.load offset=4
      call $atoi
      i32.store offset=144
      local.get 2
      local.get 2
      i32.load offset=148
      i32.load offset=8
      i32.const 0
      i32.const 10
      call $strtoull
      i32.wrap_i64
      i32.store offset=140
      local.get 2
      local.get 2
      i32.load offset=148
      i32.load offset=12
      call $atoi
      i32.store offset=136
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.load offset=144
          i32.const 0
          i32.le_s
          i32.const 1
          i32.and
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=140
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=136
          i32.const 0
          i32.le_s
          i32.const 1
          i32.and
          i32.eqz
          br_if 1 (;@2;)
        end
        i32.const 0
        i32.load offset=1696
        i32.const 1206
        i32.const 0
        call $fprintf
        drop
        local.get 2
        i32.const 2
        i32.store offset=156
        br 1 (;@1;)
      end
      i32.const 1225
      i32.const 0
      call $printf
      drop
      local.get 2
      i32.const 0
      i32.store offset=132
      block  ;; label = @2
        loop  ;; label = @3
          local.get 2
          i32.load offset=132
          local.get 2
          i32.load offset=136
          i32.lt_s
          i32.const 1
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          local.get 2
          call $now_ns
          i64.store offset=120
          local.get 2
          i32.const 0
          i32.store offset=116
          block  ;; label = @4
            loop  ;; label = @5
              local.get 2
              i32.load offset=116
              local.get 2
              i32.load offset=144
              i32.lt_s
              i32.const 1
              i32.and
              i32.eqz
              br_if 1 (;@4;)
              local.get 2
              i32.load offset=140
              local.set 4
              local.get 2
              i32.const 0
              local.get 4
              i32.const 3
              i32.const 34
              i32.const -1
              i64.const 0
              call $bench_mmap
              i32.store offset=112
              block  ;; label = @6
                local.get 2
                i32.load offset=112
                i32.const -1
                i32.eq
                i32.const 1
                i32.and
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1696
                local.set 5
                local.get 2
                i32.load offset=132
                local.set 6
                local.get 2
                i32.load offset=116
                local.set 7
                local.get 2
                call $__errno_location
                i32.load
                i32.store offset=24
                local.get 2
                local.get 7
                i32.store offset=20
                local.get 2
                local.get 6
                i32.store offset=16
                local.get 5
                i32.const 1332
                local.get 2
                i32.const 16
                i32.add
                call $fprintf
                drop
                local.get 2
                i32.const 1
                i32.store offset=156
                br 5 (;@1;)
              end
              local.get 2
              i32.const 0
              i32.store offset=108
              block  ;; label = @6
                loop  ;; label = @7
                  local.get 2
                  i32.load offset=108
                  local.get 2
                  i32.load offset=140
                  i32.lt_u
                  i32.const 1
                  i32.and
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 2
                  i32.load offset=108
                  i32.const 255
                  i32.and
                  local.set 8
                  local.get 2
                  i32.load offset=112
                  local.get 2
                  i32.load offset=108
                  i32.add
                  local.get 8
                  i32.store8
                  local.get 2
                  local.get 2
                  i32.load offset=108
                  i32.const 4096
                  i32.add
                  i32.store offset=108
                  br 0 (;@7;)
                end
              end
              block  ;; label = @6
                local.get 2
                i32.load offset=112
                local.get 2
                i32.load offset=140
                call $bench_munmap
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1696
                local.set 9
                local.get 2
                i32.load offset=132
                local.set 10
                local.get 2
                i32.load offset=116
                local.set 11
                local.get 2
                call $__errno_location
                i32.load
                i32.store offset=40
                local.get 2
                local.get 11
                i32.store offset=36
                local.get 2
                local.get 10
                i32.store offset=32
                local.get 9
                i32.const 1291
                local.get 2
                i32.const 32
                i32.add
                call $fprintf
                drop
                local.get 2
                i32.const 1
                i32.store offset=156
                br 5 (;@1;)
              end
              local.get 2
              local.get 2
              i32.load offset=116
              i32.const 1
              i32.add
              i32.store offset=116
              br 0 (;@5;)
            end
          end
          local.get 2
          call $now_ns
          i64.store offset=96
          local.get 2
          local.get 2
          i64.load offset=96
          local.get 2
          i64.load offset=120
          i64.sub
          i64.store offset=88
          local.get 2
          local.get 2
          i64.load offset=88
          f64.convert_i64_u
          local.get 2
          i32.load offset=144
          f64.convert_i32_s
          f64.div
          f64.store offset=80
          local.get 2
          i32.load offset=132
          local.set 12
          local.get 2
          i32.load offset=144
          local.set 13
          local.get 2
          i32.load offset=140
          local.set 14
          local.get 2
          i64.load offset=88
          local.set 15
          local.get 2
          f64.load offset=80
          local.set 16
          local.get 2
          i32.const 72
          i32.add
          local.get 16
          f64.store
          local.get 2
          i32.const 64
          i32.add
          local.get 15
          i64.store
          local.get 2
          local.get 14
          i32.store offset=56
          local.get 2
          local.get 13
          i32.store offset=52
          local.get 2
          local.get 12
          i32.store offset=48
          i32.const 1270
          local.get 2
          i32.const 48
          i32.add
          call $printf
          drop
          local.get 2
          local.get 2
          i32.load offset=132
          i32.const 1
          i32.add
          i32.store offset=132
          br 0 (;@3;)
        end
      end
      local.get 2
      i32.const 0
      i32.store offset=156
    end
    local.get 2
    i32.load offset=156
    local.set 17
    local.get 2
    i32.const 160
    i32.add
    global.set $__stack_pointer
    local.get 17
    return)
  (func $now_ns (type 15) (result i64)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 0
    local.get 0
    global.set $__stack_pointer
    i32.const 1
    local.get 0
    call $__clock_gettime
    drop
    local.get 0
    i64.load
    i64.const 1000000000
    i64.mul
    local.get 0
    i64.load offset=8
    i64.add
    local.set 1
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1
    return)
  (func $bench_mmap (type 16) (param i32 i32 i32 i32 i32 i64) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.set 6
    local.get 6
    global.set $__stack_pointer
    local.get 6
    local.get 0
    i32.store offset=40
    local.get 6
    local.get 1
    i32.store offset=36
    local.get 6
    local.get 2
    i32.store offset=32
    local.get 6
    local.get 3
    i32.store offset=28
    local.get 6
    local.get 4
    i32.store offset=24
    local.get 6
    local.get 5
    i64.store offset=16
    local.get 6
    local.get 6
    i32.load offset=40
    local.get 6
    i32.load offset=36
    local.get 6
    i32.load offset=32
    local.get 6
    i32.load offset=28
    local.get 6
    i32.load offset=24
    local.get 6
    i64.load offset=16
    call $__imported_wali_mmap
    i64.store offset=8
    block  ;; label = @1
      block  ;; label = @2
        local.get 6
        i64.load offset=8
        i64.const 0
        i64.lt_s
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        i64.load offset=8
        i64.const -4096
        i64.gt_s
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        i32.const -1
        i32.store offset=44
        br 1 (;@1;)
      end
      local.get 6
      local.get 6
      i64.load offset=8
      i32.wrap_i64
      i32.store offset=44
    end
    local.get 6
    i32.load offset=44
    local.set 7
    local.get 6
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 7
    return)
  (func $bench_munmap (type 6) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.load offset=12
    local.get 2
    i32.load offset=8
    call $__imported_wali_munmap
    i32.wrap_i64
    local.set 3
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3
    return)
  (func $__errno_location (type 4) (result i32)
    global.get $__tls_base
    i32.const 0
    i32.add
    i32.const 28
    i32.add)
  (func $__wasm_init_tp (type 14)
    (local i32 i64)
    i32.const 0
    i32.const 1
    i32.store8 offset=4960
    global.get $__tls_base
    i32.const 0
    i32.add
    local.tee 0
    i32.const 2
    i32.store offset=32
    local.get 0
    local.get 0
    i32.store
    i32.const 5020
    call $__syscall_SYS_set_tid_address
    local.set 1
    local.get 0
    i32.const 4992
    i32.store offset=112
    local.get 0
    local.get 1
    i64.store32 offset=24
    local.get 0
    local.get 0
    i32.const 80
    i32.add
    i32.store offset=80
    local.get 0
    i32.const 0
    i32.load offset=5016
    i32.store offset=16
    local.get 0
    local.get 0
    i32.store offset=12
    local.get 0
    local.get 0
    i32.store offset=8)
  (func $__syscall_ret (type 17) (param i64) (result i64)
    block  ;; label = @1
      local.get 0
      i64.const -4095
      i64.lt_u
      br_if 0 (;@1;)
      call $__errno_location
      i32.const 0
      local.get 0
      i32.wrap_i64
      i32.sub
      i32.store
      i64.const -1
      local.set 0
    end
    local.get 0)
  (func $open (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 64
        i32.and
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        local.get 1
        i32.const 4259840
        i32.and
        i32.const 4259840
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 3
      local.get 2
      i32.const 4
      i32.add
      i32.store offset=12
      local.get 2
      i32.load
      local.set 4
    end
    local.get 0
    local.get 1
    i32.const 32768
    i32.or
    local.get 4
    call $__syscall_SYS_open
    local.set 5
    block  ;; label = @1
      local.get 1
      i32.const 524288
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 5
      i32.wrap_i64
      local.tee 1
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      local.get 1
      i32.const 2
      i64.const 1
      call $__syscall_SYS_fcntl
      drop
    end
    local.get 5
    i64.extend32_s
    call $__syscall_ret
    local.set 5
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 5
    i32.wrap_i64)
  (func $dummy (type 14))
  (func $__mmap (type 16) (param i32 i32 i32 i32 i32 i64) (result i32)
    (local i64)
    block  ;; label = @1
      local.get 5
      i64.const 4095
      i64.and
      i64.eqz
      br_if 0 (;@1;)
      call $__errno_location
      i32.const 22
      i32.store
      i32.const -1
      return
    end
    block  ;; label = @1
      local.get 1
      i32.const 2147483647
      i32.lt_u
      br_if 0 (;@1;)
      call $__errno_location
      i32.const 12
      i32.store
      i32.const -1
      return
    end
    i64.const -12
    local.set 6
    block  ;; label = @1
      local.get 3
      i32.const 16
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      call $dummy
      i64.const -1
      local.set 6
    end
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    local.get 4
    local.get 5
    call $__imported_wali_mmap
    local.tee 5
    local.get 5
    local.get 6
    i64.const -1
    local.get 3
    i32.const 32
    i32.and
    select
    local.get 5
    i64.const -1
    i64.ne
    select
    local.get 0
    select
    call $__syscall_ret
    i32.wrap_i64)
  (func $default_malloc (type 10) (param i32) (result i32)
    local.get 0
    call $__libc_malloc_impl)
  (func $__mprotect (type 0) (param i32 i32 i32) (result i32)
    (local i32)
    local.get 0
    i32.const -4096
    i32.and
    local.tee 3
    local.get 0
    local.get 1
    i32.add
    i32.const 4095
    i32.add
    i32.const -4096
    i32.and
    local.get 3
    i32.sub
    local.get 2
    call $__syscall_SYS_mprotect
    call $__syscall_ret
    i32.wrap_i64)
  (func $__munmap (type 6) (param i32 i32) (result i32)
    call $dummy
    local.get 0
    local.get 1
    call $__imported_wali_munmap
    call $__syscall_ret
    i32.wrap_i64)
  (func $__malloc_alloc_meta (type 4) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    block  ;; label = @1
      i32.const 0
      i32.load offset=5040
      br_if 0 (;@1;)
      local.get 0
      local.get 0
      i32.const 8
      i32.add
      i32.const 1103515245
      i32.mul
      i64.extend_i32_u
      i64.store offset=8
      i32.const 0
      i32.load offset=4968
      local.set 1
      i32.const 4
      local.set 2
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            local.get 2
            i32.add
            local.tee 3
            i32.const -4
            i32.add
            i32.load
            local.tee 4
            i32.const 25
            i32.eq
            br_if 0 (;@4;)
            local.get 4
            br_if 1 (;@3;)
            i32.const 0
            i32.const 1
            i32.store offset=5040
            i32.const 0
            local.get 0
            i64.load offset=8
            i64.store offset=5032
            br 3 (;@1;)
          end
          local.get 0
          i32.const 8
          i32.add
          local.get 3
          i32.load
          i32.const 8
          i32.add
          i32.const 8
          call $memcpy
          drop
          i32.const 0
          i32.load offset=4968
          local.set 1
        end
        local.get 2
        i32.const 8
        i32.add
        local.set 2
        br 0 (;@2;)
      end
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=5048
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.load offset=4
              local.tee 4
              local.get 2
              i32.eq
              br_if 0 (;@5;)
              local.get 2
              i32.load
              local.tee 3
              local.get 4
              i32.store offset=4
              local.get 2
              i32.load offset=4
              local.tee 1
              local.get 3
              i32.store
              i32.const 0
              i32.load offset=5048
              local.get 2
              i32.ne
              br_if 1 (;@4;)
            end
            i32.const 0
            local.get 1
            i32.store offset=5048
          end
          local.get 2
          i32.const 0
          i32.store offset=4
          br 1 (;@2;)
        end
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=5056
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            i32.const -1
            i32.add
            local.set 1
            i32.const 0
            i32.load offset=5052
            local.set 2
            br 1 (;@3;)
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=5060
                local.tee 2
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=5532
                local.tee 1
                i32.const -1
                i32.eq
                br_if 0 (;@6;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.const 0
                    i32.const 0
                    call $__syscall_SYS_brk
                    i32.wrap_i64
                    local.tee 2
                    i32.sub
                    i32.const 4095
                    i32.and
                    local.get 2
                    i32.add
                    local.tee 2
                    i32.store offset=5532
                    local.get 2
                    i32.const 8192
                    i32.add
                    local.set 2
                    local.get 2
                    local.get 2
                    call $__syscall_SYS_brk
                    i32.wrap_i64
                    i32.ne
                    br_if 1 (;@7;)
                    i32.const 0
                    i32.load offset=5532
                    i32.const 4096
                    i32.const 0
                    i32.const 50
                    i32.const -1
                    i64.const 0
                    call $__mmap
                    drop
                    br 3 (;@5;)
                  end
                  local.get 1
                  i32.const 4096
                  i32.add
                  local.set 2
                  local.get 2
                  local.get 2
                  call $__syscall_SYS_brk
                  i32.wrap_i64
                  i32.eq
                  br_if 2 (;@5;)
                end
                i32.const 0
                i32.const -1
                i32.store offset=5532
                i32.const 0
                i32.load offset=5060
                local.set 2
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 2
                  i32.eqz
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.load offset=5076
                  local.set 1
                  br 1 (;@6;)
                end
                i32.const 0
                local.set 2
                i32.const 0
                i64.const 2
                i32.const 0
                i64.load32_u offset=5064
                i64.shl
                i32.wrap_i64
                local.tee 1
                i32.const 12
                i32.shl
                i32.const 0
                i32.const 34
                i32.const -1
                i64.const 0
                call $__mmap
                local.tee 4
                i32.const -1
                i32.eq
                br_if 5 (;@1;)
                i32.const 0
                local.get 1
                i32.const -1
                i32.add
                i32.store offset=5060
                i32.const 0
                local.get 4
                i32.const 4096
                i32.add
                local.tee 1
                i32.store offset=5076
                i32.const 0
                i32.const 0
                i32.load offset=5064
                i32.const 1
                i32.add
                i32.store offset=5064
              end
              local.get 1
              i32.const 4095
              i32.and
              br_if 1 (;@4;)
              local.get 1
              i32.const 4096
              i32.const 3
              call $__mprotect
              i32.eqz
              br_if 1 (;@4;)
              i32.const 0
              local.set 2
              call $__errno_location
              i32.load
              i32.const 38
              i32.ne
              br_if 4 (;@1;)
              br 1 (;@4;)
            end
            i32.const 0
            i32.const 1
            i32.store offset=5060
            i32.const 0
            local.get 2
            i32.store offset=5532
            local.get 2
            i32.const -4096
            i32.add
            local.set 1
          end
          i32.const 0
          local.get 1
          i32.const 4096
          i32.add
          i32.store offset=5076
          i32.const 0
          i32.const 0
          i32.load offset=5060
          i32.const -1
          i32.add
          i32.store offset=5060
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=5072
              local.tee 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.store offset=8
              br 1 (;@4;)
            end
            i32.const 0
            local.get 1
            i32.store offset=5068
          end
          i32.const 0
          local.get 1
          i32.store offset=5072
          local.get 1
          i32.const 170
          i32.store offset=12
          local.get 1
          i32.const 0
          i64.load offset=5032
          i64.store
          local.get 1
          i32.const 16
          i32.add
          local.set 2
          i32.const 169
          local.set 1
        end
        i32.const 0
        local.get 1
        i32.store offset=5056
        local.get 2
        i32.const 0
        i32.store offset=4
        i32.const 0
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=5052
      end
      local.get 2
      i32.const 0
      i32.store
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $__libc_malloc_impl (type 10) (param i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.const 2147479551
      i32.lt_u
      br_if 0 (;@1;)
      call $__errno_location
      i32.const 12
      i32.store
      i32.const 0
      return
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 131052
          i32.lt_u
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          i32.const 0
          local.get 0
          i32.const 20
          i32.add
          local.tee 2
          i32.const 3
          i32.const 34
          i32.const -1
          i64.const 0
          call $__mmap
          local.tee 3
          i32.const -1
          i32.eq
          br_if 2 (;@1;)
          block  ;; label = @4
            i32.const 0
            i32.load8_u offset=4963
            i32.eqz
            br_if 0 (;@4;)
            i32.const 5536
            call $__lock
          end
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load8_u offset=5528
              local.tee 1
              i32.const 255
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              i64.const 0
              i64.store offset=5488
              i32.const 0
              i64.const 0
              i64.store offset=5480
              i32.const 0
              i64.const 0
              i64.store offset=5472
              i32.const 0
              i64.const 0
              i64.store offset=5464
              i32.const 1
              local.set 1
              br 1 (;@4;)
            end
            local.get 1
            i32.const 1
            i32.add
            local.set 1
          end
          i32.const 0
          local.set 4
          i32.const 0
          local.get 1
          i32.store8 offset=5528
          block  ;; label = @4
            call $__malloc_alloc_meta
            local.tee 1
            br_if 0 (;@4;)
            i32.const 5536
            call $__unlock
            local.get 3
            local.get 2
            call $__munmap
            drop
            i32.const 0
            return
          end
          local.get 1
          i32.const 0
          i32.store offset=16
          local.get 3
          local.get 1
          i32.store
          local.get 1
          local.get 3
          i32.store offset=8
          local.get 1
          i32.const 0
          i32.store offset=12
          i32.const 0
          i32.const 0
          i32.load offset=5044
          i32.const 1
          i32.add
          i32.store offset=5044
          local.get 1
          local.get 0
          i32.const 4115
          i32.add
          i32.const -4096
          i32.and
          i32.const 4064
          i32.or
          i32.store offset=20
          br 1 (;@2;)
        end
        local.get 0
        i32.const 3
        i32.add
        i32.const 4
        i32.shr_u
        local.set 3
        block  ;; label = @3
          local.get 0
          i32.const 157
          i32.lt_u
          br_if 0 (;@3;)
          i32.const 120
          i32.const 122
          local.get 3
          i32.const 121
          local.get 3
          i32.const 1
          i32.add
          call $a_clz_32
          i32.const 2
          i32.shl
          local.tee 1
          i32.sub
          i32.const 1
          i32.shl
          i32.load16_u offset=1568
          i32.lt_u
          select
          local.get 1
          i32.sub
          local.tee 1
          local.get 3
          local.get 1
          i32.const 1
          i32.shl
          i32.load16_u offset=1568
          i32.ge_u
          i32.or
          local.set 3
        end
        block  ;; label = @3
          i32.const 0
          i32.load8_u offset=4963
          i32.eqz
          br_if 0 (;@3;)
          i32.const 5536
          call $__lock
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 2
            i32.shl
            i32.load offset=5080
            local.tee 1
            br_if 0 (;@4;)
            local.get 3
            i32.const 6
            i32.eq
            br_if 0 (;@4;)
            local.get 3
            i32.const -4
            i32.add
            i32.const 27
            i32.gt_u
            br_if 0 (;@4;)
            i32.const 0
            local.set 1
            block  ;; label = @5
              local.get 3
              i32.const 1
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 4
              br 2 (;@3;)
            end
            i32.const 0
            local.set 1
            block  ;; label = @5
              local.get 3
              i32.const 2
              i32.shl
              i32.load offset=5272
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 4
              br 2 (;@3;)
            end
            local.get 3
            i32.const 1
            i32.or
            local.tee 4
            i32.const 2
            i32.shl
            local.tee 2
            i32.load offset=5272
            local.set 1
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                i32.load offset=5080
                local.tee 2
                i32.eqz
                br_if 0 (;@6;)
                local.get 2
                i32.load offset=12
                br_if 1 (;@5;)
                local.get 2
                i32.load offset=16
                br_if 1 (;@5;)
              end
              local.get 1
              i32.const 3
              i32.add
              local.set 1
            end
            local.get 4
            local.get 3
            local.get 1
            i32.const 13
            i32.lt_u
            select
            local.tee 3
            i32.const 2
            i32.shl
            i32.load offset=5080
            local.set 1
          end
          block  ;; label = @4
            local.get 1
            br_if 0 (;@4;)
            i32.const 0
            local.set 1
            i32.const 0
            local.set 4
            br 1 (;@3;)
          end
          local.get 1
          i32.load offset=12
          local.set 4
        end
        block  ;; label = @3
          local.get 4
          i32.const 0
          local.get 4
          i32.sub
          i32.and
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 4
          local.get 2
          i32.sub
          i32.store offset=12
          local.get 2
          call $a_ctz_32
          local.set 4
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 3
          local.get 0
          call $alloc_slot
          local.tee 4
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          i32.const 5536
          call $__unlock
          i32.const 0
          return
        end
        local.get 3
        i32.const 2
        i32.shl
        i32.load offset=5080
        local.set 1
      end
      i32.const 0
      i32.load offset=5044
      local.set 3
      i32.const 5536
      call $__unlock
      local.get 1
      local.get 4
      local.get 0
      local.get 3
      call $enframe
      local.set 1
    end
    local.get 1)
  (func $a_clz_32 (type 10) (param i32) (result i32)
    local.get 0
    i32.clz)
  (func $a_ctz_32 (type 10) (param i32) (result i32)
    local.get 0
    i32.ctz)
  (func $alloc_slot (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.const 2
    i32.shl
    local.tee 3
    i32.const 5080
    i32.add
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.load offset=5080
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 5
            i32.load offset=12
            local.tee 3
            br_if 0 (;@4;)
            local.get 5
            i32.load offset=4
            local.set 6
            block  ;; label = @5
              block  ;; label = @6
                local.get 5
                i32.load offset=16
                br_if 0 (;@6;)
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 6
                      local.get 5
                      i32.ne
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 3
                      br 1 (;@8;)
                    end
                    local.get 5
                    i32.load
                    local.tee 7
                    local.get 6
                    i32.store offset=4
                    local.get 5
                    i32.load offset=4
                    local.tee 3
                    local.get 7
                    i32.store
                    local.get 4
                    i32.load
                    local.get 5
                    i32.ne
                    br_if 1 (;@7;)
                  end
                  local.get 4
                  local.get 3
                  i32.store
                end
                local.get 5
                i64.const 0
                i64.store align=4
                local.get 4
                i32.load
                local.tee 6
                br_if 1 (;@5;)
                br 3 (;@3;)
              end
              local.get 4
              local.get 6
              i32.store
            end
            local.get 6
            i32.load offset=20
            local.set 7
            local.get 6
            i32.load offset=16
            local.set 3
            block  ;; label = @5
              local.get 7
              i32.const 32
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 3
              i32.const 2
              local.get 7
              i32.shl
              i32.const -1
              i32.add
              i32.ne
              br_if 0 (;@5;)
              local.get 4
              local.get 6
              i32.load offset=4
              local.tee 6
              i32.store
              local.get 6
              i32.load offset=16
              local.set 3
            end
            block  ;; label = @5
              block  ;; label = @6
                i32.const 2
                local.get 6
                i32.load offset=8
                local.tee 8
                i32.load8_u offset=4
                local.tee 9
                i32.shl
                i32.const -1
                i32.add
                local.get 3
                i32.and
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 6
                  i32.load offset=4
                  local.tee 5
                  local.get 6
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 4
                  local.get 5
                  i32.store
                  br 2 (;@5;)
                end
                local.get 9
                i32.const 31
                i32.and
                local.tee 3
                i32.const 4
                i32.shl
                i32.const 48
                i32.add
                local.get 6
                i32.load offset=20
                local.tee 10
                i32.const 5
                i32.shr_u
                i32.const 126
                i32.and
                i32.load16_u offset=1568
                local.tee 7
                i32.mul
                i32.const 15
                i32.or
                local.set 11
                local.get 7
                i32.const 4
                i32.shl
                local.tee 12
                local.get 3
                i32.const 2
                i32.add
                i32.mul
                i32.const 16
                i32.add
                local.set 13
                local.get 3
                i32.const 1
                i32.add
                local.set 7
                i32.const 0
                local.set 3
                loop  ;; label = @7
                  local.get 13
                  local.get 3
                  i32.add
                  local.set 5
                  local.get 11
                  local.get 3
                  i32.add
                  local.set 14
                  local.get 3
                  local.get 12
                  i32.add
                  local.set 3
                  local.get 7
                  i32.const 1
                  i32.add
                  local.set 7
                  local.get 14
                  local.get 5
                  i32.xor
                  i32.const 4096
                  i32.lt_s
                  br_if 0 (;@7;)
                end
                local.get 8
                local.get 7
                local.get 10
                i32.const 31
                i32.and
                i32.const 1
                i32.add
                local.tee 3
                local.get 7
                local.get 3
                i32.lt_u
                select
                i32.const -1
                i32.add
                i32.const 31
                i32.and
                local.get 9
                i32.const 224
                i32.and
                i32.or
                i32.store8 offset=4
              end
              local.get 6
              local.set 5
            end
            local.get 5
            i32.load offset=12
            br_if 3 (;@1;)
            local.get 5
            i32.const 16
            i32.add
            local.set 7
            i32.const 0
            i32.const 2
            local.get 5
            i32.load offset=8
            i32.load8_u offset=4
            i32.shl
            local.tee 14
            i32.sub
            local.set 6
            loop  ;; label = @5
              local.get 7
              i32.load
              local.set 3
              local.get 3
              local.get 7
              local.get 3
              local.get 3
              local.get 6
              i32.and
              call $a_cas
              i32.ne
              br_if 0 (;@5;)
            end
            local.get 5
            local.get 3
            local.get 14
            i32.const -1
            i32.add
            i32.and
            local.tee 3
            i32.store offset=12
            local.get 3
            i32.eqz
            br_if 3 (;@1;)
            local.get 5
            i32.load offset=20
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const -7
            i32.add
            local.tee 7
            i32.const 31
            i32.gt_u
            br_if 0 (;@4;)
            local.get 7
            i32.load8_u offset=5496
            local.tee 6
            i32.eqz
            br_if 0 (;@4;)
            local.get 7
            i32.const 5496
            i32.add
            local.get 6
            i32.const -1
            i32.add
            i32.store8
          end
          local.get 5
          local.get 3
          local.get 3
          i32.const 0
          local.get 3
          i32.sub
          i32.and
          local.tee 7
          i32.sub
          i32.store offset=12
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 7
          call $a_ctz_32
          local.set 3
          br 1 (;@2;)
        end
        local.get 0
        i32.const 1
        i32.shl
        i32.load16_u offset=1568
        local.set 10
        block  ;; label = @3
          call $__malloc_alloc_meta
          local.tee 14
          br_if 0 (;@3;)
          i32.const -1
          local.set 3
          br 1 (;@2;)
        end
        local.get 10
        i32.const 4
        i32.shl
        local.set 6
        local.get 0
        i32.const 2
        i32.shl
        local.tee 11
        i32.load offset=5272
        local.set 5
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.const 8
            i32.gt_u
            br_if 0 (;@4;)
            local.get 0
            i32.const 3
            i32.mul
            local.tee 3
            i32.load8_u offset=1664
            local.tee 7
            i32.const 2
            i32.shl
            local.get 5
            i32.le_u
            br_if 1 (;@3;)
            local.get 3
            i32.const 1664
            i32.add
            local.tee 3
            i32.load8_u offset=1
            local.tee 7
            i32.const 2
            i32.shl
            local.get 5
            i32.le_u
            br_if 1 (;@3;)
            local.get 3
            i32.load8_u offset=2
            local.set 7
            br 1 (;@3;)
          end
          local.get 0
          i32.const 3
          i32.and
          i32.load8_u offset=1691
          local.set 7
          block  ;; label = @4
            loop  ;; label = @5
              local.get 7
              local.tee 3
              i32.const 1
              i32.and
              br_if 1 (;@4;)
              local.get 3
              i32.const 1
              i32.shr_u
              local.set 7
              local.get 3
              i32.const 2
              i32.shl
              local.get 5
              i32.gt_u
              br_if 0 (;@5;)
            end
          end
          loop  ;; label = @4
            local.get 3
            local.tee 7
            i32.const 1
            i32.shr_u
            local.set 3
            local.get 7
            local.get 6
            i32.mul
            i32.const 1048575
            i32.gt_u
            br_if 0 (;@4;)
          end
        end
        local.get 11
        i32.const 5272
        i32.add
        local.set 15
        block  ;; label = @3
          block  ;; label = @4
            i32.const 2
            i32.const 1
            local.get 0
            i32.const 24
            i32.lt_u
            select
            local.get 7
            local.get 7
            i32.const 1
            i32.eq
            select
            local.tee 8
            local.get 6
            i32.mul
            local.tee 7
            i32.const 2048
            i32.lt_u
            br_if 0 (;@4;)
            i32.const 0
            local.set 11
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.const -7
                i32.add
                local.tee 12
                i32.const 31
                i32.gt_u
                br_if 0 (;@6;)
                local.get 12
                i32.load8_u offset=5496
                local.tee 13
                i32.const 99
                i32.gt_u
                local.set 11
                local.get 12
                i32.load8_u offset=5464
                local.tee 9
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                i32.load8_u offset=5528
                local.tee 3
                local.get 9
                i32.sub
                i32.const 9
                i32.gt_s
                br_if 1 (;@5;)
                local.get 12
                i32.const 5496
                i32.add
                local.get 13
                i32.const 1
                i32.add
                i32.const -106
                local.get 13
                i32.const 99
                i32.lt_u
                select
                i32.store8
              end
              i32.const 0
              i32.load8_u offset=5528
              local.set 3
            end
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.const 255
                i32.and
                i32.const 255
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                i64.const 0
                i64.store offset=5488
                i32.const 0
                i64.const 0
                i64.store offset=5480
                i32.const 0
                i64.const 0
                i64.store offset=5472
                i32.const 0
                i64.const 0
                i64.store offset=5464
                i32.const 1
                local.set 3
                br 1 (;@5;)
              end
              local.get 3
              i32.const 1
              i32.add
              local.set 3
            end
            i32.const 0
            local.get 3
            i32.store8 offset=5528
            block  ;; label = @5
              local.get 0
              i32.const 33
              i32.and
              br_if 0 (;@5;)
              local.get 15
              i32.load offset=4
              local.get 5
              i32.add
              local.set 5
            end
            block  ;; label = @5
              block  ;; label = @6
                local.get 8
                i32.const 2
                i32.shl
                local.get 5
                i32.gt_u
                br_if 0 (;@6;)
                local.get 8
                local.set 3
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 11
                i32.eqz
                br_if 0 (;@6;)
                local.get 8
                local.set 3
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 0
                i32.const 3
                i32.and
                local.tee 12
                i32.const 1
                i32.ne
                br_if 0 (;@6;)
                i32.const 2
                local.set 3
                local.get 7
                i32.const 32768
                i32.gt_u
                br_if 1 (;@5;)
              end
              block  ;; label = @6
                local.get 12
                i32.const 2
                i32.ne
                br_if 0 (;@6;)
                i32.const 3
                local.set 3
                local.get 7
                i32.const 16384
                i32.gt_u
                br_if 1 (;@5;)
              end
              local.get 8
              i32.const 3
              local.get 8
              local.get 7
              i32.const 32768
              i32.gt_u
              local.tee 13
              select
              local.get 12
              select
              local.set 3
              local.get 13
              br_if 0 (;@5;)
              local.get 12
              br_if 0 (;@5;)
              i32.const 5
              local.get 8
              local.get 7
              i32.const 8192
              i32.gt_u
              select
              local.set 3
            end
            local.get 3
            local.get 6
            i32.mul
            local.tee 7
            i32.const 4080
            local.get 7
            i32.sub
            i32.const 4080
            i32.and
            i32.add
            i32.const 16
            i32.add
            local.set 7
            block  ;; label = @5
              local.get 11
              br_if 0 (;@5;)
              local.get 3
              i32.const 7
              i32.gt_u
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 1
                i32.const 4076
                local.get 1
                i32.sub
                i32.const 4095
                i32.and
                i32.add
                i32.const 20
                i32.add
                local.tee 1
                local.get 6
                i32.const 16
                i32.add
                i32.lt_u
                br_if 0 (;@6;)
                local.get 1
                i32.const 16384
                i32.lt_u
                br_if 1 (;@5;)
                local.get 3
                i32.const 1
                i32.shl
                local.get 5
                i32.le_u
                br_if 1 (;@5;)
              end
              i32.const 1
              local.set 3
              local.get 1
              local.set 7
            end
            block  ;; label = @5
              i32.const 0
              local.get 7
              i32.const 3
              i32.const 34
              i32.const -1
              i64.const 0
              call $__mmap
              local.tee 9
              i32.const -1
              i32.ne
              br_if 0 (;@5;)
              local.get 2
              i64.const 0
              i64.store offset=8
              local.get 2
              i64.const 0
              i64.store offset=24
              local.get 2
              i64.const 0
              i64.store offset=16
              local.get 14
              local.get 2
              i64.load offset=8
              i64.store align=4
              local.get 14
              local.get 2
              i64.load offset=24
              i64.store offset=16 align=4
              local.get 14
              local.get 2
              i64.load offset=16
              i64.store offset=8 align=4
              local.get 14
              i32.load offset=4
              br_if 4 (;@1;)
              local.get 14
              i32.load
              br_if 4 (;@1;)
              block  ;; label = @6
                block  ;; label = @7
                  i32.const 0
                  i32.load offset=5048
                  local.tee 3
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 14
                  local.get 3
                  i32.store offset=4
                  local.get 3
                  i32.load
                  local.tee 3
                  local.get 14
                  i32.store offset=4
                  local.get 14
                  i32.load offset=4
                  local.set 7
                  br 1 (;@6;)
                end
                local.get 14
                local.get 14
                i32.store offset=4
                i32.const 5048
                local.set 7
                local.get 14
                local.set 3
              end
              local.get 14
              local.get 3
              i32.store
              local.get 7
              local.get 14
              i32.store
              i32.const -1
              local.set 3
              br 3 (;@2;)
            end
            i32.const 0
            i32.const 0
            i32.load offset=5044
            i32.const 1
            i32.add
            i32.store offset=5044
            local.get 14
            local.get 14
            i32.load offset=20
            i32.const 4095
            i32.and
            local.get 7
            i32.const -4096
            i32.and
            i32.or
            i32.store offset=20
            i32.const 0
            i32.const 4080
            local.get 6
            i32.div_u
            local.tee 7
            local.get 3
            local.get 7
            local.get 3
            i32.lt_u
            select
            local.tee 7
            i32.const -1
            i32.add
            local.tee 6
            local.get 6
            local.get 7
            i32.gt_u
            select
            local.set 7
            local.get 3
            i32.const -1
            i32.add
            local.set 6
            local.get 3
            local.set 8
            br 1 (;@3;)
          end
          local.get 7
          i32.const 4
          i32.shr_u
          local.set 3
          block  ;; label = @4
            local.get 7
            i32.const 12
            i32.or
            local.tee 7
            i32.const 157
            i32.lt_u
            br_if 0 (;@4;)
            i32.const 120
            i32.const 122
            local.get 3
            i32.const 121
            local.get 3
            i32.const 1
            i32.add
            call $a_clz_32
            i32.const 2
            i32.shl
            local.tee 5
            i32.sub
            i32.const 1
            i32.shl
            i32.load16_u offset=1568
            i32.lt_u
            select
            local.get 5
            i32.sub
            local.tee 5
            local.get 3
            local.get 5
            i32.const 1
            i32.shl
            i32.load16_u offset=1568
            i32.ge_u
            i32.or
            local.set 3
          end
          block  ;; label = @4
            local.get 3
            local.get 7
            call $alloc_slot
            local.tee 7
            i32.const -1
            i32.gt_s
            br_if 0 (;@4;)
            local.get 2
            i64.const 0
            i64.store offset=8
            local.get 2
            i64.const 0
            i64.store offset=24
            local.get 2
            i64.const 0
            i64.store offset=16
            local.get 14
            local.get 2
            i64.load offset=8
            i64.store align=4
            local.get 14
            local.get 2
            i64.load offset=24
            i64.store offset=16 align=4
            local.get 14
            local.get 2
            i64.load offset=16
            i64.store offset=8 align=4
            local.get 14
            i32.load offset=4
            br_if 3 (;@1;)
            local.get 14
            i32.load
            br_if 3 (;@1;)
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=5048
                local.tee 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 14
                local.get 3
                i32.store offset=4
                local.get 3
                i32.load
                local.tee 3
                local.get 14
                i32.store offset=4
                local.get 14
                i32.load offset=4
                local.set 7
                br 1 (;@5;)
              end
              local.get 14
              local.get 14
              i32.store offset=4
              i32.const 5048
              local.set 7
              local.get 14
              local.set 3
            end
            local.get 14
            local.get 3
            i32.store
            local.get 7
            local.get 14
            i32.store
            i32.const -1
            local.set 3
            br 2 (;@2;)
          end
          local.get 3
          i32.const 2
          i32.shl
          i32.load offset=5080
          local.get 7
          local.get 3
          i32.const 1
          i32.shl
          i32.load16_u offset=1568
          i32.const 4
          i32.shl
          i32.const -4
          i32.add
          i32.const 0
          i32.load offset=5044
          call $enframe
          local.set 9
          local.get 14
          local.get 14
          i32.load offset=20
          i32.const 4095
          i32.and
          i32.store offset=20
          local.get 9
          i32.const -3
          i32.add
          local.tee 3
          local.get 3
          i32.load8_u
          i32.const 31
          i32.and
          i32.const 192
          i32.or
          i32.store8
          local.get 8
          i32.const 1
          i32.add
          local.tee 13
          i32.const 3
          i32.and
          local.set 7
          i32.const 0
          local.set 5
          block  ;; label = @4
            block  ;; label = @5
              local.get 8
              i32.const 3
              i32.lt_u
              br_if 0 (;@5;)
              local.get 10
              i32.const 5
              i32.shl
              local.set 1
              local.get 10
              i32.const 6
              i32.shl
              local.set 11
              local.get 9
              i32.const 12
              i32.add
              local.set 3
              local.get 10
              i32.const 48
              i32.mul
              local.set 12
              local.get 13
              i32.const -4
              i32.and
              local.set 13
              i32.const 0
              local.set 5
              loop  ;; label = @6
                local.get 3
                i32.const 0
                i32.store8
                local.get 3
                local.get 6
                i32.add
                i32.const 0
                i32.store8
                local.get 3
                local.get 1
                i32.add
                i32.const 0
                i32.store8
                local.get 3
                local.get 12
                i32.add
                i32.const 0
                i32.store8
                local.get 3
                local.get 11
                i32.add
                local.set 3
                local.get 13
                local.get 5
                i32.const 4
                i32.add
                local.tee 5
                i32.ne
                br_if 0 (;@6;)
              end
              local.get 7
              i32.eqz
              br_if 1 (;@4;)
            end
            local.get 5
            local.get 10
            i32.mul
            i32.const 4
            i32.shl
            local.get 9
            i32.add
            i32.const 12
            i32.add
            local.set 3
            loop  ;; label = @5
              local.get 3
              i32.const 0
              i32.store8
              local.get 3
              local.get 6
              i32.add
              local.set 3
              local.get 7
              i32.const -1
              i32.add
              local.tee 7
              br_if 0 (;@5;)
            end
          end
          local.get 8
          i32.const -1
          i32.add
          local.tee 6
          local.set 7
        end
        local.get 15
        local.get 15
        i32.load
        local.get 8
        i32.add
        i32.store
        local.get 14
        i32.const 2
        local.get 7
        i32.shl
        i32.const -1
        i32.add
        i32.store offset=12
        local.get 14
        local.get 9
        i32.store offset=8
        local.get 14
        i32.const 2
        local.get 6
        i32.shl
        local.get 14
        i32.load offset=12
        i32.const -1
        i32.xor
        i32.add
        i32.store offset=16
        local.get 9
        local.get 9
        i32.load8_u offset=4
        i32.const 224
        i32.and
        local.get 7
        i32.const 31
        i32.and
        i32.or
        i32.store8 offset=4
        local.get 9
        local.get 14
        i32.store
        local.get 14
        local.get 14
        i32.load offset=12
        i32.const -1
        i32.add
        i32.store offset=12
        local.get 14
        local.get 6
        i32.const 31
        i32.and
        local.get 14
        i32.load offset=20
        i32.const -4096
        i32.and
        i32.or
        local.get 0
        i32.const 6
        i32.shl
        i32.or
        i32.const 32
        i32.or
        i32.store offset=20
        local.get 14
        i32.load offset=4
        br_if 1 (;@1;)
        local.get 14
        i32.load
        br_if 1 (;@1;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 4
            i32.load
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 14
            local.get 3
            i32.store offset=4
            local.get 3
            i32.load
            local.tee 3
            local.get 14
            i32.store offset=4
            local.get 14
            i32.load offset=4
            local.set 4
            br 1 (;@3;)
          end
          local.get 14
          local.get 14
          i32.store offset=4
          local.get 14
          local.set 3
        end
        local.get 14
        local.get 3
        i32.store
        local.get 4
        local.get 14
        i32.store
        i32.const 0
        local.set 3
      end
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 3
      return
    end
    call $a_crash
    unreachable)
  (func $enframe (type 18) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 20
        i32.add
        i32.load
        local.tee 4
        i32.const 4096
        i32.lt_u
        br_if 0 (;@2;)
        local.get 4
        i32.const 31
        i32.and
        br_if 0 (;@2;)
        local.get 4
        i32.const -4096
        i32.and
        i32.const -16
        i32.add
        local.set 5
        br 1 (;@1;)
      end
      local.get 4
      i32.const 5
      i32.shr_u
      i32.const 126
      i32.and
      i32.load16_u offset=1568
      i32.const 4
      i32.shl
      local.set 5
    end
    local.get 0
    i32.load offset=8
    local.tee 6
    local.get 5
    local.get 1
    i32.mul
    i32.add
    local.tee 4
    i32.const 16
    i32.add
    local.set 7
    block  ;; label = @1
      local.get 4
      i32.const 13
      i32.add
      local.tee 8
      i32.load8_u
      i32.eqz
      br_if 0 (;@1;)
      local.get 7
      i32.const -2
      i32.add
      i32.load16_u
      i32.const 1
      i32.add
      local.set 3
    end
    block  ;; label = @1
      local.get 7
      i32.const -4
      i32.add
      i32.load8_u
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 3
        i32.const 255
        i32.and
        local.tee 3
        local.get 5
        local.get 2
        i32.sub
        i32.const -4
        i32.add
        local.tee 9
        i32.const 4
        i32.shr_u
        local.tee 4
        i32.le_u
        br_if 0 (;@2;)
        local.get 4
        i32.const -1
        i32.xor
        i32.const 0
        local.get 3
        local.get 4
        local.get 9
        i32.const 5
        i32.shr_u
        i32.or
        local.tee 9
        i32.const 2
        i32.shr_u
        local.get 9
        i32.or
        local.tee 9
        i32.const 4
        i32.shr_u
        local.get 9
        i32.or
        i32.and
        local.tee 3
        local.get 4
        i32.gt_u
        select
        local.get 3
        i32.add
        local.tee 3
        local.get 4
        i32.gt_u
        br_if 1 (;@1;)
      end
      local.get 7
      local.set 4
      block  ;; label = @2
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 8
        i32.const 224
        i32.store8
        local.get 7
        local.get 3
        i32.const 4
        i32.shl
        i32.add
        local.tee 4
        i32.const -4
        i32.add
        i32.const 0
        i32.store8
        local.get 7
        i32.const -2
        i32.add
        local.get 3
        i32.store16
        local.get 0
        i32.load offset=8
        local.set 6
      end
      local.get 4
      i32.const -3
      i32.add
      local.tee 3
      local.get 1
      i32.store8
      local.get 4
      i32.const -2
      i32.add
      local.get 4
      local.get 6
      i32.sub
      i32.const -16
      i32.add
      i32.const 4
      i32.shr_u
      i32.store16
      block  ;; label = @2
        block  ;; label = @3
          local.get 7
          local.get 5
          i32.add
          local.tee 0
          i32.const -4
          i32.add
          local.tee 5
          local.get 2
          local.get 4
          i32.add
          i32.sub
          local.tee 7
          br_if 0 (;@3;)
          i32.const 0
          local.set 5
          br 1 (;@2;)
        end
        local.get 5
        local.get 7
        i32.sub
        i32.const 0
        i32.store8
        i32.const 5
        local.set 5
        block  ;; label = @3
          local.get 7
          i32.const 5
          i32.ge_s
          br_if 0 (;@3;)
          local.get 7
          local.set 5
          br 1 (;@2;)
        end
        local.get 0
        i32.const -9
        i32.add
        i32.const 0
        i32.store8
        local.get 0
        i32.const -8
        i32.add
        local.get 7
        i32.store
      end
      local.get 3
      local.get 5
      i32.const 5
      i32.shl
      local.get 3
      i32.load8_u
      i32.const 31
      i32.and
      i32.or
      i32.store8
      local.get 4
      return
    end
    call $a_crash
    unreachable)
  (func $a_cas (type 0) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    i32.atomic.rmw.cmpxchg)
  (func $a_crash (type 14)
    unreachable)
  (func $__mremap (type 19) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 2147483647
        i32.lt_u
        br_if 0 (;@2;)
        call $__errno_location
        i32.const 12
        i32.store
        i32.const -1
        local.set 2
        br 1 (;@1;)
      end
      i32.const 0
      local.set 6
      block  ;; label = @2
        local.get 3
        i32.const 2
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        call $dummy
        local.get 5
        local.get 4
        i32.const 4
        i32.add
        i32.store offset=12
        local.get 4
        i32.load
        local.set 6
      end
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      local.get 6
      call $__syscall_SYS_mremap
      call $__syscall_ret
      i32.wrap_i64
      local.set 2
    end
    local.get 5
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $__libc_free (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        call $get_meta
        local.set 2
        local.get 0
        i32.const -3
        i32.add
        local.tee 3
        i32.load8_u
        local.tee 4
        i32.const 31
        i32.and
        local.set 5
        local.get 2
        i32.const 20
        i32.add
        i32.load
        local.tee 6
        i32.const 31
        i32.and
        local.set 7
        block  ;; label = @3
          block  ;; label = @4
            local.get 6
            i32.const 4096
            i32.lt_u
            br_if 0 (;@4;)
            local.get 7
            br_if 0 (;@4;)
            local.get 6
            i32.const -4096
            i32.and
            i32.const -16
            i32.add
            local.set 8
            br 1 (;@3;)
          end
          local.get 6
          i32.const 5
          i32.shr_u
          i32.const 126
          i32.and
          i32.load16_u offset=1568
          i32.const 4
          i32.shl
          local.set 8
        end
        local.get 4
        i32.const 5
        i32.shr_u
        local.set 6
        local.get 2
        i32.load offset=8
        local.get 8
        local.get 5
        i32.mul
        i32.add
        local.get 8
        i32.add
        local.set 8
        block  ;; label = @3
          local.get 4
          i32.const 160
          i32.lt_u
          br_if 0 (;@3;)
          local.get 6
          i32.const 5
          i32.ne
          br_if 2 (;@1;)
          local.get 8
          i32.load offset=8
          local.tee 6
          i32.const 4
          i32.le_u
          br_if 2 (;@1;)
          local.get 8
          i32.load8_u offset=7
          br_if 2 (;@1;)
        end
        local.get 6
        local.get 8
        i32.const 12
        i32.add
        local.tee 4
        local.get 0
        i32.sub
        i32.gt_u
        br_if 1 (;@1;)
        local.get 4
        local.get 6
        i32.sub
        i32.load8_u
        br_if 1 (;@1;)
        local.get 4
        i32.load8_u
        br_if 1 (;@1;)
        local.get 3
        i32.const 255
        i32.store8
        local.get 0
        i32.const -2
        i32.add
        i32.const 0
        i32.store16
        local.get 2
        i32.const 16
        i32.add
        local.set 3
        i32.const 1
        local.get 5
        i32.shl
        local.set 6
        i32.const 2
        local.get 7
        i32.shl
        i32.const -1
        i32.add
        local.set 7
        loop  ;; label = @3
          local.get 2
          i32.load offset=16
          local.tee 0
          local.get 2
          i32.load offset=12
          i32.or
          local.tee 8
          local.get 6
          i32.and
          br_if 2 (;@1;)
          i32.const 0
          i32.load8_u offset=4963
          local.set 4
          block  ;; label = @4
            local.get 0
            i32.eqz
            br_if 0 (;@4;)
            local.get 8
            local.get 6
            i32.add
            local.get 7
            i32.eq
            br_if 0 (;@4;)
            local.get 0
            local.get 6
            i32.add
            local.set 8
            block  ;; label = @5
              local.get 4
              i32.const 255
              i32.and
              br_if 0 (;@5;)
              local.get 3
              local.get 8
              i32.store
              br 3 (;@2;)
            end
            local.get 3
            local.get 0
            local.get 8
            call $a_cas.1
            local.get 0
            i32.ne
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
        end
        block  ;; label = @3
          local.get 4
          i32.const 255
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          i32.const 5536
          call $__lock
        end
        local.get 1
        i32.const 8
        i32.add
        local.get 2
        local.get 5
        call $nontrivial_free
        i32.const 5536
        call $__unlock
        local.get 1
        i32.load offset=12
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=8
        local.get 0
        call $__munmap
        drop
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
      return
    end
    call $a_crash.1
    unreachable)
  (func $get_meta (type 10) (param i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.const 15
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const -3
      i32.add
      i32.load8_u
      local.set 1
      local.get 0
      i32.const -2
      i32.add
      i32.load16_u
      local.set 2
      block  ;; label = @2
        local.get 0
        i32.const -4
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        br_if 1 (;@1;)
        local.get 0
        i32.const -8
        i32.add
        i32.load
        local.tee 2
        i32.const 65535
        i32.le_s
        br_if 1 (;@1;)
      end
      local.get 0
      local.get 2
      i32.const 4
      i32.shl
      i32.sub
      i32.const -16
      i32.add
      local.tee 3
      i32.load
      local.tee 0
      i32.load offset=8
      local.get 3
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=20
      local.tee 3
      i32.const 31
      i32.and
      local.get 1
      i32.const 31
      i32.and
      local.tee 1
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=12
      i32.const 1
      local.get 1
      i32.shl
      local.tee 4
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=16
      local.get 4
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const -4096
      i32.and
      i64.load
      i32.const 0
      i64.load offset=5032
      i64.ne
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          local.tee 4
          i32.const 47
          i32.gt_u
          br_if 0 (;@3;)
          local.get 2
          local.get 4
          i32.const 1
          i32.shl
          i32.load16_u offset=1568
          local.tee 4
          local.get 1
          i32.mul
          i32.lt_u
          br_if 2 (;@1;)
          local.get 2
          local.get 1
          i32.const 1
          i32.add
          local.get 4
          i32.mul
          i32.lt_u
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        local.get 4
        i32.const 63
        i32.ne
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        local.get 3
        i32.const 4096
        i32.lt_u
        br_if 0 (;@2;)
        local.get 3
        i32.const 4
        i32.shr_u
        i32.const 268435200
        i32.and
        i64.extend_i32_u
        i64.const -1
        i64.add
        local.get 2
        i64.extend_i32_u
        i64.lt_u
        br_if 1 (;@1;)
      end
      local.get 0
      return
    end
    call $a_crash.1
    unreachable)
  (func $a_cas.1 (type 0) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    i32.atomic.rmw.cmpxchg)
  (func $nontrivial_free (type 20) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const 1
    local.get 2
    i32.shl
    local.set 4
    local.get 1
    i32.load offset=16
    local.get 1
    i32.load offset=12
    i32.or
    local.set 5
    local.get 1
    i32.load offset=20
    local.tee 2
    i32.const 6
    i32.shr_u
    i32.const 63
    i32.and
    local.set 6
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 32
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          local.get 4
          i32.add
          i32.const 2
          local.get 2
          i32.shl
          i32.const -1
          i32.add
          i32.ne
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 6
            i32.const 47
            i32.gt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 31
            i32.and
            local.set 7
            i32.const 0
            local.set 8
            block  ;; label = @5
              local.get 2
              i32.const 4096
              i32.lt_u
              local.tee 9
              br_if 0 (;@5;)
              local.get 7
              br_if 0 (;@5;)
              local.get 2
              i32.const -4096
              i32.and
              i32.const -16
              i32.add
              local.get 6
              i32.const 1
              i32.shl
              i32.load16_u offset=1568
              i32.const 4
              i32.shl
              i32.lt_u
              local.set 8
            end
            local.get 9
            br_if 0 (;@4;)
            local.get 8
            br_if 0 (;@4;)
            local.get 1
            i32.load offset=4
            local.get 1
            i32.ne
            br_if 0 (;@4;)
            local.get 6
            i32.const -7
            i32.add
            local.tee 2
            i32.const 31
            i32.gt_u
            br_if 0 (;@4;)
            local.get 2
            i32.load8_u offset=5496
            i32.const 100
            i32.lt_u
            br_if 0 (;@4;)
            local.get 7
            i32.const 9
            i32.mul
            i32.const 9
            i32.add
            local.get 6
            i32.const 2
            i32.shl
            i32.load offset=5272
            i32.gt_u
            br_if 1 (;@3;)
            local.get 7
            i32.const 18
            i32.gt_u
            br_if 1 (;@3;)
          end
          block  ;; label = @4
            local.get 1
            i32.load offset=4
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.const 48
            i32.ge_u
            br_if 3 (;@1;)
            local.get 6
            i32.const 2
            i32.shl
            local.tee 5
            i32.const 5080
            i32.add
            local.set 6
            local.get 5
            i32.load offset=5080
            local.set 5
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 2
                  local.get 1
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 2
                  br 1 (;@6;)
                end
                local.get 1
                i32.load
                local.tee 4
                local.get 2
                i32.store offset=4
                local.get 1
                i32.load offset=4
                local.tee 2
                local.get 4
                i32.store
                local.get 6
                i32.load
                local.get 1
                i32.ne
                br_if 1 (;@5;)
              end
              local.get 6
              local.get 2
              i32.store
            end
            local.get 1
            i64.const 0
            i64.store align=4
            local.get 5
            local.get 1
            i32.ne
            br_if 0 (;@4;)
            local.get 6
            i32.load
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            i32.load offset=12
            br_if 3 (;@1;)
            local.get 4
            i32.const 16
            i32.add
            local.set 6
            i32.const 0
            i32.const 2
            local.get 4
            i32.load offset=8
            i32.load8_u offset=4
            i32.shl
            local.tee 8
            i32.sub
            local.set 5
            loop  ;; label = @5
              local.get 6
              i32.load
              local.set 2
              local.get 2
              local.get 6
              local.get 2
              local.get 2
              local.get 5
              i32.and
              call $a_cas.1
              i32.ne
              br_if 0 (;@5;)
            end
            local.get 4
            local.get 2
            local.get 8
            i32.const -1
            i32.add
            i32.and
            i32.store offset=12
          end
          local.get 0
          i64.const 0
          i64.store align=4
          block  ;; label = @4
            local.get 1
            i32.load offset=20
            local.tee 2
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            local.tee 6
            i32.const 47
            i32.gt_u
            br_if 0 (;@4;)
            local.get 6
            i32.const 2
            i32.shl
            local.tee 5
            local.get 5
            i32.load offset=5272
            local.get 2
            i32.const -1
            i32.xor
            i32.const -32
            i32.or
            i32.add
            i32.store offset=5272
            local.get 1
            i32.load offset=20
            local.set 2
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.const 4096
              i32.lt_u
              br_if 0 (;@5;)
              block  ;; label = @6
                block  ;; label = @7
                  i32.const 0
                  i32.load8_u offset=5528
                  local.tee 2
                  i32.const 255
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  i64.const 0
                  i64.store offset=5488
                  i32.const 0
                  i64.const 0
                  i64.store offset=5480
                  i32.const 0
                  i64.const 0
                  i64.store offset=5472
                  i32.const 0
                  i64.const 0
                  i64.store offset=5464
                  i32.const 1
                  local.set 2
                  br 1 (;@6;)
                end
                local.get 2
                i32.const 1
                i32.add
                local.set 2
              end
              i32.const 0
              local.get 2
              i32.store8 offset=5528
              block  ;; label = @6
                local.get 6
                i32.const -7
                i32.add
                local.tee 6
                i32.const 31
                i32.gt_u
                br_if 0 (;@6;)
                local.get 6
                local.get 2
                i32.store8 offset=5464
              end
              local.get 0
              local.get 1
              i32.load offset=8
              i32.store
              local.get 0
              local.get 1
              i32.load offset=20
              i32.const -4096
              i32.and
              i32.store offset=4
              br 1 (;@4;)
            end
            local.get 1
            i32.load offset=8
            local.tee 2
            call $get_meta
            local.set 6
            local.get 2
            i32.const -3
            i32.add
            i32.load8_u
            local.set 2
            local.get 1
            i32.load offset=8
            i32.const 0
            i32.store
            local.get 3
            i32.const 8
            i32.add
            local.get 6
            local.get 2
            i32.const 31
            i32.and
            call $nontrivial_free
            local.get 0
            local.get 3
            i64.load offset=8
            i64.store align=4
          end
          local.get 3
          i64.const 0
          i64.store offset=8
          local.get 1
          local.get 3
          i64.load offset=8
          i64.store align=4
          local.get 3
          i64.const 0
          i64.store offset=16
          local.get 1
          local.get 3
          i64.load offset=16
          i64.store offset=8 align=4
          local.get 3
          i64.const 0
          i64.store offset=24
          local.get 1
          local.get 3
          i64.load offset=24
          i64.store offset=16 align=4
          local.get 1
          i32.load offset=4
          br_if 2 (;@1;)
          local.get 1
          i32.load
          br_if 2 (;@1;)
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=5048
              local.tee 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              local.get 2
              i32.store offset=4
              local.get 2
              i32.load
              local.tee 2
              local.get 1
              i32.store offset=4
              local.get 1
              i32.load offset=4
              local.set 6
              br 1 (;@4;)
            end
            local.get 1
            local.get 1
            i32.store offset=4
            i32.const 5048
            local.set 6
            local.get 1
            local.set 2
          end
          local.get 1
          local.get 2
          i32.store
          local.get 6
          local.get 1
          i32.store
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 5
          br_if 0 (;@3;)
          local.get 6
          i32.const 48
          i32.ge_u
          br_if 2 (;@1;)
          local.get 6
          i32.const 2
          i32.shl
          local.tee 6
          i32.load offset=5080
          local.tee 2
          local.get 1
          i32.eq
          br_if 0 (;@3;)
          local.get 1
          i32.load offset=4
          br_if 2 (;@1;)
          local.get 1
          i32.load
          br_if 2 (;@1;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              local.get 2
              i32.store offset=4
              local.get 2
              i32.load
              local.tee 2
              local.get 1
              i32.store offset=4
              local.get 1
              i32.load offset=4
              local.set 6
              br 1 (;@4;)
            end
            local.get 6
            i32.const 5080
            i32.add
            local.set 6
            local.get 1
            local.get 1
            i32.store offset=4
            local.get 1
            local.set 2
          end
          local.get 1
          local.get 2
          i32.store
          local.get 6
          local.get 1
          i32.store
        end
        local.get 1
        i32.const 16
        i32.add
        local.get 4
        call $a_or
        local.get 0
        i64.const 0
        i64.store align=4
      end
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    call $a_crash.1
    unreachable)
  (func $a_crash.1 (type 14)
    unreachable)
  (func $a_or (type 21) (param i32 i32)
    local.get 0
    local.get 1
    i32.atomic.rmw.or
    drop)
  (func $__libc_realloc (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      local.get 1
      call $__libc_malloc_impl
      return
    end
    block  ;; label = @1
      local.get 1
      i32.const 2147479551
      i32.lt_u
      br_if 0 (;@1;)
      call $__errno_location
      i32.const 12
      i32.store
      i32.const 0
      return
    end
    block  ;; label = @1
      local.get 0
      i32.const 15
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const -3
      i32.add
      local.tee 2
      i32.load8_u
      local.set 3
      local.get 0
      i32.const -2
      i32.add
      i32.load16_u
      local.set 4
      block  ;; label = @2
        local.get 0
        i32.const -4
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        br_if 1 (;@1;)
        local.get 0
        i32.const -8
        i32.add
        i32.load
        local.tee 4
        i32.const 65535
        i32.le_s
        br_if 1 (;@1;)
      end
      local.get 0
      local.get 4
      i32.const 4
      i32.shl
      i32.sub
      i32.const -16
      i32.add
      local.tee 5
      i32.load
      local.tee 6
      i32.load offset=8
      local.tee 7
      local.get 5
      i32.ne
      br_if 0 (;@1;)
      local.get 6
      i32.load offset=20
      local.tee 8
      i32.const 31
      i32.and
      local.tee 9
      local.get 3
      i32.const 31
      i32.and
      local.tee 5
      i32.lt_u
      br_if 0 (;@1;)
      local.get 6
      i32.load offset=12
      i32.const 1
      local.get 5
      i32.shl
      local.tee 10
      i32.and
      br_if 0 (;@1;)
      local.get 6
      i32.load offset=16
      local.get 10
      i32.and
      br_if 0 (;@1;)
      local.get 6
      i32.const -4096
      i32.and
      i64.load
      i32.const 0
      i64.load offset=5032
      i64.ne
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 8
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          local.tee 10
          i32.const 47
          i32.gt_u
          br_if 0 (;@3;)
          local.get 4
          local.get 10
          i32.const 1
          i32.shl
          i32.load16_u offset=1568
          local.tee 11
          local.get 5
          i32.mul
          i32.lt_u
          br_if 2 (;@1;)
          local.get 4
          local.get 5
          i32.const 1
          i32.add
          local.get 11
          i32.mul
          i32.lt_u
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        local.get 10
        i32.const 63
        i32.ne
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 8
          i32.const 4096
          i32.lt_u
          br_if 0 (;@3;)
          local.get 8
          i32.const 4
          i32.shr_u
          i32.const 268435200
          i32.and
          i64.extend_i32_u
          i64.const -1
          i64.add
          local.get 4
          i64.extend_i32_u
          i64.lt_u
          br_if 2 (;@1;)
          local.get 9
          br_if 0 (;@3;)
          local.get 8
          i32.const -4096
          i32.and
          i32.const -16
          i32.add
          local.set 9
          br 1 (;@2;)
        end
        local.get 10
        i32.const 1
        i32.shl
        i32.load16_u offset=1568
        i32.const 4
        i32.shl
        local.set 9
      end
      local.get 3
      i32.const 5
      i32.shr_u
      local.set 4
      local.get 7
      local.get 9
      local.get 5
      i32.mul
      i32.add
      i32.const 16
      i32.add
      local.tee 11
      local.get 9
      i32.add
      local.set 5
      block  ;; label = @2
        local.get 3
        i32.const 160
        i32.lt_u
        br_if 0 (;@2;)
        local.get 4
        i32.const 5
        i32.ne
        br_if 1 (;@1;)
        local.get 5
        i32.const -8
        i32.add
        i32.load
        local.tee 4
        i32.const 4
        i32.le_u
        br_if 1 (;@1;)
        local.get 5
        i32.const -9
        i32.add
        i32.load8_u
        br_if 1 (;@1;)
      end
      local.get 4
      local.get 5
      i32.const -4
      i32.add
      local.tee 3
      local.get 0
      i32.sub
      local.tee 9
      i32.gt_u
      br_if 0 (;@1;)
      local.get 3
      local.get 4
      i32.sub
      local.tee 4
      i32.load8_u
      br_if 0 (;@1;)
      local.get 3
      i32.load8_u
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const 131051
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          local.get 9
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 3
          i32.add
          i32.const 4
          i32.shr_u
          local.set 6
          block  ;; label = @4
            local.get 1
            i32.const 157
            i32.lt_u
            br_if 0 (;@4;)
            i32.const 120
            i32.const 122
            local.get 6
            i32.const 121
            local.get 6
            i32.const 1
            i32.add
            call $a_clz_32.1
            i32.const 2
            i32.shl
            local.tee 8
            i32.sub
            i32.const 1
            i32.shl
            i32.load16_u offset=1568
            i32.lt_u
            select
            local.get 8
            i32.sub
            local.tee 8
            local.get 6
            local.get 8
            i32.const 1
            i32.shl
            i32.load16_u offset=1568
            i32.ge_u
            i32.or
            local.set 6
          end
          local.get 6
          i32.const 1
          i32.add
          local.get 10
          i32.lt_u
          br_if 1 (;@2;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              local.get 1
              local.get 0
              i32.add
              i32.sub
              local.tee 1
              br_if 0 (;@5;)
              i32.const 0
              local.set 6
              br 1 (;@4;)
            end
            local.get 3
            local.get 1
            i32.sub
            i32.const 0
            i32.store8
            i32.const 5
            local.set 6
            block  ;; label = @5
              local.get 1
              i32.const 5
              i32.ge_s
              br_if 0 (;@5;)
              local.get 1
              local.set 6
              br 1 (;@4;)
            end
            local.get 5
            i32.const -9
            i32.add
            i32.const 0
            i32.store8
            local.get 5
            i32.const -8
            i32.add
            local.get 1
            i32.store
          end
          local.get 2
          local.get 6
          i32.const 5
          i32.shl
          local.get 2
          i32.load8_u
          i32.const 31
          i32.and
          i32.or
          i32.store8
          local.get 0
          return
        end
        local.get 1
        i32.const 131052
        i32.lt_u
        br_if 0 (;@2;)
        local.get 10
        i32.const 48
        i32.lt_u
        br_if 0 (;@2;)
        local.get 10
        i32.const 63
        i32.ne
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 8
          i32.const -4096
          i32.and
          local.tee 8
          local.get 1
          local.get 0
          local.get 11
          i32.sub
          local.tee 5
          i32.add
          i32.const 4115
          i32.add
          i32.const -4096
          i32.and
          local.tee 3
          i32.eq
          br_if 0 (;@3;)
          local.get 7
          local.get 8
          local.get 3
          i32.const 1
          i32.const 0
          call $__mremap
          local.set 7
        end
        local.get 7
        i32.const -1
        i32.eq
        br_if 0 (;@2;)
        local.get 6
        local.get 7
        i32.store offset=8
        local.get 6
        local.get 6
        i32.load offset=20
        i32.const 4095
        i32.and
        local.get 3
        i32.or
        i32.store offset=20
        i32.const 0
        local.set 6
        local.get 7
        local.get 3
        i32.add
        local.tee 3
        i32.const -4
        i32.add
        local.tee 4
        i32.const 0
        i32.store8
        block  ;; label = @3
          local.get 4
          local.get 1
          local.get 7
          local.get 5
          i32.add
          i32.const 16
          i32.add
          local.tee 0
          i32.add
          i32.sub
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 1
          i32.sub
          i32.const 0
          i32.store8
          i32.const 5
          local.set 6
          block  ;; label = @4
            local.get 1
            i32.const 5
            i32.ge_s
            br_if 0 (;@4;)
            local.get 1
            local.set 6
            br 1 (;@3;)
          end
          local.get 3
          i32.const -9
          i32.add
          i32.const 0
          i32.store8
          local.get 3
          i32.const -8
          i32.add
          local.get 1
          i32.store
        end
        local.get 0
        i32.const -3
        i32.add
        local.tee 1
        local.get 6
        i32.const 5
        i32.shl
        local.get 1
        i32.load8_u
        i32.const 31
        i32.and
        i32.or
        i32.store8
        local.get 0
        return
      end
      block  ;; label = @2
        local.get 1
        call $__libc_malloc_impl
        local.tee 6
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      local.get 6
      local.get 0
      local.get 1
      local.get 4
      local.get 0
      i32.sub
      local.tee 4
      local.get 1
      local.get 4
      i32.lt_u
      select
      call $memcpy
      drop
      local.get 0
      call $__libc_free
      local.get 6
      return
    end
    call $a_crash.2
    unreachable)
  (func $a_clz_32.1 (type 10) (param i32) (result i32)
    local.get 0
    i32.clz)
  (func $a_crash.2 (type 14)
    unreachable)
  (func $realloc (type 6) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__libc_realloc)
  (func $free (type 1) (param i32)
    local.get 0
    call $__libc_free)
  (func $unsetenv (type 10) (param i32) (result i32)
    (local i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 61
        call $__strchrnul
        local.tee 1
        local.get 0
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 0
        i32.sub
        local.tee 2
        i32.add
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
      end
      call $__errno_location
      i32.const 22
      i32.store
      i32.const -1
      return
    end
    i32.const 0
    local.set 3
    block  ;; label = @1
      i32.const 0
      i32.load offset=5024
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.load
      local.tee 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      local.set 1
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            local.get 5
            local.get 2
            call $strncmp
            br_if 0 (;@4;)
            local.get 1
            i32.load
            local.tee 5
            local.get 2
            i32.add
            i32.load8_u
            i32.const 61
            i32.ne
            br_if 0 (;@4;)
            local.get 5
            i32.const 0
            call $dummy.1
            br 1 (;@3;)
          end
          block  ;; label = @4
            local.get 1
            local.get 4
            i32.eq
            br_if 0 (;@4;)
            local.get 4
            local.get 1
            i32.load
            i32.store
          end
          local.get 4
          i32.const 4
          i32.add
          local.set 4
        end
        local.get 1
        i32.const 4
        i32.add
        local.tee 1
        i32.load
        local.tee 5
        br_if 0 (;@2;)
      end
      i32.const 0
      local.set 3
      local.get 1
      local.get 4
      i32.eq
      br_if 0 (;@1;)
      local.get 4
      i32.const 0
      i32.store
    end
    local.get 3)
  (func $dummy.1 (type 21) (param i32 i32))
  (func $__putenv (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.load offset=5024
        local.tee 3
        br_if 0 (;@2;)
        i32.const 0
        local.set 3
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 3
        i32.load
        local.tee 4
        br_if 0 (;@2;)
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      local.get 1
      i32.const 1
      i32.add
      local.set 5
      i32.const 0
      local.set 1
      loop  ;; label = @2
        block  ;; label = @3
          local.get 0
          local.get 4
          local.get 5
          call $strncmp
          br_if 0 (;@3;)
          local.get 3
          i32.load
          local.set 1
          local.get 3
          local.get 0
          i32.store
          local.get 1
          local.get 2
          call $dummy.1
          i32.const 0
          return
        end
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 3
        i32.const 4
        i32.add
        local.tee 3
        i32.load
        local.tee 4
        br_if 0 (;@2;)
      end
      i32.const 0
      i32.load offset=5024
      local.set 3
    end
    local.get 1
    i32.const 2
    i32.shl
    local.tee 6
    i32.const 8
    i32.add
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 0
          i32.load offset=5540
          local.tee 5
          i32.ne
          br_if 0 (;@3;)
          local.get 5
          local.get 4
          call $realloc
          local.tee 3
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        local.get 4
        call $default_malloc
        local.tee 3
        i32.eqz
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.const 0
          i32.load offset=5024
          local.get 6
          call $memcpy
          drop
        end
        i32.const 0
        i32.load offset=5540
        call $free
      end
      i32.const 0
      local.set 4
      i32.const 0
      local.get 3
      i32.store offset=5540
      i32.const 0
      local.get 3
      i32.store offset=5024
      local.get 3
      local.get 1
      i32.const 2
      i32.shl
      i32.add
      local.tee 3
      local.get 0
      i32.store
      local.get 3
      i32.const 4
      i32.add
      i32.const 0
      i32.store
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        i32.const 0
        local.get 2
        call $dummy.1
      end
      local.get 4
      return
    end
    local.get 2
    call $free
    i32.const -1)
  (func $putenv (type 10) (param i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 61
        call $__strchrnul
        local.tee 1
        local.get 0
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 0
        i32.sub
        local.tee 1
        i32.add
        i32.load8_u
        br_if 1 (;@1;)
      end
      local.get 0
      call $unsetenv
      return
    end
    local.get 0
    local.get 1
    i32.const 0
    call $__putenv)
  (func $init_env (type 4) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 1152
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 1000
        call $get_init_envfile
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 1
        local.get 0
        i32.const 4
        call $access
        br_if 1 (;@1;)
        i32.const 259
        local.set 1
        local.get 0
        i32.const 0
        i32.const 0
        call $open
        local.tee 2
        i32.const 0
        i32.lt_s
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 2
          local.get 0
          i32.const 1008
          i32.add
          call $__fstat
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          local.get 2
          call $close
          drop
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 0
          i32.load offset=1056
          local.tee 3
          br_if 0 (;@3;)
          local.get 2
          call $close
          drop
          br 1 (;@2;)
        end
        i32.const 0
        local.get 3
        i32.const 3
        i32.const 2
        local.get 2
        i64.const 0
        call $__mmap
        local.set 4
        local.get 2
        call $close
        drop
        block  ;; label = @3
          local.get 4
          i32.const -1
          i32.ne
          br_if 0 (;@3;)
          i32.const 261
          local.set 1
          br 2 (;@1;)
        end
        local.get 4
        local.get 3
        i32.add
        local.set 5
        local.get 4
        local.set 6
        block  ;; label = @3
          local.get 3
          i32.const 1
          i32.lt_s
          br_if 0 (;@3;)
          local.get 4
          local.set 2
          local.get 4
          local.set 6
          loop  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.load8_u
              i32.const 10
              i32.ne
              br_if 0 (;@5;)
              local.get 2
              i32.const 0
              i32.store8
              block  ;; label = @6
                local.get 6
                call $strdup
                call $putenv
                i32.eqz
                br_if 0 (;@6;)
                local.get 4
                local.get 3
                call $__munmap
                drop
                br 5 (;@1;)
              end
              local.get 2
              i32.const 1
              i32.add
              local.set 6
            end
            local.get 2
            i32.const 1
            i32.add
            local.tee 2
            local.get 5
            i32.lt_u
            br_if 0 (;@4;)
          end
        end
        block  ;; label = @3
          local.get 6
          local.get 5
          i32.ge_u
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 5
            local.get 6
            i32.sub
            local.tee 5
            i32.const 1
            i32.add
            call $default_malloc
            local.tee 2
            br_if 0 (;@4;)
            local.get 4
            local.get 3
            call $__munmap
            drop
            i32.const 261
            local.set 1
            br 3 (;@1;)
          end
          local.get 2
          local.get 6
          local.get 5
          call $memcpy
          drop
          local.get 2
          local.get 5
          i32.add
          i32.const 0
          i32.store8
          local.get 2
          call $putenv
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          call $free
          local.get 4
          local.get 3
          call $__munmap
          drop
          br 2 (;@1;)
        end
        local.get 4
        local.get 3
        call $__munmap
        drop
      end
      i32.const 0
      local.set 1
    end
    local.get 0
    i32.const 1152
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $__wali_startup (type 4) (result i32)
    (local i32)
    block  ;; label = @1
      call $a_cas.2
      br_if 0 (;@1;)
      block  ;; label = @2
        call $__wali_init
        local.tee 0
        br_if 0 (;@2;)
        call $__wasm_init_tp
        call $init_env
        local.set 0
      end
      local.get 0
      return
    end
    unreachable)
  (func $a_cas.2 (type 4) (result i32)
    i32.const 0
    i32.const 0
    i32.const 1
    i32.atomic.rmw.cmpxchg offset=5544)
  (func $__wali_cleanup (type 4) (result i32)
    call $__wali_deinit)
  (func $__main_void (type 4) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      call $__cl_get_argc
      local.tee 0
      i32.const 2
      i32.shl
      i32.const 4
      i32.add
      call $default_malloc
      local.tee 1
      br_if 0 (;@1;)
      i32.const 1
      return
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 1
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        local.get 1
        local.set 3
        loop  ;; label = @3
          i32.const 1
          local.set 4
          local.get 3
          local.get 2
          call $__cl_get_argv_len
          i32.const 1
          i32.add
          call $default_malloc
          local.tee 5
          i32.store
          local.get 5
          i32.eqz
          br_if 2 (;@1;)
          local.get 5
          local.get 2
          call $__cl_copy_argv
          drop
          local.get 3
          i32.const 4
          i32.add
          local.set 3
          local.get 0
          local.get 2
          i32.const 1
          i32.add
          local.tee 2
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 1
      local.get 0
      i32.const 2
      i32.shl
      i32.add
      i32.const 0
      i32.store
      local.get 0
      local.get 1
      call $main
      local.set 4
    end
    local.get 4)
  (func $__fstat (type 6) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.const -1
      i32.gt_s
      br_if 0 (;@1;)
      i64.const -9
      call $__syscall_ret
      i32.wrap_i64
      return
    end
    local.get 0
    i32.const 1556
    local.get 1
    i32.const 4096
    call $__fstatat)
  (func $__procfdname (type 21) (param i32 i32)
    (local i32 i32)
    local.get 0
    i32.const 0
    i32.store8 offset=14
    local.get 0
    i32.const 12132
    i32.store16 offset=12 align=1
    local.get 0
    i32.const 1714382444
    i32.store offset=8 align=1
    local.get 0
    i64.const 7310238724270485551
    i64.store align=1
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 13
      i32.add
      local.set 0
      local.get 1
      local.set 2
      loop  ;; label = @2
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 2
        i32.const 9
        i32.gt_u
        local.set 3
        local.get 2
        i32.const 10
        i32.div_u
        local.set 2
        local.get 3
        br_if 0 (;@2;)
      end
      local.get 0
      i32.const 1
      i32.add
      i32.const 0
      i32.store8
      loop  ;; label = @2
        local.get 0
        local.get 1
        local.get 1
        i32.const 10
        i32.div_u
        local.tee 2
        i32.const 10
        i32.mul
        i32.sub
        i32.const 48
        i32.or
        i32.store8
        local.get 0
        i32.const -1
        i32.add
        local.set 0
        local.get 1
        i32.const 9
        i32.gt_u
        local.set 3
        local.get 2
        local.set 1
        local.get 3
        br_if 0 (;@2;)
      end
      return
    end
    local.get 0
    i32.const 48
    i32.store16 offset=14 align=1)
  (func $__fstatat (type 18) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i64)
    global.get $__stack_pointer
    i32.const 176
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 0
              i32.lt_s
              br_if 0 (;@5;)
              local.get 3
              i32.const 4096
              i32.ne
              br_if 0 (;@5;)
              local.get 1
              i32.load8_u
              br_if 1 (;@4;)
              local.get 0
              local.get 4
              i32.const 32
              i32.add
              call $__syscall_SYS_fstat
              i32.wrap_i64
              local.tee 3
              i32.const -9
              i32.ne
              br_if 3 (;@2;)
              i32.const -9
              local.set 3
              local.get 0
              i32.const 1
              i64.const 0
              call $__syscall_SYS_fcntl
              i64.const 0
              i64.lt_s
              br_if 4 (;@1;)
              local.get 0
              local.get 1
              local.get 4
              i32.const 32
              i32.add
              i32.const 4096
              call $__syscall_SYS_newfstatat
              i32.wrap_i64
              local.tee 3
              i32.const -22
              i32.ne
              br_if 3 (;@2;)
              local.get 4
              local.get 0
              call $__procfdname
              local.get 4
              local.get 4
              i32.const 32
              i32.add
              call $__syscall_SYS_stat
              i32.wrap_i64
              local.set 3
              br 3 (;@2;)
            end
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.const -100
                i32.eq
                br_if 0 (;@6;)
                local.get 1
                i32.load8_u
                local.set 5
                block  ;; label = @7
                  local.get 3
                  i32.const 256
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 255
                  i32.and
                  i32.const 47
                  i32.eq
                  br_if 2 (;@5;)
                end
                local.get 3
                br_if 2 (;@4;)
                local.get 5
                i32.const 255
                i32.and
                i32.const 47
                i32.ne
                br_if 2 (;@4;)
                br 3 (;@3;)
              end
              local.get 3
              i32.eqz
              br_if 2 (;@3;)
              local.get 3
              i32.const 256
              i32.ne
              br_if 1 (;@4;)
            end
            local.get 1
            local.get 4
            i32.const 32
            i32.add
            call $__syscall_SYS_lstat
            i32.wrap_i64
            local.set 3
            br 2 (;@2;)
          end
          local.get 0
          local.get 1
          local.get 4
          i32.const 32
          i32.add
          local.get 3
          call $__syscall_SYS_newfstatat
          i32.wrap_i64
          local.set 3
          br 1 (;@2;)
        end
        local.get 1
        local.get 4
        i32.const 32
        i32.add
        call $__syscall_SYS_stat
        i32.wrap_i64
        local.set 3
      end
      local.get 3
      br_if 0 (;@1;)
      local.get 2
      local.get 4
      i64.load offset=144
      i64.store offset=112
      local.get 2
      local.get 4
      i64.load offset=136
      i64.store offset=104
      local.get 2
      local.get 4
      i64.load offset=128
      i64.store offset=96
      local.get 2
      local.get 4
      i64.load offset=120
      i64.store offset=88
      local.get 2
      local.get 4
      i64.load offset=112
      i64.store offset=80
      local.get 2
      local.get 4
      i64.load offset=104
      i64.store offset=72
      local.get 2
      local.get 4
      i64.load offset=96
      i64.store offset=64
      local.get 2
      local.get 4
      i64.load offset=88
      i64.store offset=56
      local.get 2
      local.get 4
      i64.load offset=80
      i64.store offset=48
      local.get 2
      local.get 4
      i64.load offset=72
      i64.store offset=40
      i32.const 0
      local.set 3
      local.get 2
      i32.const 0
      i32.store offset=36
      local.get 2
      local.get 4
      i32.load offset=64
      i32.store offset=32
      local.get 2
      local.get 4
      i64.load offset=56
      i64.store offset=24
      local.get 2
      local.get 4
      i64.load offset=48
      i64.store offset=16
      local.get 2
      local.get 4
      i64.load offset=40
      i64.store offset=8
      local.get 2
      local.get 4
      i64.load offset=32
      i64.store
      local.get 2
      i64.const 0
      i64.store offset=136
      local.get 2
      i64.const 0
      i64.store offset=128
      local.get 2
      i64.const 0
      i64.store offset=120
    end
    local.get 3
    i64.extend_i32_s
    call $__syscall_ret
    local.set 6
    local.get 4
    i32.const 176
    i32.add
    global.set $__stack_pointer
    local.get 6
    i32.wrap_i64)
  (func $fprintf (type 0) (param i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 2
    i32.store offset=12
    local.get 0
    local.get 1
    local.get 2
    call $vfprintf
    local.set 2
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $printf (type 6) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.store offset=12
    i32.const 4808
    local.get 0
    local.get 1
    call $vfprintf
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $dummy.2 (type 10) (param i32) (result i32)
    local.get 0)
  (func $__stdio_close (type 10) (param i32) (result i32)
    local.get 0
    i32.load offset=60
    call $dummy.2
    call $__syscall_SYS_close
    call $__syscall_ret
    i32.wrap_i64)
  (func $__stdio_write (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 2
    i32.store offset=12
    local.get 3
    local.get 1
    i32.store offset=8
    local.get 3
    local.get 0
    i32.load offset=28
    local.tee 1
    i32.store
    local.get 3
    local.get 0
    i32.load offset=20
    local.get 1
    i32.sub
    local.tee 1
    i32.store offset=4
    i32.const 2
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        local.get 2
        i32.add
        local.tee 5
        local.get 0
        i32.load offset=60
        local.get 3
        i32.const 2
        call $__syscall_SYS_writev
        call $__syscall_ret
        i32.wrap_i64
        local.tee 1
        i32.eq
        br_if 0 (;@2;)
        local.get 3
        local.set 6
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const -1
            i32.gt_s
            br_if 0 (;@4;)
            i32.const 0
            local.set 1
            local.get 0
            i32.const 0
            i32.store offset=28
            local.get 0
            i64.const 0
            i64.store offset=16
            local.get 0
            local.get 0
            i32.load
            i32.const 32
            i32.or
            i32.store
            local.get 4
            i32.const 2
            i32.eq
            br_if 3 (;@1;)
            local.get 2
            local.get 6
            i32.load offset=4
            i32.sub
            local.set 1
            br 3 (;@1;)
          end
          local.get 6
          i32.const 8
          i32.const 0
          local.get 6
          i32.load offset=4
          local.tee 7
          local.get 1
          i32.lt_u
          local.tee 8
          select
          i32.add
          local.tee 9
          local.get 9
          i32.load
          local.get 1
          local.get 7
          i32.const 0
          local.get 8
          select
          i32.sub
          local.tee 7
          i32.add
          i32.store
          local.get 6
          i32.const 12
          i32.const 4
          local.get 8
          select
          i32.add
          local.tee 6
          local.get 6
          i32.load
          local.get 7
          i32.sub
          i32.store
          local.get 5
          local.get 1
          i32.sub
          local.set 5
          local.get 0
          i32.load offset=60
          local.get 9
          local.get 4
          local.get 8
          i32.sub
          local.tee 4
          call $__syscall_SYS_writev
          call $__syscall_ret
          i32.wrap_i64
          local.tee 8
          local.set 1
          local.get 9
          local.set 6
          local.get 5
          local.get 8
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 0
      local.get 0
      i32.load offset=44
      local.tee 1
      i32.store offset=28
      local.get 0
      local.get 1
      i32.store offset=20
      local.get 0
      local.get 1
      local.get 0
      i32.load offset=48
      i32.add
      i32.store offset=16
      local.get 2
      local.set 1
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $__stdio_seek (type 13) (param i32 i64 i32) (result i64)
    local.get 0
    i32.load offset=60
    local.get 1
    local.get 2
    call $__lseek)
  (func $__stdout_write (type 0) (param i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 0
    i32.const 2
    i32.store offset=36
    block  ;; label = @1
      local.get 0
      i32.load8_u
      i32.const 64
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=60
      i32.const 21523
      local.get 3
      i32.const 8
      i32.add
      call $__syscall_SYS_ioctl
      i64.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const -1
      i32.store offset=88
    end
    local.get 0
    local.get 1
    local.get 2
    call $__stdio_write
    local.set 0
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $__lockfile (type 10) (param i32) (result i32)
    (local i32 i32 i32 i32)
    i32.const 0
    local.set 1
    block  ;; label = @1
      local.get 0
      i32.load offset=84
      i32.const -1073741825
      i32.and
      global.get $__tls_base
      i32.const 0
      i32.add
      i32.load offset=24
      local.tee 2
      i32.eq
      br_if 0 (;@1;)
      i32.const 1
      local.set 1
      local.get 0
      i32.const 84
      i32.add
      local.tee 3
      i32.const 0
      local.get 2
      call $a_cas.3
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const 0
      local.get 2
      i32.const 1073741824
      i32.or
      local.tee 4
      call $a_cas.3
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 1073741824
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              local.set 2
              br 1 (;@4;)
            end
            local.get 3
            local.get 0
            local.get 0
            i32.const 1073741824
            i32.or
            local.tee 2
            call $a_cas.3
            local.get 0
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 3
          i32.const 128
          local.get 2
          i32.const 0
          i32.const 0
          i32.const 0
          call $__syscall_SYS_futex
          i64.const -38
          i64.ne
          br_if 0 (;@3;)
          local.get 3
          i32.const 0
          local.get 2
          i32.const 0
          i32.const 0
          i32.const 0
          call $__syscall_SYS_futex
          drop
        end
        local.get 3
        i32.const 0
        local.get 4
        call $a_cas.3
        local.tee 0
        br_if 0 (;@2;)
      end
    end
    local.get 1)
  (func $a_cas.3 (type 0) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    i32.atomic.rmw.cmpxchg)
  (func $__unlockfile (type 1) (param i32)
    block  ;; label = @1
      local.get 0
      i32.const 84
      i32.add
      local.tee 0
      call $a_swap
      i32.const 1073741824
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 129
      i32.const 1
      i32.const 0
      i32.const 0
      i32.const 0
      call $__syscall_SYS_futex
      i64.const -38
      i64.ne
      br_if 0 (;@1;)
      local.get 0
      i32.const 1
      i32.const 1
      i32.const 0
      i32.const 0
      i32.const 0
      call $__syscall_SYS_futex
      drop
    end)
  (func $a_swap (type 10) (param i32) (result i32)
    local.get 0
    i32.const 0
    i32.atomic.rmw.xchg)
  (func $__towrite (type 10) (param i32) (result i32)
    (local i32)
    local.get 0
    local.get 0
    i32.load offset=80
    local.tee 1
    i32.const -1
    i32.add
    local.get 1
    i32.or
    i32.store offset=80
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.const 8
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 32
      i32.or
      i32.store
      i32.const -1
      return
    end
    local.get 0
    i64.const 0
    i64.store offset=4 align=4
    local.get 0
    local.get 0
    i32.load offset=44
    local.tee 1
    i32.store offset=28
    local.get 0
    local.get 1
    i32.store offset=20
    local.get 0
    local.get 1
    local.get 0
    i32.load offset=48
    i32.add
    i32.store offset=16
    i32.const 0)
  (func $__fwritex (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load offset=16
        local.tee 3
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        local.get 2
        call $__towrite
        br_if 1 (;@1;)
        local.get 2
        i32.load offset=16
        local.set 3
      end
      block  ;; label = @2
        local.get 1
        local.get 3
        local.get 2
        i32.load offset=20
        local.tee 5
        i32.sub
        i32.le_u
        br_if 0 (;@2;)
        local.get 2
        local.get 0
        local.get 1
        local.get 2
        i32.load offset=36
        call_indirect (type 0)
        return
      end
      i32.const 0
      local.set 6
      block  ;; label = @2
        local.get 2
        i32.load offset=88
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.add
        local.set 4
        i32.const 0
        local.set 3
        block  ;; label = @3
          loop  ;; label = @4
            local.get 4
            local.get 3
            i32.add
            i32.const -1
            i32.add
            i32.load8_u
            i32.const 10
            i32.eq
            br_if 1 (;@3;)
            local.get 1
            local.get 3
            i32.const -1
            i32.add
            local.tee 3
            i32.add
            br_if 0 (;@4;)
          end
          i32.const 0
          local.set 6
          br 1 (;@2;)
        end
        local.get 2
        local.get 0
        local.get 1
        local.get 3
        i32.add
        local.tee 6
        local.get 2
        i32.load offset=36
        call_indirect (type 0)
        local.tee 4
        local.get 6
        i32.lt_u
        br_if 1 (;@1;)
        local.get 6
        local.get 0
        i32.add
        local.set 0
        i32.const 0
        local.get 3
        i32.sub
        local.set 1
        local.get 2
        i32.load offset=20
        local.set 5
      end
      local.get 5
      local.get 0
      local.get 1
      call $memcpy
      drop
      local.get 2
      local.get 2
      i32.load offset=20
      local.get 1
      i32.add
      i32.store offset=20
      local.get 6
      local.get 1
      i32.add
      local.set 4
    end
    local.get 4)
  (func $fwrite (type 18) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.load offset=84
        i32.const 0
        i32.ge_s
        br_if 0 (;@2;)
        i32.const 1
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      call $__lockfile
      i32.eqz
      local.set 4
    end
    local.get 2
    local.get 1
    i32.mul
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.load offset=16
        local.tee 6
        br_if 0 (;@2;)
        i32.const 0
        local.set 7
        local.get 3
        call $__towrite
        br_if 1 (;@1;)
        local.get 3
        i32.load offset=16
        local.set 6
      end
      block  ;; label = @2
        local.get 5
        local.get 6
        local.get 3
        i32.load offset=20
        local.tee 8
        i32.sub
        i32.le_u
        br_if 0 (;@2;)
        local.get 3
        local.get 0
        local.get 5
        local.get 3
        i32.load offset=36
        call_indirect (type 0)
        local.set 7
        br 1 (;@1;)
      end
      i32.const 0
      local.set 9
      block  ;; label = @2
        block  ;; label = @3
          local.get 5
          br_if 0 (;@3;)
          local.get 5
          local.set 6
          br 1 (;@2;)
        end
        i32.const 0
        local.set 6
        block  ;; label = @3
          local.get 3
          i32.load offset=88
          i32.const 0
          i32.ge_s
          br_if 0 (;@3;)
          local.get 5
          local.set 6
          br 1 (;@2;)
        end
        local.get 0
        local.get 5
        i32.add
        local.set 7
        block  ;; label = @3
          loop  ;; label = @4
            local.get 7
            local.get 6
            i32.add
            i32.const -1
            i32.add
            i32.load8_u
            i32.const 10
            i32.eq
            br_if 1 (;@3;)
            local.get 5
            local.get 6
            i32.const -1
            i32.add
            local.tee 6
            i32.add
            br_if 0 (;@4;)
          end
          i32.const 0
          local.set 9
          local.get 5
          local.set 6
          br 1 (;@2;)
        end
        local.get 3
        local.get 0
        local.get 5
        local.get 6
        i32.add
        local.tee 9
        local.get 3
        i32.load offset=36
        call_indirect (type 0)
        local.tee 7
        local.get 9
        i32.lt_u
        br_if 1 (;@1;)
        local.get 9
        local.get 0
        i32.add
        local.set 0
        i32.const 0
        local.get 6
        i32.sub
        local.set 6
        local.get 3
        i32.load offset=20
        local.set 8
      end
      local.get 8
      local.get 0
      local.get 6
      call $memcpy
      drop
      local.get 3
      local.get 3
      i32.load offset=20
      local.get 6
      i32.add
      i32.store offset=20
      local.get 9
      local.get 6
      i32.add
      local.set 7
    end
    block  ;; label = @1
      local.get 4
      br_if 0 (;@1;)
      local.get 3
      call $__unlockfile
    end
    block  ;; label = @1
      local.get 7
      local.get 5
      i32.ne
      br_if 0 (;@1;)
      local.get 2
      i32.const 0
      local.get 1
      select
      return
    end
    local.get 7
    local.get 1
    i32.div_u)
  (func $dummy.3 (type 6) (param i32 i32) (result i32)
    local.get 0)
  (func $__lctrans (type 6) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $dummy.3)
  (func $strerror (type 10) (param i32) (result i32)
    i32.const 0
    local.get 0
    local.get 0
    i32.const 131
    i32.gt_u
    select
    i32.const 1
    i32.shl
    i32.load16_u offset=3616
    i32.const 1700
    i32.add
    global.get $__tls_base
    i32.const 0
    i32.add
    i32.load offset=112
    i32.load offset=20
    call $__lctrans)
  (func $wcrtomb (type 0) (param i32 i32 i32) (result i32)
    (local i32)
    i32.const 1
    local.set 3
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 1
        i32.const 127
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.store8
        i32.const 1
        return
      end
      block  ;; label = @2
        block  ;; label = @3
          global.get $__tls_base
          i32.const 0
          i32.add
          i32.load offset=112
          i32.load
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 1
            i32.const -128
            i32.and
            i32.const 57216
            i32.eq
            br_if 0 (;@4;)
            call $__errno_location
            i32.const 84
            i32.store
            br 2 (;@2;)
          end
          local.get 0
          local.get 1
          i32.store8
          i32.const 1
          return
        end
        block  ;; label = @3
          local.get 1
          i32.const 2047
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=1
          local.get 0
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 192
          i32.or
          i32.store8
          i32.const 2
          return
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 55296
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const -8192
            i32.and
            i32.const 57344
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=2
          local.get 0
          local.get 1
          i32.const 12
          i32.shr_u
          i32.const 224
          i32.or
          i32.store8
          local.get 0
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=1
          i32.const 3
          return
        end
        block  ;; label = @3
          local.get 1
          i32.const -65536
          i32.add
          i32.const 1048575
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=3
          local.get 0
          local.get 1
          i32.const 18
          i32.shr_u
          i32.const 240
          i32.or
          i32.store8
          local.get 0
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=2
          local.get 0
          local.get 1
          i32.const 12
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=1
          i32.const 4
          return
        end
        call $__errno_location
        i32.const 84
        i32.store
      end
      i32.const -1
      local.set 3
    end
    local.get 3)
  (func $wctomb (type 6) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    local.get 0
    local.get 1
    i32.const 0
    call $wcrtomb)
  (func $frexp (type 22) (param f64 i32) (result f64)
    (local i64 i32)
    block  ;; label = @1
      local.get 0
      i64.reinterpret_f64
      local.tee 2
      i64.const 52
      i64.shr_u
      i32.wrap_i64
      i32.const 2047
      i32.and
      local.tee 3
      i32.const 2047
      i32.eq
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 0
          f64.const 0x0p+0 (;=0;)
          f64.ne
          br_if 0 (;@3;)
          local.get 1
          i32.const 0
          i32.store
          local.get 0
          return
        end
        local.get 0
        f64.const 0x1p+64 (;=1.84467e+19;)
        f64.mul
        local.get 1
        call $frexp
        local.set 0
        local.get 1
        local.get 1
        i32.load
        i32.const -64
        i32.add
        i32.store
        local.get 0
        return
      end
      local.get 1
      local.get 3
      i32.const -1022
      i32.add
      i32.store
      local.get 2
      i64.const -9218868437227405313
      i64.and
      i64.const 4602678819172646912
      i64.or
      f64.reinterpret_i64
      local.set 0
    end
    local.get 0)
  (func $fputs (type 6) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    call $strlen
    local.set 2
    i32.const -1
    i32.const 0
    local.get 2
    local.get 0
    i32.const 1
    local.get 2
    local.get 1
    call $fwrite
    i32.ne
    select)
  (func $__block_all_sigs (type 1) (param i32)
    i32.const 0
    i32.const 3880
    local.get 0
    i32.const 8
    call $__syscall_SYS_rt_sigprocmask
    drop)
  (func $__block_app_sigs (type 1) (param i32)
    i32.const 0
    i32.const 3888
    local.get 0
    i32.const 8
    call $__syscall_SYS_rt_sigprocmask
    drop)
  (func $__restore_sigs (type 1) (param i32)
    i32.const 2
    local.get 0
    i32.const 0
    i32.const 8
    call $__syscall_SYS_rt_sigprocmask
    drop)
  (func $raise (type 10) (param i32) (result i32)
    (local i32 i32 i64)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    global.get $__tls_base
    local.set 2
    local.get 1
    call $__block_app_sigs
    local.get 2
    i32.const 0
    i32.add
    i32.load offset=24
    local.get 0
    call $__syscall_SYS_tkill
    call $__syscall_ret
    local.set 3
    local.get 1
    call $__restore_sigs
    local.get 1
    i32.const 128
    i32.add
    global.set $__stack_pointer
    local.get 3
    i32.wrap_i64)
  (func $abort (type 14)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    i32.const 6
    call $raise
    drop
    i32.const 0
    call $__block_all_sigs
    i32.const 6600
    call $__lock
    local.get 0
    i64.const 0
    i64.store offset=24
    local.get 0
    i64.const 0
    i64.store offset=16
    local.get 0
    i64.const 0
    i64.store offset=8
    i32.const 6
    local.get 0
    i32.const 8
    i32.add
    i32.const 0
    i32.const 8
    call $__syscall_SYS_rt_sigaction
    drop
    global.get $__tls_base
    i32.const 0
    i32.add
    i32.load offset=24
    i32.const 6
    call $__syscall_SYS_tkill
    drop
    local.get 0
    i64.const 32
    i64.store
    i32.const 1
    local.get 0
    i32.const 0
    i32.const 8
    call $__syscall_SYS_rt_sigprocmask
    drop
    call $a_crash.3
    unreachable)
  (func $a_crash.3 (type 14)
    unreachable)
  (func $vfprintf (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 208
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 2
    i32.store offset=204
    local.get 3
    i64.const 0
    i64.store offset=192
    local.get 3
    i64.const 0
    i64.store offset=184
    local.get 3
    i64.const 0
    i64.store offset=176
    local.get 3
    i64.const 0
    i64.store offset=168
    local.get 3
    i64.const 0
    i64.store offset=160
    local.get 3
    local.get 2
    i32.store offset=200
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        local.get 1
        local.get 3
        i32.const 200
        i32.add
        local.get 3
        i32.const 80
        i32.add
        local.get 3
        i32.const 160
        i32.add
        call $printf_core
        i32.const 0
        i32.ge_s
        br_if 0 (;@2;)
        i32.const -1
        local.set 2
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load offset=84
          i32.const 0
          i32.ge_s
          br_if 0 (;@3;)
          i32.const 1
          local.set 4
          br 1 (;@2;)
        end
        local.get 0
        call $__lockfile
        i32.eqz
        local.set 4
      end
      local.get 0
      i32.load
      local.set 5
      block  ;; label = @2
        local.get 0
        i32.load offset=80
        i32.const 0
        i32.gt_s
        br_if 0 (;@2;)
        local.get 0
        local.get 5
        i32.const -33
        i32.and
        i32.store
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              br_if 0 (;@5;)
              local.get 0
              i32.const 80
              i32.store offset=48
              local.get 0
              i32.const 0
              i32.store offset=28
              local.get 0
              i64.const 0
              i64.store offset=16
              local.get 0
              i32.load offset=44
              local.set 6
              local.get 0
              local.get 3
              i32.store offset=44
              br 1 (;@4;)
            end
            i32.const 0
            local.set 6
            local.get 0
            i32.load offset=16
            br_if 1 (;@3;)
          end
          i32.const -1
          local.set 2
          local.get 0
          call $__towrite
          br_if 1 (;@2;)
        end
        local.get 0
        local.get 1
        local.get 3
        i32.const 200
        i32.add
        local.get 3
        i32.const 80
        i32.add
        local.get 3
        i32.const 160
        i32.add
        call $printf_core
        local.set 2
      end
      local.get 5
      i32.const 32
      i32.and
      local.set 1
      block  ;; label = @2
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=36
        call_indirect (type 0)
        drop
        local.get 0
        i32.const 0
        i32.store offset=48
        local.get 0
        local.get 6
        i32.store offset=44
        local.get 0
        i32.const 0
        i32.store offset=28
        local.get 0
        i32.load offset=20
        local.set 6
        local.get 0
        i64.const 0
        i64.store offset=16
        local.get 2
        i32.const -1
        local.get 6
        select
        local.set 2
      end
      local.get 0
      local.get 0
      i32.load
      local.tee 6
      local.get 1
      i32.or
      i32.store
      i32.const -1
      local.get 2
      local.get 6
      i32.const 32
      i32.and
      select
      local.set 2
      local.get 4
      br_if 0 (;@1;)
      local.get 0
      call $__unlockfile
    end
    local.get 3
    i32.const 208
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $printf_core (type 19) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 f64 i32 i32 i32 i32 i32 i64 i32 i32 f64)
    global.get $__stack_pointer
    i32.const 880
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    i32.const 68
    i32.add
    i32.const 12
    i32.add
    local.set 6
    local.get 5
    i32.const 112
    i32.add
    i32.const -4
    i32.add
    local.set 7
    local.get 5
    i32.const 57
    i32.add
    local.set 8
    local.get 5
    i32.const 55
    i32.add
    local.set 9
    local.get 5
    i32.const 68
    i32.add
    i32.const 11
    i32.add
    local.set 10
    local.get 5
    i32.const 80
    i32.add
    i32.const 8
    i32.or
    local.set 11
    local.get 5
    i32.const 80
    i32.add
    i32.const 9
    i32.or
    local.set 12
    local.get 5
    i32.const 56
    i32.add
    local.set 13
    i32.const 0
    local.set 14
    i32.const 0
    local.set 15
    i32.const 0
    local.set 16
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          loop  ;; label = @4
            local.get 1
            local.set 17
            local.get 16
            local.get 15
            i32.const 2147483647
            i32.xor
            i32.gt_s
            br_if 1 (;@3;)
            local.get 16
            local.get 15
            i32.add
            local.set 15
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 17
                                i32.load8_u
                                local.tee 16
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 17
                                local.set 1
                                loop  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        local.get 16
                                        i32.const 255
                                        i32.and
                                        local.tee 16
                                        i32.eqz
                                        br_if 0 (;@18;)
                                        local.get 16
                                        i32.const 37
                                        i32.ne
                                        br_if 2 (;@16;)
                                        local.get 1
                                        local.set 16
                                        loop  ;; label = @19
                                          local.get 1
                                          i32.const 1
                                          i32.add
                                          i32.load8_u
                                          i32.const 37
                                          i32.ne
                                          br_if 2 (;@17;)
                                          local.get 16
                                          i32.const 1
                                          i32.add
                                          local.set 16
                                          local.get 1
                                          i32.const 2
                                          i32.add
                                          local.tee 1
                                          i32.load8_u
                                          i32.const 37
                                          i32.eq
                                          br_if 0 (;@19;)
                                          br 2 (;@17;)
                                        end
                                      end
                                      local.get 1
                                      local.set 16
                                    end
                                    local.get 16
                                    local.get 17
                                    i32.sub
                                    local.tee 16
                                    local.get 15
                                    i32.const 2147483647
                                    i32.xor
                                    local.tee 18
                                    i32.gt_s
                                    br_if 13 (;@3;)
                                    block  ;; label = @17
                                      local.get 0
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.load8_u
                                      i32.const 32
                                      i32.and
                                      br_if 0 (;@17;)
                                      local.get 17
                                      local.get 16
                                      local.get 0
                                      call $__fwritex
                                      drop
                                    end
                                    local.get 16
                                    br_if 12 (;@4;)
                                    local.get 1
                                    i32.const 1
                                    i32.add
                                    local.set 16
                                    i32.const -1
                                    local.set 19
                                    block  ;; label = @17
                                      local.get 1
                                      i32.load8_s offset=1
                                      local.tee 20
                                      i32.const -48
                                      i32.add
                                      local.tee 21
                                      i32.const 9
                                      i32.gt_u
                                      br_if 0 (;@17;)
                                      local.get 1
                                      i32.load8_u offset=2
                                      i32.const 36
                                      i32.ne
                                      br_if 0 (;@17;)
                                      local.get 1
                                      i32.const 3
                                      i32.add
                                      local.set 16
                                      local.get 1
                                      i32.load8_s offset=3
                                      local.set 20
                                      i32.const 1
                                      local.set 14
                                      local.get 21
                                      local.set 19
                                    end
                                    i32.const 0
                                    local.set 22
                                    block  ;; label = @17
                                      local.get 20
                                      i32.const -32
                                      i32.add
                                      local.tee 1
                                      i32.const 31
                                      i32.gt_u
                                      br_if 0 (;@17;)
                                      i32.const 1
                                      local.get 1
                                      i32.shl
                                      local.tee 1
                                      i32.const 75913
                                      i32.and
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      local.get 16
                                      i32.const 1
                                      i32.add
                                      local.set 21
                                      i32.const 0
                                      local.set 22
                                      loop  ;; label = @18
                                        local.get 1
                                        local.get 22
                                        i32.or
                                        local.set 22
                                        local.get 21
                                        local.tee 16
                                        i32.load8_s
                                        local.tee 20
                                        i32.const -32
                                        i32.add
                                        local.tee 1
                                        i32.const 32
                                        i32.ge_u
                                        br_if 1 (;@17;)
                                        local.get 16
                                        i32.const 1
                                        i32.add
                                        local.set 21
                                        i32.const 1
                                        local.get 1
                                        i32.shl
                                        local.tee 1
                                        i32.const 75913
                                        i32.and
                                        br_if 0 (;@18;)
                                      end
                                    end
                                    block  ;; label = @17
                                      local.get 20
                                      i32.const 42
                                      i32.ne
                                      br_if 0 (;@17;)
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          local.get 16
                                          i32.load8_s offset=1
                                          i32.const -48
                                          i32.add
                                          local.tee 1
                                          i32.const 9
                                          i32.gt_u
                                          br_if 0 (;@19;)
                                          local.get 16
                                          i32.load8_u offset=2
                                          i32.const 36
                                          i32.ne
                                          br_if 0 (;@19;)
                                          local.get 4
                                          local.get 1
                                          i32.const 2
                                          i32.shl
                                          i32.add
                                          i32.const 10
                                          i32.store
                                          local.get 16
                                          i32.const 3
                                          i32.add
                                          local.set 1
                                          local.get 3
                                          local.get 16
                                          i32.load8_s offset=1
                                          i32.const 3
                                          i32.shl
                                          i32.add
                                          i32.const -384
                                          i32.add
                                          i32.load
                                          local.set 23
                                          i32.const 1
                                          local.set 14
                                          br 1 (;@18;)
                                        end
                                        local.get 14
                                        br_if 6 (;@12;)
                                        local.get 16
                                        i32.const 1
                                        i32.add
                                        local.set 1
                                        block  ;; label = @19
                                          local.get 0
                                          br_if 0 (;@19;)
                                          i32.const 0
                                          local.set 14
                                          i32.const 0
                                          local.set 23
                                          br 6 (;@13;)
                                        end
                                        local.get 2
                                        local.get 2
                                        i32.load
                                        local.tee 16
                                        i32.const 4
                                        i32.add
                                        i32.store
                                        local.get 16
                                        i32.load
                                        local.set 23
                                        i32.const 0
                                        local.set 14
                                      end
                                      local.get 23
                                      i32.const -1
                                      i32.gt_s
                                      br_if 4 (;@13;)
                                      i32.const 0
                                      local.get 23
                                      i32.sub
                                      local.set 23
                                      local.get 22
                                      i32.const 8192
                                      i32.or
                                      local.set 22
                                      br 4 (;@13;)
                                    end
                                    i32.const 0
                                    local.set 23
                                    block  ;; label = @17
                                      local.get 20
                                      i32.const -48
                                      i32.add
                                      local.tee 21
                                      i32.const 9
                                      i32.le_u
                                      br_if 0 (;@17;)
                                      local.get 16
                                      local.set 1
                                      br 4 (;@13;)
                                    end
                                    loop  ;; label = @17
                                      block  ;; label = @18
                                        local.get 23
                                        i32.const 214748364
                                        i32.gt_u
                                        br_if 0 (;@18;)
                                        i32.const -1
                                        local.get 23
                                        i32.const 10
                                        i32.mul
                                        local.tee 1
                                        local.get 21
                                        i32.add
                                        local.get 21
                                        local.get 1
                                        i32.const 2147483647
                                        i32.xor
                                        i32.gt_u
                                        local.tee 20
                                        select
                                        local.set 23
                                        local.get 16
                                        i32.load8_s offset=1
                                        local.set 21
                                        local.get 16
                                        i32.const 1
                                        i32.add
                                        local.tee 1
                                        local.set 16
                                        local.get 21
                                        i32.const -48
                                        i32.add
                                        local.tee 21
                                        i32.const 10
                                        i32.lt_u
                                        br_if 1 (;@17;)
                                        local.get 20
                                        br_if 15 (;@3;)
                                        br 5 (;@13;)
                                      end
                                      local.get 16
                                      i32.load8_s offset=1
                                      local.set 1
                                      i32.const -1
                                      local.set 23
                                      local.get 16
                                      i32.const 1
                                      i32.add
                                      local.set 16
                                      local.get 1
                                      i32.const -48
                                      i32.add
                                      local.tee 21
                                      i32.const 10
                                      i32.lt_u
                                      br_if 0 (;@17;)
                                      br 14 (;@3;)
                                    end
                                  end
                                  local.get 1
                                  i32.const 1
                                  i32.add
                                  local.tee 1
                                  i32.load8_u
                                  local.set 16
                                  br 0 (;@15;)
                                end
                              end
                              local.get 0
                              br_if 12 (;@1;)
                              block  ;; label = @14
                                local.get 14
                                br_if 0 (;@14;)
                                i32.const 0
                                local.set 15
                                br 13 (;@1;)
                              end
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load offset=4
                                    local.tee 1
                                    br_if 0 (;@16;)
                                    i32.const 1
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i32.const 8
                                  i32.add
                                  local.get 1
                                  local.get 2
                                  call $pop_arg
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load offset=8
                                    local.tee 1
                                    br_if 0 (;@16;)
                                    i32.const 2
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i32.const 16
                                  i32.add
                                  local.get 1
                                  local.get 2
                                  call $pop_arg
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load offset=12
                                    local.tee 1
                                    br_if 0 (;@16;)
                                    i32.const 3
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i32.const 24
                                  i32.add
                                  local.get 1
                                  local.get 2
                                  call $pop_arg
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load offset=16
                                    local.tee 1
                                    br_if 0 (;@16;)
                                    i32.const 4
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i32.const 32
                                  i32.add
                                  local.get 1
                                  local.get 2
                                  call $pop_arg
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load offset=20
                                    local.tee 1
                                    br_if 0 (;@16;)
                                    i32.const 5
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i32.const 40
                                  i32.add
                                  local.get 1
                                  local.get 2
                                  call $pop_arg
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load offset=24
                                    local.tee 1
                                    br_if 0 (;@16;)
                                    i32.const 6
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i32.const 48
                                  i32.add
                                  local.get 1
                                  local.get 2
                                  call $pop_arg
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load offset=28
                                    local.tee 1
                                    br_if 0 (;@16;)
                                    i32.const 7
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i32.const 56
                                  i32.add
                                  local.get 1
                                  local.get 2
                                  call $pop_arg
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load offset=32
                                    local.tee 1
                                    br_if 0 (;@16;)
                                    i32.const 8
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i32.const 64
                                  i32.add
                                  local.get 1
                                  local.get 2
                                  call $pop_arg
                                  local.get 4
                                  i32.load offset=36
                                  local.tee 1
                                  br_if 1 (;@14;)
                                  i32.const 9
                                  local.set 1
                                end
                                local.get 1
                                i32.const 2
                                i32.shl
                                local.set 1
                                loop  ;; label = @15
                                  local.get 4
                                  local.get 1
                                  i32.add
                                  i32.load
                                  br_if 3 (;@12;)
                                  local.get 1
                                  i32.const 4
                                  i32.add
                                  local.tee 1
                                  i32.const 40
                                  i32.ne
                                  br_if 0 (;@15;)
                                end
                                i32.const 1
                                local.set 15
                                br 13 (;@1;)
                              end
                              local.get 3
                              i32.const 72
                              i32.add
                              local.get 1
                              local.get 2
                              call $pop_arg
                              i32.const 1
                              local.set 15
                              br 12 (;@1;)
                            end
                            i32.const 0
                            local.set 16
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 1
                                i32.load8_u
                                i32.const 46
                                i32.eq
                                br_if 0 (;@14;)
                                i32.const -1
                                local.set 20
                                i32.const 0
                                local.set 24
                                br 1 (;@13;)
                              end
                              block  ;; label = @14
                                local.get 1
                                i32.load8_s offset=1
                                local.tee 21
                                i32.const 42
                                i32.ne
                                br_if 0 (;@14;)
                                block  ;; label = @15
                                  local.get 1
                                  i32.load8_s offset=2
                                  i32.const -48
                                  i32.add
                                  local.tee 21
                                  i32.const 9
                                  i32.gt_u
                                  br_if 0 (;@15;)
                                  local.get 1
                                  i32.load8_u offset=3
                                  i32.const 36
                                  i32.ne
                                  br_if 0 (;@15;)
                                  local.get 4
                                  local.get 21
                                  i32.const 2
                                  i32.shl
                                  i32.add
                                  i32.const 10
                                  i32.store
                                  local.get 1
                                  i32.load8_s offset=2
                                  local.set 21
                                  local.get 1
                                  i32.const 4
                                  i32.add
                                  local.set 1
                                  local.get 3
                                  local.get 21
                                  i32.const 3
                                  i32.shl
                                  i32.add
                                  i32.const -384
                                  i32.add
                                  i32.load
                                  local.tee 20
                                  i32.const -1
                                  i32.gt_s
                                  local.set 24
                                  br 2 (;@13;)
                                end
                                local.get 14
                                br_if 2 (;@12;)
                                local.get 1
                                i32.const 2
                                i32.add
                                local.set 1
                                block  ;; label = @15
                                  local.get 0
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.set 20
                                  i32.const 0
                                  i32.const -1
                                  i32.gt_s
                                  local.set 24
                                  br 2 (;@13;)
                                end
                                local.get 2
                                local.get 2
                                i32.load
                                local.tee 21
                                i32.const 4
                                i32.add
                                i32.store
                                local.get 21
                                i32.load
                                local.tee 20
                                i32.const -1
                                i32.gt_s
                                local.set 24
                                br 1 (;@13;)
                              end
                              local.get 1
                              i32.const 1
                              i32.add
                              local.set 1
                              block  ;; label = @14
                                local.get 21
                                i32.const -48
                                i32.add
                                local.tee 25
                                i32.const 9
                                i32.le_u
                                br_if 0 (;@14;)
                                i32.const 1
                                local.set 24
                                i32.const 0
                                local.set 20
                                br 1 (;@13;)
                              end
                              i32.const 0
                              local.set 21
                              loop  ;; label = @14
                                i32.const -1
                                local.set 20
                                block  ;; label = @15
                                  local.get 21
                                  i32.const 214748364
                                  i32.gt_u
                                  br_if 0 (;@15;)
                                  i32.const -1
                                  local.get 21
                                  i32.const 10
                                  i32.mul
                                  local.tee 21
                                  local.get 25
                                  i32.add
                                  local.get 25
                                  local.get 21
                                  i32.const 2147483647
                                  i32.xor
                                  i32.gt_u
                                  select
                                  local.set 20
                                end
                                i32.const 1
                                local.set 24
                                local.get 20
                                local.set 21
                                local.get 1
                                i32.const 1
                                i32.add
                                local.tee 1
                                i32.load8_s
                                i32.const -48
                                i32.add
                                local.tee 25
                                i32.const 10
                                i32.lt_u
                                br_if 0 (;@14;)
                              end
                            end
                            loop  ;; label = @13
                              local.get 16
                              local.set 21
                              local.get 1
                              i32.load8_s
                              local.tee 16
                              i32.const -123
                              i32.add
                              i32.const -58
                              i32.lt_u
                              br_if 1 (;@12;)
                              local.get 1
                              i32.const 1
                              i32.add
                              local.set 1
                              local.get 21
                              i32.const 58
                              i32.mul
                              local.get 16
                              i32.add
                              i32.const 3839
                              i32.add
                              i32.load8_u
                              local.tee 16
                              i32.const -1
                              i32.add
                              i32.const 255
                              i32.and
                              i32.const 8
                              i32.lt_u
                              br_if 0 (;@13;)
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 16
                                  i32.const 27
                                  i32.eq
                                  br_if 0 (;@15;)
                                  local.get 16
                                  i32.eqz
                                  br_if 3 (;@12;)
                                  block  ;; label = @16
                                    local.get 19
                                    i32.const 0
                                    i32.lt_s
                                    br_if 0 (;@16;)
                                    local.get 4
                                    local.get 19
                                    i32.const 2
                                    i32.shl
                                    i32.add
                                    local.get 16
                                    i32.store
                                    local.get 5
                                    local.get 3
                                    local.get 19
                                    i32.const 3
                                    i32.shl
                                    i32.add
                                    i64.load
                                    i64.store offset=56
                                    br 2 (;@14;)
                                  end
                                  block  ;; label = @16
                                    local.get 0
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.set 15
                                    br 15 (;@1;)
                                  end
                                  local.get 5
                                  i32.const 56
                                  i32.add
                                  local.get 16
                                  local.get 2
                                  call $pop_arg
                                  br 2 (;@13;)
                                end
                                local.get 19
                                i32.const -1
                                i32.gt_s
                                br_if 2 (;@12;)
                              end
                              i32.const 0
                              local.set 16
                              local.get 0
                              i32.eqz
                              br_if 9 (;@4;)
                            end
                            local.get 22
                            i32.const -65537
                            i32.and
                            local.tee 25
                            local.get 22
                            local.get 22
                            i32.const 8192
                            i32.and
                            select
                            local.set 26
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              local.get 1
                                                              i32.const -1
                                                              i32.add
                                                              i32.load8_u
                                                              local.tee 22
                                                              i32.extend8_s
                                                              local.tee 16
                                                              i32.const -45
                                                              i32.and
                                                              local.get 16
                                                              local.get 22
                                                              i32.const 15
                                                              i32.and
                                                              i32.const 3
                                                              i32.eq
                                                              select
                                                              local.get 16
                                                              local.get 21
                                                              select
                                                              local.tee 27
                                                              i32.const -65
                                                              i32.add
                                                              br_table 16 (;@13;) 18 (;@11;) 13 (;@16;) 18 (;@11;) 16 (;@13;) 16 (;@13;) 16 (;@13;) 18 (;@11;) 18 (;@11;) 18 (;@11;) 18 (;@11;) 18 (;@11;) 18 (;@11;) 18 (;@11;) 18 (;@11;) 18 (;@11;) 18 (;@11;) 18 (;@11;) 12 (;@17;) 18 (;@11;) 18 (;@11;) 18 (;@11;) 18 (;@11;) 3 (;@26;) 18 (;@11;) 18 (;@11;) 18 (;@11;) 18 (;@11;) 18 (;@11;) 18 (;@11;) 18 (;@11;) 18 (;@11;) 16 (;@13;) 18 (;@11;) 8 (;@21;) 5 (;@24;) 16 (;@13;) 16 (;@13;) 16 (;@13;) 18 (;@11;) 5 (;@24;) 18 (;@11;) 18 (;@11;) 18 (;@11;) 9 (;@20;) 1 (;@28;) 4 (;@25;) 2 (;@27;) 18 (;@11;) 18 (;@11;) 10 (;@19;) 18 (;@11;) 0 (;@29;) 18 (;@11;) 18 (;@11;) 3 (;@26;) 18 (;@11;)
                                                            end
                                                            i32.const 0
                                                            local.set 19
                                                            i32.const 1152
                                                            local.set 28
                                                            local.get 5
                                                            i64.load offset=56
                                                            local.set 29
                                                            br 5 (;@23;)
                                                          end
                                                          i32.const 0
                                                          local.set 16
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      block  ;; label = @34
                                                                        local.get 21
                                                                        br_table 0 (;@34;) 1 (;@33;) 2 (;@32;) 3 (;@31;) 4 (;@30;) 30 (;@4;) 5 (;@29;) 6 (;@28;) 30 (;@4;)
                                                                      end
                                                                      local.get 5
                                                                      i32.load offset=56
                                                                      local.get 15
                                                                      i32.store
                                                                      br 29 (;@4;)
                                                                    end
                                                                    local.get 5
                                                                    i32.load offset=56
                                                                    local.get 15
                                                                    i64.extend_i32_s
                                                                    i64.store
                                                                    br 28 (;@4;)
                                                                  end
                                                                  local.get 5
                                                                  i32.load offset=56
                                                                  local.get 15
                                                                  i64.extend_i32_s
                                                                  i64.store
                                                                  br 27 (;@4;)
                                                                end
                                                                local.get 5
                                                                i32.load offset=56
                                                                local.get 15
                                                                i32.store16
                                                                br 26 (;@4;)
                                                              end
                                                              local.get 5
                                                              i32.load offset=56
                                                              local.get 15
                                                              i32.store8
                                                              br 25 (;@4;)
                                                            end
                                                            local.get 5
                                                            i32.load offset=56
                                                            local.get 15
                                                            i32.store
                                                            br 24 (;@4;)
                                                          end
                                                          local.get 5
                                                          i32.load offset=56
                                                          local.get 15
                                                          i64.extend_i32_s
                                                          i64.store
                                                          br 23 (;@4;)
                                                        end
                                                        local.get 20
                                                        i32.const 8
                                                        local.get 20
                                                        i32.const 8
                                                        i32.gt_u
                                                        select
                                                        local.set 20
                                                        local.get 26
                                                        i32.const 8
                                                        i32.or
                                                        local.set 26
                                                        i32.const 120
                                                        local.set 27
                                                      end
                                                      i32.const 0
                                                      local.set 19
                                                      i32.const 1152
                                                      local.set 28
                                                      local.get 5
                                                      i64.load offset=56
                                                      local.tee 29
                                                      i64.eqz
                                                      br_if 18 (;@7;)
                                                      local.get 27
                                                      i32.const 32
                                                      i32.and
                                                      local.set 21
                                                      local.get 13
                                                      local.set 17
                                                      loop  ;; label = @26
                                                        local.get 17
                                                        i32.const -1
                                                        i32.add
                                                        local.tee 17
                                                        local.get 29
                                                        i32.wrap_i64
                                                        i32.const 15
                                                        i32.and
                                                        i32.load8_u offset=4368
                                                        local.get 21
                                                        i32.or
                                                        i32.store8
                                                        local.get 29
                                                        i64.const 15
                                                        i64.gt_u
                                                        local.set 16
                                                        local.get 29
                                                        i64.const 4
                                                        i64.shr_u
                                                        local.set 29
                                                        local.get 16
                                                        br_if 0 (;@26;)
                                                      end
                                                      i64.const 1
                                                      local.set 30
                                                      local.get 26
                                                      i32.const 8
                                                      i32.and
                                                      i32.eqz
                                                      br_if 19 (;@6;)
                                                      local.get 27
                                                      i32.const 4
                                                      i32.shr_u
                                                      i32.const 1152
                                                      i32.add
                                                      local.set 28
                                                      i32.const 2
                                                      local.set 19
                                                      br 19 (;@6;)
                                                    end
                                                    local.get 13
                                                    local.set 17
                                                    block  ;; label = @25
                                                      local.get 5
                                                      i64.load offset=56
                                                      local.tee 30
                                                      i64.eqz
                                                      br_if 0 (;@25;)
                                                      local.get 13
                                                      local.set 17
                                                      local.get 30
                                                      local.set 29
                                                      loop  ;; label = @26
                                                        local.get 17
                                                        i32.const -1
                                                        i32.add
                                                        local.tee 17
                                                        local.get 29
                                                        i32.wrap_i64
                                                        i32.const 7
                                                        i32.and
                                                        i32.const 48
                                                        i32.or
                                                        i32.store8
                                                        local.get 29
                                                        i64.const 7
                                                        i64.gt_u
                                                        local.set 16
                                                        local.get 29
                                                        i64.const 3
                                                        i64.shr_u
                                                        local.set 29
                                                        local.get 16
                                                        br_if 0 (;@26;)
                                                      end
                                                    end
                                                    i32.const 0
                                                    local.set 19
                                                    i32.const 1152
                                                    local.set 28
                                                    local.get 26
                                                    i32.const 8
                                                    i32.and
                                                    i32.eqz
                                                    br_if 18 (;@6;)
                                                    local.get 20
                                                    local.get 8
                                                    local.get 17
                                                    i32.sub
                                                    local.tee 16
                                                    local.get 20
                                                    local.get 16
                                                    i32.gt_s
                                                    select
                                                    local.set 20
                                                    br 18 (;@6;)
                                                  end
                                                  block  ;; label = @24
                                                    local.get 5
                                                    i64.load offset=56
                                                    local.tee 29
                                                    i64.const -1
                                                    i64.gt_s
                                                    br_if 0 (;@24;)
                                                    local.get 5
                                                    i64.const 0
                                                    local.get 29
                                                    i64.sub
                                                    local.tee 29
                                                    i64.store offset=56
                                                    i32.const 1152
                                                    local.set 28
                                                    i32.const 1
                                                    local.set 19
                                                    br 2 (;@22;)
                                                  end
                                                  block  ;; label = @24
                                                    local.get 26
                                                    i32.const 2048
                                                    i32.and
                                                    i32.eqz
                                                    br_if 0 (;@24;)
                                                    i32.const 1
                                                    local.set 19
                                                    i32.const 1153
                                                    local.set 28
                                                    br 1 (;@23;)
                                                  end
                                                  i32.const 1154
                                                  i32.const 1152
                                                  local.get 26
                                                  i32.const 1
                                                  i32.and
                                                  local.tee 19
                                                  select
                                                  local.set 28
                                                end
                                                local.get 29
                                                i64.eqz
                                                br_if 15 (;@7;)
                                              end
                                              local.get 13
                                              local.set 17
                                              loop  ;; label = @22
                                                local.get 17
                                                i32.const -1
                                                i32.add
                                                local.tee 17
                                                local.get 29
                                                local.get 29
                                                i64.const 10
                                                i64.div_u
                                                local.tee 30
                                                i64.const 10
                                                i64.mul
                                                i64.sub
                                                i32.wrap_i64
                                                i32.const 48
                                                i32.or
                                                i32.store8
                                                local.get 29
                                                i64.const 9
                                                i64.gt_u
                                                local.set 16
                                                local.get 30
                                                local.set 29
                                                local.get 16
                                                br_if 0 (;@22;)
                                              end
                                              i64.const 1
                                              local.set 30
                                              br 15 (;@6;)
                                            end
                                            local.get 5
                                            local.get 5
                                            i64.load offset=56
                                            i64.store8 offset=55
                                            i32.const 0
                                            local.set 19
                                            i32.const 1152
                                            local.set 28
                                            i32.const 1
                                            local.set 22
                                            local.get 9
                                            local.set 17
                                            local.get 13
                                            local.set 16
                                            br 15 (;@5;)
                                          end
                                          call $__errno_location
                                          i32.load
                                          call $strerror
                                          local.set 17
                                          br 1 (;@18;)
                                        end
                                        local.get 5
                                        i32.load offset=56
                                        local.tee 16
                                        i32.const 1199
                                        local.get 16
                                        select
                                        local.set 17
                                      end
                                      local.get 17
                                      local.get 17
                                      local.get 20
                                      i32.const 2147483647
                                      local.get 20
                                      i32.const 2147483647
                                      i32.lt_u
                                      select
                                      call $strnlen
                                      local.tee 22
                                      i32.add
                                      local.set 16
                                      i32.const 0
                                      local.set 19
                                      i32.const 1152
                                      local.set 28
                                      local.get 20
                                      i32.const -1
                                      i32.gt_s
                                      br_if 12 (;@5;)
                                      local.get 16
                                      i32.load8_u
                                      i32.eqz
                                      br_if 12 (;@5;)
                                      br 14 (;@3;)
                                    end
                                    local.get 5
                                    i32.load offset=56
                                    local.set 21
                                    local.get 20
                                    br_if 1 (;@15;)
                                    i32.const 0
                                    local.set 16
                                    br 2 (;@14;)
                                  end
                                  local.get 5
                                  i32.const 0
                                  i32.store offset=12
                                  local.get 5
                                  local.get 5
                                  i64.load offset=56
                                  i64.store32 offset=8
                                  local.get 5
                                  local.get 5
                                  i32.const 8
                                  i32.add
                                  i32.store offset=56
                                  local.get 5
                                  i32.const 8
                                  i32.add
                                  local.set 21
                                  i32.const -1
                                  local.set 20
                                end
                                i32.const 0
                                local.set 16
                                local.get 21
                                local.set 17
                                block  ;; label = @15
                                  loop  ;; label = @16
                                    local.get 17
                                    i32.load
                                    local.tee 18
                                    i32.eqz
                                    br_if 1 (;@15;)
                                    local.get 5
                                    i32.const 4
                                    i32.add
                                    local.get 18
                                    call $wctomb
                                    local.tee 18
                                    i32.const 0
                                    i32.lt_s
                                    br_if 14 (;@2;)
                                    local.get 18
                                    local.get 20
                                    local.get 16
                                    i32.sub
                                    i32.gt_u
                                    br_if 1 (;@15;)
                                    local.get 17
                                    i32.const 4
                                    i32.add
                                    local.set 17
                                    local.get 18
                                    local.get 16
                                    i32.add
                                    local.tee 16
                                    local.get 20
                                    i32.lt_u
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 16
                                i32.const 0
                                i32.lt_s
                                br_if 11 (;@3;)
                              end
                              block  ;; label = @14
                                local.get 26
                                i32.const 73728
                                i32.and
                                local.tee 22
                                br_if 0 (;@14;)
                                local.get 23
                                local.get 16
                                i32.le_u
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 112
                                i32.add
                                i32.const 32
                                local.get 23
                                local.get 16
                                i32.sub
                                local.tee 17
                                i32.const 256
                                local.get 17
                                i32.const 256
                                i32.lt_u
                                local.tee 18
                                select
                                call $memset
                                drop
                                block  ;; label = @15
                                  local.get 18
                                  br_if 0 (;@15;)
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      local.get 0
                                      i32.load8_u
                                      i32.const 32
                                      i32.and
                                      br_if 0 (;@17;)
                                      local.get 5
                                      i32.const 112
                                      i32.add
                                      i32.const 256
                                      local.get 0
                                      call $__fwritex
                                      drop
                                    end
                                    local.get 17
                                    i32.const -256
                                    i32.add
                                    local.tee 17
                                    i32.const 255
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 112
                                i32.add
                                local.get 17
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              block  ;; label = @14
                                local.get 16
                                i32.eqz
                                br_if 0 (;@14;)
                                i32.const 0
                                local.set 17
                                loop  ;; label = @15
                                  local.get 21
                                  i32.load
                                  local.tee 18
                                  i32.eqz
                                  br_if 1 (;@14;)
                                  local.get 5
                                  i32.const 4
                                  i32.add
                                  local.get 18
                                  call $wctomb
                                  local.tee 18
                                  local.get 17
                                  i32.add
                                  local.tee 17
                                  local.get 16
                                  i32.gt_u
                                  br_if 1 (;@14;)
                                  block  ;; label = @16
                                    local.get 0
                                    i32.load8_u
                                    i32.const 32
                                    i32.and
                                    br_if 0 (;@16;)
                                    local.get 5
                                    i32.const 4
                                    i32.add
                                    local.get 18
                                    local.get 0
                                    call $__fwritex
                                    drop
                                  end
                                  local.get 21
                                  i32.const 4
                                  i32.add
                                  local.set 21
                                  local.get 17
                                  local.get 16
                                  i32.lt_u
                                  br_if 0 (;@15;)
                                end
                              end
                              block  ;; label = @14
                                local.get 22
                                i32.const 8192
                                i32.ne
                                br_if 0 (;@14;)
                                local.get 23
                                local.get 16
                                i32.le_u
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 112
                                i32.add
                                i32.const 32
                                local.get 23
                                local.get 16
                                i32.sub
                                local.tee 17
                                i32.const 256
                                local.get 17
                                i32.const 256
                                i32.lt_u
                                local.tee 18
                                select
                                call $memset
                                drop
                                block  ;; label = @15
                                  local.get 18
                                  br_if 0 (;@15;)
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      local.get 0
                                      i32.load8_u
                                      i32.const 32
                                      i32.and
                                      br_if 0 (;@17;)
                                      local.get 5
                                      i32.const 112
                                      i32.add
                                      i32.const 256
                                      local.get 0
                                      call $__fwritex
                                      drop
                                    end
                                    local.get 17
                                    i32.const -256
                                    i32.add
                                    local.tee 17
                                    i32.const 255
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 112
                                i32.add
                                local.get 17
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              local.get 23
                              local.get 16
                              local.get 23
                              local.get 16
                              i32.gt_s
                              select
                              local.set 16
                              br 9 (;@4;)
                            end
                            local.get 24
                            local.get 20
                            i32.const 0
                            i32.lt_s
                            local.tee 16
                            i32.and
                            br_if 9 (;@3;)
                            local.get 5
                            f64.load offset=56
                            local.set 31
                            local.get 5
                            i32.const 0
                            i32.store offset=108
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 31
                                i64.reinterpret_f64
                                i64.const -1
                                i64.gt_s
                                br_if 0 (;@14;)
                                local.get 31
                                f64.neg
                                local.set 31
                                i32.const 1
                                local.set 32
                                i32.const 0
                                local.set 33
                                i32.const 1162
                                local.set 34
                                br 1 (;@13;)
                              end
                              block  ;; label = @14
                                local.get 26
                                i32.const 2048
                                i32.and
                                i32.eqz
                                br_if 0 (;@14;)
                                i32.const 1
                                local.set 32
                                i32.const 0
                                local.set 33
                                i32.const 1165
                                local.set 34
                                br 1 (;@13;)
                              end
                              i32.const 1168
                              i32.const 1163
                              local.get 26
                              i32.const 1
                              i32.and
                              local.tee 32
                              select
                              local.set 34
                              local.get 32
                              i32.eqz
                              local.set 33
                            end
                            block  ;; label = @13
                              local.get 31
                              f64.const inf (;=inf;)
                              f64.lt
                              br_if 0 (;@13;)
                              local.get 32
                              i32.const 3
                              i32.add
                              local.set 17
                              block  ;; label = @14
                                local.get 26
                                i32.const 8192
                                i32.and
                                br_if 0 (;@14;)
                                local.get 23
                                local.get 17
                                i32.le_u
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 624
                                i32.add
                                i32.const 32
                                local.get 23
                                local.get 17
                                i32.sub
                                local.tee 16
                                i32.const 256
                                local.get 16
                                i32.const 256
                                i32.lt_u
                                local.tee 18
                                select
                                call $memset
                                drop
                                block  ;; label = @15
                                  local.get 18
                                  br_if 0 (;@15;)
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      local.get 0
                                      i32.load8_u
                                      i32.const 32
                                      i32.and
                                      br_if 0 (;@17;)
                                      local.get 5
                                      i32.const 624
                                      i32.add
                                      i32.const 256
                                      local.get 0
                                      call $__fwritex
                                      drop
                                    end
                                    local.get 16
                                    i32.const -256
                                    i32.add
                                    local.tee 16
                                    i32.const 255
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 624
                                i32.add
                                local.get 16
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              block  ;; label = @14
                                local.get 0
                                i32.load
                                local.tee 16
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 34
                                local.get 32
                                local.get 0
                                call $__fwritex
                                drop
                                local.get 0
                                i32.load
                                local.set 16
                              end
                              block  ;; label = @14
                                local.get 16
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                i32.const 1181
                                i32.const 1189
                                local.get 27
                                i32.const 32
                                i32.and
                                local.tee 16
                                select
                                i32.const 1185
                                i32.const 1193
                                local.get 16
                                select
                                local.get 31
                                local.get 31
                                f64.ne
                                select
                                i32.const 3
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              block  ;; label = @14
                                local.get 26
                                i32.const 73728
                                i32.and
                                i32.const 8192
                                i32.ne
                                br_if 0 (;@14;)
                                local.get 23
                                local.get 17
                                i32.le_u
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 624
                                i32.add
                                i32.const 32
                                local.get 23
                                local.get 17
                                i32.sub
                                local.tee 16
                                i32.const 256
                                local.get 16
                                i32.const 256
                                i32.lt_u
                                local.tee 18
                                select
                                call $memset
                                drop
                                block  ;; label = @15
                                  local.get 18
                                  br_if 0 (;@15;)
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      local.get 0
                                      i32.load8_u
                                      i32.const 32
                                      i32.and
                                      br_if 0 (;@17;)
                                      local.get 5
                                      i32.const 624
                                      i32.add
                                      i32.const 256
                                      local.get 0
                                      call $__fwritex
                                      drop
                                    end
                                    local.get 16
                                    i32.const -256
                                    i32.add
                                    local.tee 16
                                    i32.const 255
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 624
                                i32.add
                                local.get 16
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              local.get 23
                              local.get 17
                              local.get 23
                              local.get 17
                              i32.gt_u
                              select
                              local.set 16
                              br 9 (;@4;)
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 31
                                  local.get 5
                                  i32.const 108
                                  i32.add
                                  call $frexp
                                  local.tee 31
                                  local.get 31
                                  f64.add
                                  local.tee 31
                                  f64.const 0x0p+0 (;=0;)
                                  f64.eq
                                  br_if 0 (;@15;)
                                  local.get 5
                                  local.get 5
                                  i32.load offset=108
                                  local.tee 17
                                  i32.const -1
                                  i32.add
                                  i32.store offset=108
                                  local.get 27
                                  i32.const 32
                                  i32.or
                                  local.tee 35
                                  i32.const 97
                                  i32.ne
                                  br_if 1 (;@14;)
                                  br 7 (;@8;)
                                end
                                local.get 27
                                i32.const 32
                                i32.or
                                local.tee 35
                                i32.const 97
                                i32.eq
                                br_if 6 (;@8;)
                                i32.const 6
                                local.get 20
                                local.get 16
                                select
                                local.set 19
                                local.get 5
                                i32.load offset=108
                                local.set 21
                                br 1 (;@13;)
                              end
                              local.get 5
                              local.get 17
                              i32.const -29
                              i32.add
                              local.tee 21
                              i32.store offset=108
                              i32.const 6
                              local.get 20
                              local.get 16
                              select
                              local.set 19
                              local.get 31
                              f64.const 0x1p+28 (;=2.68435e+08;)
                              f64.mul
                              local.set 31
                            end
                            local.get 5
                            i32.const 112
                            i32.add
                            i32.const 0
                            i32.const 288
                            local.get 21
                            i32.const 0
                            i32.lt_s
                            local.tee 36
                            select
                            i32.add
                            local.tee 28
                            local.set 17
                            loop  ;; label = @13
                              local.get 17
                              local.get 31
                              i32.trunc_sat_f64_u
                              local.tee 16
                              i32.store
                              local.get 17
                              i32.const 4
                              i32.add
                              local.set 17
                              local.get 31
                              local.get 16
                              f64.convert_i32_u
                              f64.sub
                              f64.const 0x1.dcd65p+29 (;=1e+09;)
                              f64.mul
                              local.tee 31
                              f64.const 0x0p+0 (;=0;)
                              f64.ne
                              br_if 0 (;@13;)
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 21
                                i32.const 1
                                i32.ge_s
                                br_if 0 (;@14;)
                                local.get 17
                                local.set 16
                                local.get 28
                                local.set 18
                                br 1 (;@13;)
                              end
                              local.get 28
                              local.set 18
                              loop  ;; label = @14
                                local.get 21
                                i32.const 29
                                local.get 21
                                i32.const 29
                                i32.lt_u
                                select
                                local.set 21
                                block  ;; label = @15
                                  local.get 17
                                  i32.const -4
                                  i32.add
                                  local.tee 16
                                  local.get 18
                                  i32.lt_u
                                  br_if 0 (;@15;)
                                  local.get 21
                                  i64.extend_i32_u
                                  local.set 37
                                  i64.const 0
                                  local.set 29
                                  loop  ;; label = @16
                                    local.get 16
                                    local.get 16
                                    i64.load32_u
                                    local.get 37
                                    i64.shl
                                    local.get 29
                                    i64.add
                                    local.tee 30
                                    local.get 30
                                    i64.const 1000000000
                                    i64.div_u
                                    local.tee 29
                                    i64.const 1000000000
                                    i64.mul
                                    i64.sub
                                    i64.store32
                                    local.get 16
                                    i32.const -4
                                    i32.add
                                    local.tee 16
                                    local.get 18
                                    i32.ge_u
                                    br_if 0 (;@16;)
                                  end
                                  local.get 30
                                  i64.const 1000000000
                                  i64.lt_u
                                  br_if 0 (;@15;)
                                  local.get 18
                                  i32.const -4
                                  i32.add
                                  local.tee 18
                                  local.get 29
                                  i64.store32
                                end
                                block  ;; label = @15
                                  loop  ;; label = @16
                                    local.get 17
                                    local.tee 16
                                    local.get 18
                                    i32.le_u
                                    br_if 1 (;@15;)
                                    local.get 16
                                    i32.const -4
                                    i32.add
                                    local.tee 17
                                    i32.load
                                    i32.eqz
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 5
                                local.get 5
                                i32.load offset=108
                                local.get 21
                                i32.sub
                                local.tee 21
                                i32.store offset=108
                                local.get 16
                                local.set 17
                                local.get 21
                                i32.const 0
                                i32.gt_s
                                br_if 0 (;@14;)
                              end
                            end
                            block  ;; label = @13
                              local.get 21
                              i32.const -1
                              i32.gt_s
                              br_if 0 (;@13;)
                              local.get 19
                              i32.const 25
                              i32.add
                              i32.const 9
                              i32.div_u
                              i32.const 1
                              i32.add
                              local.set 38
                              local.get 35
                              i32.const 102
                              i32.eq
                              local.set 39
                              loop  ;; label = @14
                                i32.const 0
                                local.get 21
                                i32.sub
                                local.tee 17
                                i32.const 9
                                local.get 17
                                i32.const 9
                                i32.lt_u
                                select
                                local.set 20
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 18
                                    local.get 16
                                    i32.lt_u
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    i32.const 4
                                    local.get 18
                                    i32.load
                                    select
                                    local.set 17
                                    br 1 (;@15;)
                                  end
                                  i32.const 1000000000
                                  local.get 20
                                  i32.shr_u
                                  local.set 25
                                  i32.const -1
                                  local.get 20
                                  i32.shl
                                  i32.const -1
                                  i32.xor
                                  local.set 24
                                  i32.const 0
                                  local.set 21
                                  local.get 18
                                  local.set 17
                                  loop  ;; label = @16
                                    local.get 17
                                    local.get 17
                                    i32.load
                                    local.tee 22
                                    local.get 20
                                    i32.shr_u
                                    local.get 21
                                    i32.add
                                    i32.store
                                    local.get 22
                                    local.get 24
                                    i32.and
                                    local.get 25
                                    i32.mul
                                    local.set 21
                                    local.get 17
                                    i32.const 4
                                    i32.add
                                    local.tee 17
                                    local.get 16
                                    i32.lt_u
                                    br_if 0 (;@16;)
                                  end
                                  i32.const 0
                                  i32.const 4
                                  local.get 18
                                  i32.load
                                  select
                                  local.set 17
                                  local.get 21
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  local.get 16
                                  local.get 21
                                  i32.store
                                  local.get 16
                                  i32.const 4
                                  i32.add
                                  local.set 16
                                end
                                local.get 5
                                local.get 5
                                i32.load offset=108
                                local.get 20
                                i32.add
                                local.tee 21
                                i32.store offset=108
                                local.get 28
                                local.get 18
                                local.get 17
                                i32.add
                                local.tee 18
                                local.get 39
                                select
                                local.tee 17
                                local.get 38
                                i32.const 2
                                i32.shl
                                i32.add
                                local.get 16
                                local.get 16
                                local.get 17
                                i32.sub
                                i32.const 2
                                i32.shr_s
                                local.get 38
                                i32.gt_s
                                select
                                local.set 16
                                local.get 21
                                i32.const 0
                                i32.lt_s
                                br_if 0 (;@14;)
                              end
                            end
                            i32.const 0
                            local.set 20
                            block  ;; label = @13
                              local.get 18
                              local.get 16
                              i32.ge_u
                              br_if 0 (;@13;)
                              local.get 28
                              local.get 18
                              i32.sub
                              i32.const 2
                              i32.shr_s
                              i32.const 9
                              i32.mul
                              local.set 20
                              local.get 18
                              i32.load
                              local.tee 21
                              i32.const 10
                              i32.lt_u
                              br_if 0 (;@13;)
                              i32.const 10
                              local.set 17
                              loop  ;; label = @14
                                local.get 20
                                i32.const 1
                                i32.add
                                local.set 20
                                local.get 21
                                local.get 17
                                i32.const 10
                                i32.mul
                                local.tee 17
                                i32.ge_u
                                br_if 0 (;@14;)
                              end
                            end
                            block  ;; label = @13
                              local.get 19
                              i32.const 0
                              local.get 20
                              local.get 35
                              i32.const 102
                              i32.eq
                              select
                              i32.sub
                              local.get 19
                              i32.const 0
                              i32.ne
                              local.get 35
                              i32.const 103
                              i32.eq
                              local.tee 24
                              i32.and
                              i32.sub
                              local.tee 17
                              local.get 16
                              local.get 28
                              i32.sub
                              i32.const 2
                              i32.shr_s
                              i32.const 9
                              i32.mul
                              i32.const -9
                              i32.add
                              i32.ge_s
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 112
                              i32.add
                              i32.const -4092
                              i32.const -3804
                              local.get 36
                              select
                              local.tee 35
                              i32.add
                              local.get 17
                              i32.const 9216
                              i32.add
                              local.tee 21
                              i32.const 9
                              i32.div_s
                              local.tee 22
                              i32.const 2
                              i32.shl
                              local.tee 36
                              i32.add
                              local.set 25
                              i32.const 10
                              local.set 17
                              block  ;; label = @14
                                local.get 21
                                local.get 22
                                i32.const 9
                                i32.mul
                                i32.sub
                                local.tee 22
                                i32.const 7
                                i32.gt_s
                                br_if 0 (;@14;)
                                i32.const 8
                                local.get 22
                                i32.sub
                                local.tee 38
                                i32.const 7
                                i32.and
                                local.set 21
                                i32.const 10
                                local.set 17
                                block  ;; label = @15
                                  local.get 22
                                  i32.const -1
                                  i32.add
                                  i32.const 7
                                  i32.lt_u
                                  br_if 0 (;@15;)
                                  local.get 38
                                  i32.const -8
                                  i32.and
                                  local.set 22
                                  i32.const 10
                                  local.set 17
                                  loop  ;; label = @16
                                    local.get 17
                                    i32.const 100000000
                                    i32.mul
                                    local.set 17
                                    local.get 22
                                    i32.const -8
                                    i32.add
                                    local.tee 22
                                    br_if 0 (;@16;)
                                  end
                                  local.get 21
                                  i32.eqz
                                  br_if 1 (;@14;)
                                end
                                loop  ;; label = @15
                                  local.get 17
                                  i32.const 10
                                  i32.mul
                                  local.set 17
                                  local.get 21
                                  i32.const -1
                                  i32.add
                                  local.tee 21
                                  br_if 0 (;@15;)
                                end
                              end
                              local.get 25
                              i32.const 4
                              i32.add
                              local.set 38
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 25
                                  i32.load
                                  local.tee 21
                                  local.get 21
                                  local.get 17
                                  i32.div_u
                                  local.tee 39
                                  local.get 17
                                  i32.mul
                                  i32.sub
                                  local.tee 22
                                  br_if 0 (;@15;)
                                  local.get 38
                                  local.get 16
                                  i32.eq
                                  br_if 1 (;@14;)
                                end
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 39
                                    i32.const 1
                                    i32.and
                                    br_if 0 (;@16;)
                                    f64.const 0x1p+53 (;=9.0072e+15;)
                                    local.set 31
                                    local.get 17
                                    i32.const 1000000000
                                    i32.ne
                                    br_if 1 (;@15;)
                                    local.get 25
                                    local.get 18
                                    i32.le_u
                                    br_if 1 (;@15;)
                                    local.get 25
                                    i32.const -4
                                    i32.add
                                    i32.load8_u
                                    i32.const 1
                                    i32.and
                                    i32.eqz
                                    br_if 1 (;@15;)
                                  end
                                  f64.const 0x1.0000000000001p+53 (;=9.0072e+15;)
                                  local.set 31
                                end
                                f64.const 0x1p-1 (;=0.5;)
                                f64.const 0x1p+0 (;=1;)
                                f64.const 0x1.8p+0 (;=1.5;)
                                local.get 38
                                local.get 16
                                i32.eq
                                select
                                f64.const 0x1.8p+0 (;=1.5;)
                                local.get 22
                                local.get 17
                                i32.const 1
                                i32.shr_u
                                local.tee 38
                                i32.eq
                                select
                                local.get 22
                                local.get 38
                                i32.lt_u
                                select
                                local.set 40
                                block  ;; label = @15
                                  local.get 33
                                  br_if 0 (;@15;)
                                  local.get 34
                                  i32.load8_u
                                  i32.const 45
                                  i32.ne
                                  br_if 0 (;@15;)
                                  local.get 40
                                  f64.neg
                                  local.set 40
                                  local.get 31
                                  f64.neg
                                  local.set 31
                                end
                                local.get 25
                                local.get 21
                                local.get 22
                                i32.sub
                                local.tee 21
                                i32.store
                                local.get 31
                                local.get 40
                                f64.add
                                local.get 31
                                f64.eq
                                br_if 0 (;@14;)
                                local.get 25
                                local.get 21
                                local.get 17
                                i32.add
                                local.tee 17
                                i32.store
                                block  ;; label = @15
                                  local.get 17
                                  i32.const 1000000000
                                  i32.lt_u
                                  br_if 0 (;@15;)
                                  local.get 7
                                  local.get 35
                                  local.get 36
                                  i32.add
                                  i32.add
                                  local.set 17
                                  loop  ;; label = @16
                                    local.get 17
                                    i32.const 4
                                    i32.add
                                    i32.const 0
                                    i32.store
                                    block  ;; label = @17
                                      local.get 17
                                      local.get 18
                                      i32.ge_u
                                      br_if 0 (;@17;)
                                      local.get 18
                                      i32.const -4
                                      i32.add
                                      local.tee 18
                                      i32.const 0
                                      i32.store
                                    end
                                    local.get 17
                                    local.get 17
                                    i32.load
                                    i32.const 1
                                    i32.add
                                    local.tee 21
                                    i32.store
                                    local.get 17
                                    i32.const -4
                                    i32.add
                                    local.set 17
                                    local.get 21
                                    i32.const 999999999
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                  end
                                  local.get 17
                                  i32.const 4
                                  i32.add
                                  local.set 25
                                end
                                local.get 28
                                local.get 18
                                i32.sub
                                i32.const 2
                                i32.shr_s
                                i32.const 9
                                i32.mul
                                local.set 20
                                local.get 18
                                i32.load
                                local.tee 21
                                i32.const 10
                                i32.lt_u
                                br_if 0 (;@14;)
                                i32.const 10
                                local.set 17
                                loop  ;; label = @15
                                  local.get 20
                                  i32.const 1
                                  i32.add
                                  local.set 20
                                  local.get 21
                                  local.get 17
                                  i32.const 10
                                  i32.mul
                                  local.tee 17
                                  i32.ge_u
                                  br_if 0 (;@15;)
                                end
                              end
                              local.get 25
                              i32.const 4
                              i32.add
                              local.tee 17
                              local.get 16
                              local.get 16
                              local.get 17
                              i32.gt_u
                              select
                              local.set 16
                            end
                            local.get 16
                            local.get 28
                            i32.sub
                            local.set 17
                            block  ;; label = @13
                              loop  ;; label = @14
                                local.get 17
                                local.set 22
                                local.get 16
                                local.tee 21
                                local.get 18
                                i32.le_u
                                local.tee 25
                                br_if 1 (;@13;)
                                local.get 22
                                i32.const -4
                                i32.add
                                local.set 17
                                local.get 21
                                i32.const -4
                                i32.add
                                local.tee 16
                                i32.load
                                i32.eqz
                                br_if 0 (;@14;)
                              end
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 24
                                br_if 0 (;@14;)
                                local.get 26
                                i32.const 8
                                i32.and
                                local.set 24
                                br 1 (;@13;)
                              end
                              local.get 20
                              i32.const -1
                              i32.xor
                              i32.const -1
                              local.get 19
                              i32.const 1
                              local.get 19
                              select
                              local.tee 16
                              local.get 20
                              i32.gt_s
                              local.get 20
                              i32.const -5
                              i32.gt_s
                              i32.and
                              local.tee 17
                              select
                              local.get 16
                              i32.add
                              local.set 19
                              i32.const -1
                              i32.const -2
                              local.get 17
                              select
                              local.get 27
                              i32.add
                              local.set 27
                              local.get 26
                              i32.const 8
                              i32.and
                              local.tee 24
                              br_if 0 (;@13;)
                              i32.const -9
                              local.set 16
                              block  ;; label = @14
                                local.get 25
                                br_if 0 (;@14;)
                                local.get 21
                                i32.const -4
                                i32.add
                                i32.load
                                local.tee 25
                                i32.eqz
                                br_if 0 (;@14;)
                                i32.const 0
                                local.set 16
                                local.get 25
                                i32.const 10
                                i32.rem_u
                                br_if 0 (;@14;)
                                i32.const 10
                                local.set 17
                                i32.const 0
                                local.set 16
                                loop  ;; label = @15
                                  local.get 16
                                  i32.const -1
                                  i32.add
                                  local.set 16
                                  local.get 25
                                  local.get 17
                                  i32.const 10
                                  i32.mul
                                  local.tee 17
                                  i32.rem_u
                                  i32.eqz
                                  br_if 0 (;@15;)
                                end
                              end
                              local.get 22
                              i32.const 2
                              i32.shr_s
                              i32.const 9
                              i32.mul
                              local.set 17
                              block  ;; label = @14
                                local.get 27
                                i32.const -33
                                i32.and
                                i32.const 70
                                i32.ne
                                br_if 0 (;@14;)
                                i32.const 0
                                local.set 24
                                local.get 19
                                local.get 17
                                local.get 16
                                i32.add
                                i32.const -9
                                i32.add
                                local.tee 16
                                i32.const 0
                                local.get 16
                                i32.const 0
                                i32.gt_s
                                select
                                local.tee 16
                                local.get 19
                                local.get 16
                                i32.lt_s
                                select
                                local.set 19
                                br 1 (;@13;)
                              end
                              i32.const 0
                              local.set 24
                              local.get 19
                              local.get 20
                              local.get 17
                              i32.add
                              local.get 16
                              i32.add
                              i32.const -9
                              i32.add
                              local.tee 16
                              i32.const 0
                              local.get 16
                              i32.const 0
                              i32.gt_s
                              select
                              local.tee 16
                              local.get 19
                              local.get 16
                              i32.lt_s
                              select
                              local.set 19
                            end
                            local.get 19
                            i32.const 2147483645
                            i32.const 2147483646
                            local.get 19
                            local.get 24
                            i32.or
                            local.tee 38
                            select
                            i32.gt_s
                            br_if 9 (;@3;)
                            local.get 19
                            local.get 38
                            i32.const 0
                            i32.ne
                            i32.add
                            i32.const 1
                            i32.add
                            local.set 25
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 27
                                i32.const -33
                                i32.and
                                i32.const 70
                                i32.ne
                                local.tee 35
                                br_if 0 (;@14;)
                                local.get 20
                                local.get 25
                                i32.const 2147483647
                                i32.xor
                                i32.gt_s
                                br_if 11 (;@3;)
                                local.get 20
                                i32.const 0
                                local.get 20
                                i32.const 0
                                i32.gt_s
                                select
                                local.set 16
                                br 1 (;@13;)
                              end
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 20
                                  br_if 0 (;@15;)
                                  local.get 6
                                  local.set 17
                                  local.get 6
                                  local.set 16
                                  br 1 (;@14;)
                                end
                                local.get 20
                                local.get 20
                                i32.const 31
                                i32.shr_s
                                local.tee 16
                                i32.xor
                                local.get 16
                                i32.sub
                                i64.extend_i32_u
                                local.set 29
                                local.get 6
                                local.set 17
                                local.get 6
                                local.set 16
                                loop  ;; label = @15
                                  local.get 16
                                  i32.const -1
                                  i32.add
                                  local.tee 16
                                  local.get 29
                                  local.get 29
                                  i64.const 10
                                  i64.div_u
                                  local.tee 30
                                  i64.const 10
                                  i64.mul
                                  i64.sub
                                  i32.wrap_i64
                                  i32.const 48
                                  i32.or
                                  i32.store8
                                  local.get 17
                                  i32.const -1
                                  i32.add
                                  local.set 17
                                  local.get 29
                                  i64.const 9
                                  i64.gt_u
                                  local.set 22
                                  local.get 30
                                  local.set 29
                                  local.get 22
                                  br_if 0 (;@15;)
                                end
                              end
                              block  ;; label = @14
                                local.get 6
                                local.get 17
                                i32.sub
                                i32.const 1
                                i32.gt_s
                                br_if 0 (;@14;)
                                local.get 6
                                local.get 16
                                i32.sub
                                local.set 17
                                loop  ;; label = @15
                                  local.get 16
                                  i32.const -1
                                  i32.add
                                  local.tee 16
                                  i32.const 48
                                  i32.store8
                                  local.get 17
                                  i32.const 1
                                  i32.add
                                  local.tee 17
                                  i32.const 2
                                  i32.lt_s
                                  br_if 0 (;@15;)
                                end
                              end
                              local.get 16
                              i32.const -2
                              i32.add
                              local.tee 39
                              local.get 27
                              i32.store8
                              local.get 16
                              i32.const -1
                              i32.add
                              i32.const 45
                              i32.const 43
                              local.get 20
                              i32.const 0
                              i32.lt_s
                              select
                              i32.store8
                              local.get 6
                              local.get 39
                              i32.sub
                              local.tee 16
                              local.get 25
                              i32.const 2147483647
                              i32.xor
                              i32.gt_s
                              br_if 10 (;@3;)
                            end
                            local.get 16
                            local.get 25
                            i32.add
                            local.tee 16
                            local.get 32
                            i32.const 2147483647
                            i32.xor
                            i32.gt_s
                            br_if 9 (;@3;)
                            local.get 16
                            local.get 32
                            i32.add
                            local.set 25
                            block  ;; label = @13
                              local.get 26
                              i32.const 73728
                              i32.and
                              local.tee 26
                              br_if 0 (;@13;)
                              local.get 23
                              local.get 25
                              i32.le_s
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 624
                              i32.add
                              i32.const 32
                              local.get 23
                              local.get 25
                              i32.sub
                              local.tee 16
                              i32.const 256
                              local.get 16
                              i32.const 256
                              i32.lt_u
                              local.tee 17
                              select
                              call $memset
                              drop
                              block  ;; label = @14
                                local.get 17
                                br_if 0 (;@14;)
                                loop  ;; label = @15
                                  block  ;; label = @16
                                    local.get 0
                                    i32.load8_u
                                    i32.const 32
                                    i32.and
                                    br_if 0 (;@16;)
                                    local.get 5
                                    i32.const 624
                                    i32.add
                                    i32.const 256
                                    local.get 0
                                    call $__fwritex
                                    drop
                                  end
                                  local.get 16
                                  i32.const -256
                                  i32.add
                                  local.tee 16
                                  i32.const 255
                                  i32.gt_u
                                  br_if 0 (;@15;)
                                end
                              end
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 624
                              i32.add
                              local.get 16
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            block  ;; label = @13
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              local.get 34
                              local.get 32
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            block  ;; label = @13
                              local.get 26
                              i32.const 65536
                              i32.ne
                              br_if 0 (;@13;)
                              local.get 23
                              local.get 25
                              i32.le_s
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 624
                              i32.add
                              i32.const 48
                              local.get 23
                              local.get 25
                              i32.sub
                              local.tee 16
                              i32.const 256
                              local.get 16
                              i32.const 256
                              i32.lt_u
                              local.tee 17
                              select
                              call $memset
                              drop
                              block  ;; label = @14
                                local.get 17
                                br_if 0 (;@14;)
                                loop  ;; label = @15
                                  block  ;; label = @16
                                    local.get 0
                                    i32.load8_u
                                    i32.const 32
                                    i32.and
                                    br_if 0 (;@16;)
                                    local.get 5
                                    i32.const 624
                                    i32.add
                                    i32.const 256
                                    local.get 0
                                    call $__fwritex
                                    drop
                                  end
                                  local.get 16
                                  i32.const -256
                                  i32.add
                                  local.tee 16
                                  i32.const 255
                                  i32.gt_u
                                  br_if 0 (;@15;)
                                end
                              end
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 624
                              i32.add
                              local.get 16
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            local.get 35
                            br_if 2 (;@10;)
                            local.get 28
                            local.get 18
                            local.get 18
                            local.get 28
                            i32.gt_u
                            select
                            local.tee 22
                            local.set 18
                            loop  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      local.get 18
                                      i32.load
                                      local.tee 16
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      local.get 16
                                      i64.extend_i32_u
                                      local.set 29
                                      i32.const 8
                                      local.set 16
                                      loop  ;; label = @18
                                        local.get 5
                                        i32.const 80
                                        i32.add
                                        local.get 16
                                        i32.add
                                        local.get 29
                                        local.get 29
                                        i64.const 10
                                        i64.div_u
                                        local.tee 30
                                        i64.const 10
                                        i64.mul
                                        i64.sub
                                        i32.wrap_i64
                                        i32.const 48
                                        i32.or
                                        i32.store8
                                        local.get 16
                                        i32.const -1
                                        i32.add
                                        local.set 16
                                        local.get 29
                                        i64.const 9
                                        i64.gt_u
                                        local.set 17
                                        local.get 30
                                        local.set 29
                                        local.get 17
                                        br_if 0 (;@18;)
                                      end
                                      local.get 5
                                      i32.const 80
                                      i32.add
                                      local.get 16
                                      i32.add
                                      i32.const 1
                                      i32.add
                                      local.set 17
                                      block  ;; label = @18
                                        local.get 18
                                        local.get 22
                                        i32.eq
                                        br_if 0 (;@18;)
                                        local.get 16
                                        i32.const 2
                                        i32.add
                                        i32.const 2
                                        i32.lt_s
                                        br_if 4 (;@14;)
                                        br 3 (;@15;)
                                      end
                                      local.get 16
                                      i32.const 8
                                      i32.ne
                                      br_if 3 (;@14;)
                                      br 1 (;@16;)
                                    end
                                    local.get 12
                                    local.set 17
                                    local.get 18
                                    local.get 22
                                    i32.ne
                                    br_if 1 (;@15;)
                                  end
                                  local.get 5
                                  i32.const 48
                                  i32.store8 offset=88
                                  local.get 11
                                  local.set 17
                                  br 1 (;@14;)
                                end
                                loop  ;; label = @15
                                  local.get 17
                                  i32.const -1
                                  i32.add
                                  local.tee 17
                                  i32.const 48
                                  i32.store8
                                  local.get 17
                                  local.get 5
                                  i32.const 80
                                  i32.add
                                  i32.gt_u
                                  br_if 0 (;@15;)
                                end
                              end
                              block  ;; label = @14
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 17
                                local.get 12
                                local.get 17
                                i32.sub
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              local.get 18
                              i32.const 4
                              i32.add
                              local.tee 18
                              local.get 28
                              i32.le_u
                              br_if 0 (;@13;)
                            end
                            block  ;; label = @13
                              local.get 38
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              i32.const 1197
                              i32.const 1
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 19
                                i32.const 1
                                i32.ge_s
                                br_if 0 (;@14;)
                                local.get 19
                                local.set 16
                                br 1 (;@13;)
                              end
                              block  ;; label = @14
                                local.get 18
                                local.get 21
                                i32.lt_u
                                br_if 0 (;@14;)
                                local.get 19
                                local.set 16
                                br 1 (;@13;)
                              end
                              loop  ;; label = @14
                                local.get 12
                                local.set 16
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 18
                                    i32.load
                                    local.tee 17
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    local.get 17
                                    i64.extend_i32_u
                                    local.set 29
                                    local.get 12
                                    local.set 16
                                    loop  ;; label = @17
                                      local.get 16
                                      i32.const -1
                                      i32.add
                                      local.tee 16
                                      local.get 29
                                      local.get 29
                                      i64.const 10
                                      i64.div_u
                                      local.tee 30
                                      i64.const 10
                                      i64.mul
                                      i64.sub
                                      i32.wrap_i64
                                      i32.const 48
                                      i32.or
                                      i32.store8
                                      local.get 29
                                      i64.const 9
                                      i64.gt_u
                                      local.set 17
                                      local.get 30
                                      local.set 29
                                      local.get 17
                                      br_if 0 (;@17;)
                                    end
                                    local.get 16
                                    local.get 5
                                    i32.const 80
                                    i32.add
                                    i32.le_u
                                    br_if 1 (;@15;)
                                  end
                                  loop  ;; label = @16
                                    local.get 16
                                    i32.const -1
                                    i32.add
                                    local.tee 16
                                    i32.const 48
                                    i32.store8
                                    local.get 16
                                    local.get 5
                                    i32.const 80
                                    i32.add
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                  end
                                end
                                block  ;; label = @15
                                  local.get 0
                                  i32.load8_u
                                  i32.const 32
                                  i32.and
                                  br_if 0 (;@15;)
                                  local.get 16
                                  local.get 19
                                  i32.const 9
                                  local.get 19
                                  i32.const 9
                                  i32.lt_u
                                  select
                                  local.get 0
                                  call $__fwritex
                                  drop
                                end
                                local.get 19
                                i32.const -9
                                i32.add
                                local.set 16
                                local.get 18
                                i32.const 4
                                i32.add
                                local.tee 18
                                local.get 21
                                i32.ge_u
                                br_if 1 (;@13;)
                                local.get 19
                                i32.const 9
                                i32.gt_s
                                local.set 17
                                local.get 16
                                local.set 19
                                local.get 17
                                br_if 0 (;@14;)
                              end
                            end
                            local.get 0
                            i32.const 48
                            local.get 16
                            i32.const 9
                            i32.add
                            i32.const 9
                            i32.const 0
                            call $pad
                            br 3 (;@9;)
                          end
                          call $__errno_location
                          i32.const 22
                          i32.store
                          br 9 (;@2;)
                        end
                        i32.const 0
                        local.set 19
                        i32.const 1152
                        local.set 28
                        local.get 13
                        local.set 16
                        local.get 26
                        local.set 25
                        local.get 20
                        local.set 22
                        br 5 (;@5;)
                      end
                      block  ;; label = @10
                        local.get 19
                        i32.const 0
                        i32.lt_s
                        br_if 0 (;@10;)
                        local.get 21
                        local.get 18
                        i32.const 4
                        i32.add
                        local.get 21
                        local.get 18
                        i32.gt_u
                        select
                        local.set 20
                        local.get 18
                        local.set 22
                        loop  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 22
                              i32.load
                              local.tee 16
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 16
                              i64.extend_i32_u
                              local.set 29
                              local.get 12
                              local.set 16
                              loop  ;; label = @14
                                local.get 16
                                i32.const -1
                                i32.add
                                local.tee 16
                                local.get 29
                                local.get 29
                                i64.const 10
                                i64.div_u
                                local.tee 30
                                i64.const 10
                                i64.mul
                                i64.sub
                                i32.wrap_i64
                                i32.const 48
                                i32.or
                                i32.store8
                                local.get 29
                                i64.const 10
                                i64.lt_u
                                local.set 17
                                local.get 30
                                local.set 29
                                local.get 17
                                i32.eqz
                                br_if 0 (;@14;)
                                br 2 (;@12;)
                              end
                            end
                            local.get 5
                            i32.const 48
                            i32.store8 offset=88
                            local.get 11
                            local.set 16
                          end
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 22
                              local.get 18
                              i32.eq
                              br_if 0 (;@13;)
                              block  ;; label = @14
                                local.get 16
                                local.get 5
                                i32.const 80
                                i32.add
                                i32.gt_u
                                br_if 0 (;@14;)
                                local.get 16
                                local.set 17
                                br 2 (;@12;)
                              end
                              local.get 16
                              local.set 17
                              block  ;; label = @14
                                local.get 16
                                i32.const 7
                                i32.and
                                local.tee 21
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 16
                                local.set 17
                                loop  ;; label = @15
                                  local.get 17
                                  i32.const -1
                                  i32.add
                                  local.tee 17
                                  i32.const 48
                                  i32.store8
                                  local.get 21
                                  i32.const -1
                                  i32.add
                                  local.tee 21
                                  br_if 0 (;@15;)
                                end
                              end
                              local.get 5
                              i32.const 80
                              i32.add
                              local.get 16
                              i32.sub
                              i32.const -8
                              i32.gt_u
                              br_if 1 (;@12;)
                              loop  ;; label = @14
                                local.get 17
                                i32.const -8
                                i32.add
                                local.tee 17
                                i64.const 3472328296227680304
                                i64.store align=1
                                local.get 17
                                local.get 5
                                i32.const 80
                                i32.add
                                i32.gt_u
                                br_if 0 (;@14;)
                                br 2 (;@12;)
                              end
                            end
                            block  ;; label = @13
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              local.get 16
                              i32.const 1
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            local.get 16
                            i32.const 1
                            i32.add
                            local.set 17
                            local.get 19
                            local.get 24
                            i32.or
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 0
                            i32.load8_u
                            i32.const 32
                            i32.and
                            br_if 0 (;@12;)
                            i32.const 1197
                            i32.const 1
                            local.get 0
                            call $__fwritex
                            drop
                          end
                          local.get 12
                          local.get 17
                          i32.sub
                          local.set 16
                          block  ;; label = @12
                            local.get 0
                            i32.load8_u
                            i32.const 32
                            i32.and
                            br_if 0 (;@12;)
                            local.get 17
                            local.get 16
                            local.get 19
                            local.get 16
                            local.get 19
                            i32.lt_s
                            select
                            local.get 0
                            call $__fwritex
                            drop
                          end
                          local.get 19
                          local.get 16
                          i32.sub
                          local.set 19
                          local.get 22
                          i32.const 4
                          i32.add
                          local.tee 22
                          local.get 20
                          i32.ge_u
                          br_if 1 (;@10;)
                          local.get 19
                          i32.const -1
                          i32.gt_s
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 0
                      i32.const 48
                      local.get 19
                      i32.const 18
                      i32.add
                      i32.const 18
                      i32.const 0
                      call $pad
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 39
                      local.get 6
                      local.get 39
                      i32.sub
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    block  ;; label = @9
                      local.get 26
                      i32.const 8192
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 23
                      local.get 25
                      i32.le_s
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 624
                      i32.add
                      i32.const 32
                      local.get 23
                      local.get 25
                      i32.sub
                      local.tee 16
                      i32.const 256
                      local.get 16
                      i32.const 256
                      i32.lt_u
                      local.tee 17
                      select
                      call $memset
                      drop
                      block  ;; label = @10
                        local.get 17
                        br_if 0 (;@10;)
                        loop  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.load8_u
                            i32.const 32
                            i32.and
                            br_if 0 (;@12;)
                            local.get 5
                            i32.const 624
                            i32.add
                            i32.const 256
                            local.get 0
                            call $__fwritex
                            drop
                          end
                          local.get 16
                          i32.const -256
                          i32.add
                          local.tee 16
                          i32.const 255
                          i32.gt_u
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 624
                      i32.add
                      local.get 16
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    local.get 23
                    local.get 25
                    local.get 23
                    local.get 25
                    i32.gt_s
                    select
                    local.set 16
                    br 4 (;@4;)
                  end
                  local.get 34
                  local.get 27
                  i32.const 26
                  i32.shl
                  i32.const 31
                  i32.shr_s
                  i32.const 9
                  i32.and
                  i32.add
                  local.set 24
                  block  ;; label = @8
                    local.get 20
                    i32.const 11
                    i32.gt_u
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 12
                        local.get 20
                        i32.sub
                        local.tee 16
                        i32.const 7
                        i32.and
                        local.tee 17
                        br_if 0 (;@10;)
                        f64.const 0x1p+4 (;=16;)
                        local.set 40
                        br 1 (;@9;)
                      end
                      local.get 20
                      i32.const -12
                      i32.add
                      local.set 16
                      f64.const 0x1p+4 (;=16;)
                      local.set 40
                      loop  ;; label = @10
                        local.get 16
                        i32.const 1
                        i32.add
                        local.set 16
                        local.get 40
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        local.set 40
                        local.get 17
                        i32.const -1
                        i32.add
                        local.tee 17
                        br_if 0 (;@10;)
                      end
                      i32.const 0
                      local.get 16
                      i32.sub
                      local.set 16
                    end
                    block  ;; label = @9
                      local.get 20
                      i32.const 4
                      i32.gt_u
                      br_if 0 (;@9;)
                      loop  ;; label = @10
                        local.get 40
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        local.set 40
                        local.get 16
                        i32.const -8
                        i32.add
                        local.tee 16
                        br_if 0 (;@10;)
                      end
                    end
                    block  ;; label = @9
                      local.get 24
                      i32.load8_u
                      i32.const 45
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 40
                      local.get 31
                      f64.neg
                      local.get 40
                      f64.sub
                      f64.add
                      f64.neg
                      local.set 31
                      br 1 (;@8;)
                    end
                    local.get 31
                    local.get 40
                    f64.add
                    local.get 40
                    f64.sub
                    local.set 31
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 5
                      i32.load offset=108
                      local.tee 21
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 21
                      local.get 21
                      i32.const 31
                      i32.shr_s
                      local.tee 16
                      i32.xor
                      local.get 16
                      i32.sub
                      i64.extend_i32_u
                      local.set 29
                      local.get 6
                      local.set 16
                      loop  ;; label = @10
                        local.get 16
                        i32.const -1
                        i32.add
                        local.tee 16
                        local.get 29
                        local.get 29
                        i64.const 10
                        i64.div_u
                        local.tee 30
                        i64.const 10
                        i64.mul
                        i64.sub
                        i32.wrap_i64
                        i32.const 48
                        i32.or
                        i32.store8
                        local.get 29
                        i64.const 10
                        i64.lt_u
                        local.set 17
                        local.get 30
                        local.set 29
                        local.get 17
                        i32.eqz
                        br_if 0 (;@10;)
                        br 2 (;@8;)
                      end
                    end
                    local.get 5
                    i32.const 48
                    i32.store8 offset=79
                    local.get 10
                    local.set 16
                  end
                  local.get 32
                  i32.const 2
                  i32.or
                  local.set 22
                  local.get 27
                  i32.const 32
                  i32.and
                  local.set 18
                  local.get 16
                  i32.const -2
                  i32.add
                  local.tee 25
                  local.get 27
                  i32.const 15
                  i32.add
                  i32.store8
                  local.get 16
                  i32.const -1
                  i32.add
                  i32.const 45
                  i32.const 43
                  local.get 21
                  i32.const 0
                  i32.lt_s
                  select
                  i32.store8
                  local.get 26
                  i32.const 8
                  i32.and
                  i32.eqz
                  local.get 20
                  i32.const 1
                  i32.lt_s
                  i32.and
                  local.set 21
                  local.get 5
                  i32.const 80
                  i32.add
                  local.set 17
                  loop  ;; label = @8
                    local.get 17
                    local.tee 16
                    local.get 31
                    i32.trunc_sat_f64_s
                    local.tee 17
                    i32.const 4368
                    i32.add
                    i32.load8_u
                    local.get 18
                    i32.or
                    i32.store8
                    local.get 31
                    local.get 17
                    f64.convert_i32_s
                    f64.sub
                    f64.const 0x1p+4 (;=16;)
                    f64.mul
                    local.set 31
                    block  ;; label = @9
                      local.get 16
                      i32.const 1
                      i32.add
                      local.tee 17
                      local.get 5
                      i32.const 80
                      i32.add
                      i32.sub
                      i32.const 1
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 21
                      local.get 31
                      f64.const 0x0p+0 (;=0;)
                      f64.eq
                      i32.and
                      br_if 0 (;@9;)
                      local.get 16
                      i32.const 46
                      i32.store8 offset=1
                      local.get 16
                      i32.const 2
                      i32.add
                      local.set 17
                    end
                    local.get 31
                    f64.const 0x0p+0 (;=0;)
                    f64.ne
                    br_if 0 (;@8;)
                  end
                  local.get 20
                  i32.const 2147483645
                  local.get 6
                  local.get 25
                  i32.sub
                  local.tee 19
                  local.get 22
                  i32.add
                  local.tee 16
                  i32.sub
                  i32.gt_s
                  br_if 4 (;@3;)
                  local.get 20
                  i32.const 2
                  i32.add
                  local.get 17
                  local.get 5
                  i32.const 80
                  i32.add
                  i32.sub
                  local.tee 18
                  local.get 18
                  i32.const -2
                  i32.add
                  local.get 20
                  i32.lt_s
                  select
                  local.get 18
                  local.get 20
                  select
                  local.tee 20
                  local.get 16
                  i32.add
                  local.set 17
                  block  ;; label = @8
                    local.get 26
                    i32.const 73728
                    i32.and
                    local.tee 21
                    br_if 0 (;@8;)
                    local.get 23
                    local.get 17
                    i32.le_s
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 624
                    i32.add
                    i32.const 32
                    local.get 23
                    local.get 17
                    i32.sub
                    local.tee 16
                    i32.const 256
                    local.get 16
                    i32.const 256
                    i32.lt_u
                    local.tee 28
                    select
                    call $memset
                    drop
                    block  ;; label = @9
                      local.get 28
                      br_if 0 (;@9;)
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 0
                          i32.load8_u
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 624
                          i32.add
                          i32.const 256
                          local.get 0
                          call $__fwritex
                          drop
                        end
                        local.get 16
                        i32.const -256
                        i32.add
                        local.tee 16
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 624
                    i32.add
                    local.get 16
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 24
                    local.get 22
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 21
                    i32.const 65536
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 23
                    local.get 17
                    i32.le_s
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 624
                    i32.add
                    i32.const 48
                    local.get 23
                    local.get 17
                    i32.sub
                    local.tee 16
                    i32.const 256
                    local.get 16
                    i32.const 256
                    i32.lt_u
                    local.tee 22
                    select
                    call $memset
                    drop
                    block  ;; label = @9
                      local.get 22
                      br_if 0 (;@9;)
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 0
                          i32.load8_u
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 624
                          i32.add
                          i32.const 256
                          local.get 0
                          call $__fwritex
                          drop
                        end
                        local.get 16
                        i32.const -256
                        i32.add
                        local.tee 16
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 624
                    i32.add
                    local.get 16
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 80
                    i32.add
                    local.get 18
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 20
                    local.get 18
                    i32.sub
                    local.tee 16
                    i32.const 1
                    i32.lt_s
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 624
                    i32.add
                    i32.const 48
                    local.get 16
                    i32.const 256
                    local.get 16
                    i32.const 256
                    i32.lt_u
                    local.tee 18
                    select
                    call $memset
                    drop
                    block  ;; label = @9
                      local.get 18
                      br_if 0 (;@9;)
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 0
                          i32.load8_u
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 624
                          i32.add
                          i32.const 256
                          local.get 0
                          call $__fwritex
                          drop
                        end
                        local.get 16
                        i32.const -256
                        i32.add
                        local.tee 16
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 624
                    i32.add
                    local.get 16
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 25
                    local.get 19
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 21
                    i32.const 8192
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 23
                    local.get 17
                    i32.le_s
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 624
                    i32.add
                    i32.const 32
                    local.get 23
                    local.get 17
                    i32.sub
                    local.tee 16
                    i32.const 256
                    local.get 16
                    i32.const 256
                    i32.lt_u
                    local.tee 18
                    select
                    call $memset
                    drop
                    block  ;; label = @9
                      local.get 18
                      br_if 0 (;@9;)
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 0
                          i32.load8_u
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 624
                          i32.add
                          i32.const 256
                          local.get 0
                          call $__fwritex
                          drop
                        end
                        local.get 16
                        i32.const -256
                        i32.add
                        local.tee 16
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 624
                    i32.add
                    local.get 16
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  local.get 23
                  local.get 17
                  local.get 23
                  local.get 17
                  i32.gt_s
                  select
                  local.set 16
                  br 3 (;@4;)
                end
                i64.const 0
                local.set 30
                local.get 13
                local.set 17
              end
              local.get 24
              local.get 20
              i32.const 0
              i32.lt_s
              i32.and
              br_if 2 (;@3;)
              local.get 26
              i32.const -65537
              i32.and
              local.get 26
              local.get 24
              select
              local.set 25
              block  ;; label = @6
                local.get 30
                i64.const 0
                i64.ne
                br_if 0 (;@6;)
                i32.const 0
                local.set 22
                local.get 20
                br_if 0 (;@6;)
                local.get 13
                local.set 17
                local.get 13
                local.set 16
                br 1 (;@5;)
              end
              local.get 20
              local.get 13
              local.get 17
              i32.sub
              local.get 30
              i64.eqz
              i32.add
              local.tee 16
              local.get 20
              local.get 16
              i32.gt_s
              select
              local.set 22
              local.get 13
              local.set 16
            end
            local.get 22
            local.get 16
            local.get 17
            i32.sub
            local.tee 20
            local.get 22
            local.get 20
            i32.gt_s
            select
            local.tee 24
            local.get 19
            i32.const 2147483647
            i32.xor
            i32.gt_s
            br_if 1 (;@3;)
            local.get 23
            local.get 19
            local.get 24
            i32.add
            local.tee 21
            local.get 23
            local.get 21
            i32.gt_s
            select
            local.tee 16
            local.get 18
            i32.gt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 25
              i32.const 73728
              i32.and
              local.tee 25
              br_if 0 (;@5;)
              local.get 23
              local.get 21
              i32.le_s
              br_if 0 (;@5;)
              local.get 5
              i32.const 112
              i32.add
              i32.const 32
              local.get 16
              local.get 21
              i32.sub
              local.tee 18
              i32.const 256
              local.get 18
              i32.const 256
              i32.lt_u
              local.tee 26
              select
              call $memset
              drop
              block  ;; label = @6
                local.get 26
                br_if 0 (;@6;)
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 112
                    i32.add
                    i32.const 256
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  local.get 18
                  i32.const -256
                  i32.add
                  local.tee 18
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                end
              end
              local.get 0
              i32.load8_u
              i32.const 32
              i32.and
              br_if 0 (;@5;)
              local.get 5
              i32.const 112
              i32.add
              local.get 18
              local.get 0
              call $__fwritex
              drop
            end
            block  ;; label = @5
              local.get 0
              i32.load8_u
              i32.const 32
              i32.and
              br_if 0 (;@5;)
              local.get 28
              local.get 19
              local.get 0
              call $__fwritex
              drop
            end
            block  ;; label = @5
              local.get 25
              i32.const 65536
              i32.ne
              br_if 0 (;@5;)
              local.get 23
              local.get 21
              i32.le_s
              br_if 0 (;@5;)
              local.get 5
              i32.const 112
              i32.add
              i32.const 48
              local.get 16
              local.get 21
              i32.sub
              local.tee 18
              i32.const 256
              local.get 18
              i32.const 256
              i32.lt_u
              local.tee 19
              select
              call $memset
              drop
              block  ;; label = @6
                local.get 19
                br_if 0 (;@6;)
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 112
                    i32.add
                    i32.const 256
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  local.get 18
                  i32.const -256
                  i32.add
                  local.tee 18
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                end
              end
              local.get 0
              i32.load8_u
              i32.const 32
              i32.and
              br_if 0 (;@5;)
              local.get 5
              i32.const 112
              i32.add
              local.get 18
              local.get 0
              call $__fwritex
              drop
            end
            block  ;; label = @5
              local.get 22
              local.get 20
              i32.le_s
              br_if 0 (;@5;)
              local.get 5
              i32.const 112
              i32.add
              i32.const 48
              local.get 24
              local.get 20
              i32.sub
              local.tee 18
              i32.const 256
              local.get 18
              i32.const 256
              i32.lt_u
              local.tee 22
              select
              call $memset
              drop
              block  ;; label = @6
                local.get 22
                br_if 0 (;@6;)
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 112
                    i32.add
                    i32.const 256
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  local.get 18
                  i32.const -256
                  i32.add
                  local.tee 18
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                end
              end
              local.get 0
              i32.load8_u
              i32.const 32
              i32.and
              br_if 0 (;@5;)
              local.get 5
              i32.const 112
              i32.add
              local.get 18
              local.get 0
              call $__fwritex
              drop
            end
            block  ;; label = @5
              local.get 0
              i32.load8_u
              i32.const 32
              i32.and
              br_if 0 (;@5;)
              local.get 17
              local.get 20
              local.get 0
              call $__fwritex
              drop
            end
            local.get 25
            i32.const 8192
            i32.ne
            br_if 0 (;@4;)
            local.get 23
            local.get 21
            i32.le_s
            br_if 0 (;@4;)
            local.get 5
            i32.const 112
            i32.add
            i32.const 32
            local.get 16
            local.get 21
            i32.sub
            local.tee 17
            i32.const 256
            local.get 17
            i32.const 256
            i32.lt_u
            local.tee 18
            select
            call $memset
            drop
            block  ;; label = @5
              local.get 18
              br_if 0 (;@5;)
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.load8_u
                  i32.const 32
                  i32.and
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 112
                  i32.add
                  i32.const 256
                  local.get 0
                  call $__fwritex
                  drop
                end
                local.get 17
                i32.const -256
                i32.add
                local.tee 17
                i32.const 255
                i32.gt_u
                br_if 0 (;@6;)
              end
            end
            local.get 0
            i32.load8_u
            i32.const 32
            i32.and
            br_if 0 (;@4;)
            local.get 5
            i32.const 112
            i32.add
            local.get 17
            local.get 0
            call $__fwritex
            drop
            br 0 (;@4;)
          end
        end
        call $__errno_location
        i32.const 75
        i32.store
      end
      i32.const -1
      local.set 15
    end
    local.get 5
    i32.const 880
    i32.add
    global.set $__stack_pointer
    local.get 15)
  (func $pop_arg (type 20) (param i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          local.get 1
                                          i32.const -9
                                          i32.add
                                          br_table 17 (;@2;) 0 (;@19;) 1 (;@18;) 4 (;@15;) 2 (;@17;) 3 (;@16;) 5 (;@14;) 6 (;@13;) 7 (;@12;) 8 (;@11;) 9 (;@10;) 10 (;@9;) 11 (;@8;) 12 (;@7;) 13 (;@6;) 14 (;@5;) 15 (;@4;) 16 (;@3;) 18 (;@1;)
                                        end
                                        local.get 2
                                        local.get 2
                                        i32.load
                                        local.tee 1
                                        i32.const 4
                                        i32.add
                                        i32.store
                                        local.get 0
                                        local.get 1
                                        i64.load32_s
                                        i64.store
                                        return
                                      end
                                      local.get 2
                                      local.get 2
                                      i32.load
                                      local.tee 1
                                      i32.const 4
                                      i32.add
                                      i32.store
                                      local.get 0
                                      local.get 1
                                      i64.load32_u
                                      i64.store
                                      return
                                    end
                                    local.get 2
                                    local.get 2
                                    i32.load
                                    i32.const 7
                                    i32.add
                                    i32.const -8
                                    i32.and
                                    local.tee 1
                                    i32.const 8
                                    i32.add
                                    i32.store
                                    local.get 0
                                    local.get 1
                                    i64.load
                                    i64.store
                                    return
                                  end
                                  local.get 2
                                  local.get 2
                                  i32.load
                                  i32.const 7
                                  i32.add
                                  i32.const -8
                                  i32.and
                                  local.tee 1
                                  i32.const 8
                                  i32.add
                                  i32.store
                                  local.get 0
                                  local.get 1
                                  i64.load
                                  i64.store
                                  return
                                end
                                local.get 2
                                local.get 2
                                i32.load
                                i32.const 7
                                i32.add
                                i32.const -8
                                i32.and
                                local.tee 1
                                i32.const 8
                                i32.add
                                i32.store
                                local.get 0
                                local.get 1
                                i64.load
                                i64.store
                                return
                              end
                              local.get 2
                              local.get 2
                              i32.load
                              local.tee 1
                              i32.const 4
                              i32.add
                              i32.store
                              local.get 0
                              local.get 1
                              i64.load16_s
                              i64.store
                              return
                            end
                            local.get 2
                            local.get 2
                            i32.load
                            local.tee 1
                            i32.const 4
                            i32.add
                            i32.store
                            local.get 0
                            local.get 1
                            i64.load16_u
                            i64.store
                            return
                          end
                          local.get 2
                          local.get 2
                          i32.load
                          local.tee 1
                          i32.const 4
                          i32.add
                          i32.store
                          local.get 0
                          local.get 1
                          i64.load8_s
                          i64.store
                          return
                        end
                        local.get 2
                        local.get 2
                        i32.load
                        local.tee 1
                        i32.const 4
                        i32.add
                        i32.store
                        local.get 0
                        local.get 1
                        i64.load8_u
                        i64.store
                        return
                      end
                      local.get 2
                      local.get 2
                      i32.load
                      i32.const 7
                      i32.add
                      i32.const -8
                      i32.and
                      local.tee 1
                      i32.const 8
                      i32.add
                      i32.store
                      local.get 0
                      local.get 1
                      i64.load
                      i64.store
                      return
                    end
                    local.get 2
                    local.get 2
                    i32.load
                    local.tee 1
                    i32.const 4
                    i32.add
                    i32.store
                    local.get 0
                    local.get 1
                    i64.load32_u
                    i64.store
                    return
                  end
                  local.get 2
                  local.get 2
                  i32.load
                  i32.const 7
                  i32.add
                  i32.const -8
                  i32.and
                  local.tee 1
                  i32.const 8
                  i32.add
                  i32.store
                  local.get 0
                  local.get 1
                  i64.load
                  i64.store
                  return
                end
                local.get 2
                local.get 2
                i32.load
                i32.const 7
                i32.add
                i32.const -8
                i32.and
                local.tee 1
                i32.const 8
                i32.add
                i32.store
                local.get 0
                local.get 1
                i64.load
                i64.store
                return
              end
              local.get 2
              local.get 2
              i32.load
              local.tee 1
              i32.const 4
              i32.add
              i32.store
              local.get 0
              local.get 1
              i64.load32_s
              i64.store
              return
            end
            local.get 2
            local.get 2
            i32.load
            local.tee 1
            i32.const 4
            i32.add
            i32.store
            local.get 0
            local.get 1
            i64.load32_u
            i64.store
            return
          end
          local.get 2
          local.get 2
          i32.load
          i32.const 7
          i32.add
          i32.const -8
          i32.and
          local.tee 1
          i32.const 8
          i32.add
          i32.store
          local.get 0
          local.get 1
          f64.load
          f64.store
          return
        end
        local.get 2
        local.get 2
        i32.load
        i32.const 7
        i32.add
        i32.const -8
        i32.and
        local.tee 1
        i32.const 8
        i32.add
        i32.store
        local.get 0
        local.get 1
        f64.load
        f64.store
        call $long_double_not_supported
        unreachable
      end
      local.get 2
      local.get 2
      i32.load
      local.tee 1
      i32.const 4
      i32.add
      i32.store
      local.get 0
      local.get 1
      i32.load
      i32.store
    end)
  (func $pad (type 23) (param i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 256
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 2
      local.get 3
      i32.le_s
      br_if 0 (;@1;)
      local.get 4
      i32.const 73728
      i32.and
      br_if 0 (;@1;)
      local.get 5
      local.get 1
      local.get 2
      local.get 3
      i32.sub
      local.tee 3
      i32.const 256
      local.get 3
      i32.const 256
      i32.lt_u
      local.tee 2
      select
      call $memset
      drop
      block  ;; label = @2
        local.get 2
        br_if 0 (;@2;)
        loop  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u
            i32.const 32
            i32.and
            br_if 0 (;@4;)
            local.get 5
            i32.const 256
            local.get 0
            call $__fwritex
            drop
          end
          local.get 3
          i32.const -256
          i32.add
          local.tee 3
          i32.const 255
          i32.gt_u
          br_if 0 (;@3;)
        end
      end
      local.get 0
      i32.load8_u
      i32.const 32
      i32.and
      br_if 0 (;@1;)
      local.get 5
      local.get 3
      local.get 0
      call $__fwritex
      drop
    end
    local.get 5
    i32.const 256
    i32.add
    global.set $__stack_pointer)
  (func $long_double_not_supported (type 14)
    i32.const 1425
    i32.const 4656
    call $fputs
    drop
    call $abort
    unreachable)
  (func $atoi (type 10) (param i32) (result i32)
    (local i32 i32 i32 i32 i32)
    loop  ;; label = @1
      local.get 0
      i32.load8_s
      local.tee 1
      i32.const -14
      i32.add
      local.set 2
      local.get 0
      i32.const 1
      i32.add
      local.tee 3
      local.set 0
      local.get 1
      i32.const 255
      i32.and
      local.tee 4
      i32.const 32
      i32.eq
      br_if 0 (;@1;)
      local.get 3
      local.set 0
      local.get 2
      i32.const -6
      i32.gt_u
      br_if 0 (;@1;)
    end
    i32.const 1
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 4
            i32.const -43
            i32.add
            br_table 2 (;@2;) 0 (;@4;) 1 (;@3;) 0 (;@4;)
          end
          local.get 3
          i32.const -1
          i32.add
          local.set 3
          i32.const 1
          local.set 5
          br 2 (;@1;)
        end
        i32.const 0
        local.set 5
      end
      local.get 3
      i32.load8_s
      local.set 1
    end
    i32.const 0
    local.set 2
    block  ;; label = @1
      local.get 1
      i32.const -48
      i32.add
      local.tee 1
      i32.const 9
      i32.gt_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 1
      i32.add
      local.set 0
      i32.const 0
      local.set 2
      loop  ;; label = @2
        local.get 2
        i32.const 10
        i32.mul
        local.get 1
        i32.sub
        local.set 2
        local.get 0
        i32.load8_s
        local.set 1
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 1
        i32.const -48
        i32.add
        local.tee 1
        i32.const 10
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    i32.const 0
    local.get 2
    i32.sub
    local.get 2
    local.get 5
    select)
  (func $__toread (type 10) (param i32) (result i32)
    (local i32 i32)
    local.get 0
    local.get 0
    i32.load offset=80
    local.tee 1
    i32.const -1
    i32.add
    local.get 1
    i32.or
    i32.store offset=80
    block  ;; label = @1
      local.get 0
      i32.load offset=20
      local.get 0
      i32.load offset=28
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.const 0
      local.get 0
      i32.load offset=36
      call_indirect (type 0)
      drop
    end
    local.get 0
    i32.const 0
    i32.store offset=28
    local.get 0
    i64.const 0
    i64.store offset=16
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.const 4
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 32
      i32.or
      i32.store
      i32.const -1
      return
    end
    local.get 0
    local.get 0
    i32.load offset=44
    local.get 0
    i32.load offset=48
    i32.add
    local.tee 2
    i32.store offset=8
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 1
    i32.const 27
    i32.shl
    i32.const 31
    i32.shr_s)
  (func $__uflow (type 10) (param i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const -1
    local.set 2
    block  ;; label = @1
      local.get 0
      call $__toread
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 15
      i32.add
      i32.const 1
      local.get 0
      i32.load offset=32
      call_indirect (type 0)
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.load8_u offset=15
      local.set 2
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $__shlim (type 24) (param i32 i64)
    (local i32 i32)
    local.get 0
    local.get 1
    i64.store offset=120
    local.get 0
    local.get 0
    i32.load offset=44
    local.get 0
    i32.load offset=4
    local.tee 2
    i32.sub
    i64.extend_i32_s
    i64.store offset=128
    local.get 0
    i32.load offset=8
    local.set 3
    block  ;; label = @1
      local.get 1
      i64.eqz
      br_if 0 (;@1;)
      local.get 1
      local.get 3
      local.get 2
      i32.sub
      i64.extend_i32_s
      i64.ge_s
      br_if 0 (;@1;)
      local.get 2
      local.get 1
      i32.wrap_i64
      i32.add
      local.set 3
    end
    local.get 0
    local.get 3
    i32.store offset=112)
  (func $__shgetc (type 10) (param i32) (result i32)
    (local i32 i32 i64 i64 i32)
    local.get 0
    i64.load offset=128
    local.get 0
    i32.load offset=4
    local.tee 1
    local.get 0
    i32.load offset=44
    local.tee 2
    i32.sub
    i64.extend_i32_s
    i64.add
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i64.load offset=120
          local.tee 4
          i64.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 4
          i64.ge_s
          br_if 1 (;@2;)
        end
        local.get 0
        call $__uflow
        local.tee 2
        i32.const -1
        i32.gt_s
        br_if 1 (;@1;)
        local.get 0
        i32.load offset=4
        local.set 1
        local.get 0
        i32.load offset=44
        local.set 2
      end
      local.get 0
      i64.const -1
      i64.store offset=120
      local.get 0
      local.get 1
      i32.store offset=112
      local.get 0
      local.get 3
      local.get 2
      local.get 1
      i32.sub
      i64.extend_i32_s
      i64.add
      i64.store offset=128
      i32.const -1
      return
    end
    local.get 3
    i64.const 1
    i64.add
    local.set 3
    local.get 0
    i32.load offset=4
    local.set 1
    local.get 0
    i32.load offset=8
    local.set 5
    block  ;; label = @1
      local.get 0
      i64.load offset=120
      local.tee 4
      i64.const 0
      i64.eq
      br_if 0 (;@1;)
      local.get 4
      local.get 3
      i64.sub
      local.tee 4
      local.get 5
      local.get 1
      i32.sub
      i64.extend_i32_s
      i64.ge_s
      br_if 0 (;@1;)
      local.get 1
      local.get 4
      i32.wrap_i64
      i32.add
      local.set 5
    end
    local.get 0
    local.get 5
    i32.store offset=112
    local.get 0
    local.get 3
    local.get 0
    i32.load offset=44
    local.tee 5
    local.get 1
    i32.sub
    i64.extend_i32_s
    i64.add
    i64.store offset=128
    block  ;; label = @1
      local.get 1
      local.get 5
      i32.gt_u
      br_if 0 (;@1;)
      local.get 1
      i32.const -1
      i32.add
      local.get 2
      i32.store8
    end
    local.get 2)
  (func $__intscan (type 25) (param i32 i32 i32 i64) (result i64)
    (local i32 i32 i32 i64 i64 i64 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.const 36
              i32.gt_u
              br_if 0 (;@5;)
              local.get 1
              i32.const 1
              i32.eq
              br_if 0 (;@5;)
              block  ;; label = @6
                block  ;; label = @7
                  loop  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 0
                        i32.load offset=4
                        local.tee 5
                        local.get 0
                        i32.load offset=112
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 0
                        local.get 5
                        i32.const 1
                        i32.add
                        i32.store offset=4
                        local.get 5
                        i32.load8_u
                        local.set 5
                        br 1 (;@9;)
                      end
                      local.get 0
                      call $__shgetc
                      local.set 5
                    end
                    local.get 5
                    i32.const -9
                    i32.add
                    i32.const 5
                    i32.lt_u
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      local.get 5
                      i32.const -32
                      i32.add
                      br_table 1 (;@8;) 2 (;@7;) 2 (;@7;) 2 (;@7;) 2 (;@7;) 2 (;@7;) 2 (;@7;) 2 (;@7;) 2 (;@7;) 2 (;@7;) 2 (;@7;) 0 (;@9;) 2 (;@7;) 0 (;@9;) 2 (;@7;)
                    end
                  end
                  i32.const -1
                  i32.const 0
                  local.get 5
                  i32.const 45
                  i32.eq
                  select
                  local.set 6
                  block  ;; label = @8
                    local.get 0
                    i32.load offset=4
                    local.tee 5
                    local.get 0
                    i32.load offset=112
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 0
                    local.get 5
                    i32.const 1
                    i32.add
                    i32.store offset=4
                    local.get 5
                    i32.load8_u
                    local.set 5
                    br 2 (;@6;)
                  end
                  local.get 0
                  call $__shgetc
                  local.set 5
                  br 1 (;@6;)
                end
                i32.const 0
                local.set 6
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  i32.const 0
                  i32.ne
                  local.get 1
                  i32.const 16
                  i32.ne
                  i32.and
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 48
                  i32.ne
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i32.load offset=4
                      local.tee 5
                      local.get 0
                      i32.load offset=112
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 0
                      local.get 5
                      i32.const 1
                      i32.add
                      i32.store offset=4
                      local.get 5
                      i32.load8_u
                      local.set 5
                      br 1 (;@8;)
                    end
                    local.get 0
                    call $__shgetc
                    local.set 5
                  end
                  block  ;; label = @8
                    local.get 5
                    i32.const -33
                    i32.and
                    i32.const 88
                    i32.ne
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 0
                        i32.load offset=4
                        local.tee 5
                        local.get 0
                        i32.load offset=112
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 0
                        local.get 5
                        i32.const 1
                        i32.add
                        i32.store offset=4
                        local.get 5
                        i32.load8_u
                        local.set 5
                        br 1 (;@9;)
                      end
                      local.get 0
                      call $__shgetc
                      local.set 5
                    end
                    i32.const 16
                    local.set 1
                    local.get 5
                    i32.const 4385
                    i32.add
                    i32.load8_u
                    i32.const 16
                    i32.lt_u
                    br_if 4 (;@4;)
                    i64.const 0
                    local.set 3
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 0
                        i64.load offset=120
                        i64.const 0
                        i64.lt_s
                        br_if 0 (;@10;)
                        local.get 0
                        local.get 0
                        i32.load offset=4
                        local.tee 5
                        i32.const -1
                        i32.add
                        i32.store offset=4
                        local.get 2
                        i32.eqz
                        br_if 1 (;@9;)
                        local.get 0
                        local.get 5
                        i32.const -2
                        i32.add
                        i32.store offset=4
                        br 9 (;@1;)
                      end
                      local.get 2
                      br_if 8 (;@1;)
                    end
                    i64.const 0
                    local.set 3
                    local.get 0
                    i64.const 0
                    call $__shlim
                    br 7 (;@1;)
                  end
                  local.get 1
                  br_if 1 (;@6;)
                  i32.const 8
                  local.set 1
                  br 3 (;@4;)
                end
                local.get 1
                i32.const 10
                local.get 1
                select
                local.tee 1
                local.get 5
                i32.const 4385
                i32.add
                i32.load8_u
                i32.gt_u
                br_if 0 (;@6;)
                i64.const 0
                local.set 3
                block  ;; label = @7
                  local.get 0
                  i64.load offset=120
                  i64.const 0
                  i64.lt_s
                  br_if 0 (;@7;)
                  local.get 0
                  local.get 0
                  i32.load offset=4
                  i32.const -1
                  i32.add
                  i32.store offset=4
                end
                local.get 0
                i64.const 0
                call $__shlim
                call $__errno_location
                i32.const 22
                i32.store
                br 5 (;@1;)
              end
              local.get 1
              i32.const 10
              i32.ne
              br_if 1 (;@4;)
              i64.const 0
              local.set 7
              block  ;; label = @6
                local.get 5
                i32.const -48
                i32.add
                local.tee 2
                i32.const 9
                i32.gt_u
                br_if 0 (;@6;)
                i32.const 0
                local.set 5
                loop  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i32.load offset=4
                      local.tee 1
                      local.get 0
                      i32.load offset=112
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 0
                      local.get 1
                      i32.const 1
                      i32.add
                      i32.store offset=4
                      local.get 1
                      i32.load8_u
                      local.set 1
                      br 1 (;@8;)
                    end
                    local.get 0
                    call $__shgetc
                    local.set 1
                  end
                  local.get 5
                  i32.const 10
                  i32.mul
                  local.get 2
                  i32.add
                  local.set 5
                  block  ;; label = @8
                    local.get 1
                    i32.const -48
                    i32.add
                    local.tee 2
                    i32.const 9
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 429496729
                    i32.lt_u
                    br_if 1 (;@7;)
                  end
                end
                local.get 5
                i64.extend_i32_u
                local.set 7
              end
              local.get 2
              i32.const 9
              i32.gt_u
              br_if 3 (;@2;)
              local.get 7
              i64.const 10
              i64.mul
              local.set 8
              local.get 2
              i64.extend_i32_u
              local.set 9
              loop  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.load offset=4
                    local.tee 5
                    local.get 0
                    i32.load offset=112
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 0
                    local.get 5
                    i32.const 1
                    i32.add
                    i32.store offset=4
                    local.get 5
                    i32.load8_u
                    local.set 5
                    br 1 (;@7;)
                  end
                  local.get 0
                  call $__shgetc
                  local.set 5
                end
                local.get 8
                local.get 9
                i64.add
                local.set 7
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 5
                    i32.const -48
                    i32.add
                    local.tee 1
                    i32.const 9
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 7
                    i64.const 1844674407370955162
                    i64.lt_u
                    br_if 1 (;@7;)
                  end
                  local.get 1
                  i32.const 9
                  i32.gt_u
                  br_if 5 (;@2;)
                  i32.const 10
                  local.set 1
                  br 4 (;@3;)
                end
                local.get 7
                i64.const 10
                i64.mul
                local.tee 8
                local.get 1
                i64.extend_i32_u
                local.tee 9
                i64.const -1
                i64.xor
                i64.le_u
                br_if 0 (;@6;)
              end
              i32.const 10
              local.set 1
              br 2 (;@3;)
            end
            call $__errno_location
            i32.const 22
            i32.store
            i64.const 0
            local.set 3
            br 3 (;@1;)
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              local.get 1
              i32.const -1
              i32.add
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              local.get 5
              i32.const 4385
              i32.add
              i32.load8_u
              local.tee 10
              i32.gt_u
              br_if 1 (;@4;)
              i64.const 0
              local.set 7
              br 2 (;@3;)
            end
            block  ;; label = @5
              local.get 1
              local.get 5
              i32.const 4385
              i32.add
              i32.load8_u
              local.tee 2
              i32.gt_u
              br_if 0 (;@5;)
              i64.const 0
              local.set 7
              br 2 (;@3;)
            end
            local.get 1
            i32.const 23
            i32.mul
            i32.const 5
            i32.shr_u
            i32.const 7
            i32.and
            i32.load8_s offset=4641
            local.set 11
            i32.const 0
            local.set 10
            loop  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.load offset=4
                  local.tee 5
                  local.get 0
                  i32.load offset=112
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 0
                  local.get 5
                  i32.const 1
                  i32.add
                  i32.store offset=4
                  local.get 5
                  i32.load8_u
                  local.set 5
                  br 1 (;@6;)
                end
                local.get 0
                call $__shgetc
                local.set 5
              end
              local.get 2
              local.get 10
              local.get 11
              i32.shl
              local.tee 12
              i32.or
              local.set 10
              block  ;; label = @6
                local.get 1
                local.get 5
                i32.const 4385
                i32.add
                i32.load8_u
                local.tee 2
                i32.le_u
                local.tee 13
                br_if 0 (;@6;)
                local.get 12
                i32.const 134217728
                i32.lt_u
                br_if 1 (;@5;)
              end
            end
            local.get 10
            i64.extend_i32_u
            local.set 7
            local.get 13
            br_if 1 (;@3;)
            i64.const -1
            local.get 11
            i64.extend_i32_u
            local.tee 9
            i64.shr_u
            local.tee 14
            local.get 7
            i64.lt_u
            br_if 1 (;@3;)
            loop  ;; label = @5
              local.get 2
              i64.extend_i32_u
              i64.const 255
              i64.and
              local.set 8
              block  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.load offset=4
                  local.tee 5
                  local.get 0
                  i32.load offset=112
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 0
                  local.get 5
                  i32.const 1
                  i32.add
                  i32.store offset=4
                  local.get 5
                  i32.load8_u
                  local.set 5
                  br 1 (;@6;)
                end
                local.get 0
                call $__shgetc
                local.set 5
              end
              local.get 7
              local.get 9
              i64.shl
              local.get 8
              i64.or
              local.set 7
              local.get 1
              local.get 5
              i32.const 4385
              i32.add
              i32.load8_u
              local.tee 2
              i32.le_u
              br_if 2 (;@3;)
              local.get 7
              local.get 14
              i64.le_u
              br_if 0 (;@5;)
              br 2 (;@3;)
            end
          end
          i32.const 0
          local.set 2
          loop  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load offset=4
                local.tee 5
                local.get 0
                i32.load offset=112
                i32.eq
                br_if 0 (;@6;)
                local.get 0
                local.get 5
                i32.const 1
                i32.add
                i32.store offset=4
                local.get 5
                i32.load8_u
                local.set 5
                br 1 (;@5;)
              end
              local.get 0
              call $__shgetc
              local.set 5
            end
            local.get 10
            local.get 2
            local.get 1
            i32.mul
            i32.add
            local.set 2
            block  ;; label = @5
              local.get 1
              local.get 5
              i32.const 4385
              i32.add
              i32.load8_u
              local.tee 10
              i32.le_u
              local.tee 12
              br_if 0 (;@5;)
              local.get 2
              i32.const 119304647
              i32.lt_u
              br_if 1 (;@4;)
            end
          end
          local.get 2
          i64.extend_i32_u
          local.set 7
          local.get 12
          br_if 0 (;@3;)
          local.get 1
          i64.extend_i32_u
          local.set 8
          loop  ;; label = @4
            local.get 7
            local.get 8
            i64.mul
            local.tee 9
            local.get 10
            i64.extend_i32_u
            i64.const 255
            i64.and
            local.tee 14
            i64.const -1
            i64.xor
            i64.gt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load offset=4
                local.tee 5
                local.get 0
                i32.load offset=112
                i32.eq
                br_if 0 (;@6;)
                local.get 0
                local.get 5
                i32.const 1
                i32.add
                i32.store offset=4
                local.get 5
                i32.load8_u
                local.set 5
                br 1 (;@5;)
              end
              local.get 0
              call $__shgetc
              local.set 5
            end
            local.get 9
            local.get 14
            i64.add
            local.set 7
            local.get 1
            local.get 5
            i32.const 4385
            i32.add
            i32.load8_u
            local.tee 10
            i32.le_u
            br_if 1 (;@3;)
            local.get 4
            local.get 8
            i64.const 0
            local.get 7
            i64.const 0
            call $__multi3
            local.get 4
            i64.load offset=8
            i64.const 0
            i64.eq
            br_if 0 (;@4;)
          end
        end
        local.get 1
        local.get 5
        i32.const 4385
        i32.add
        i32.load8_u
        i32.le_u
        br_if 0 (;@2;)
        loop  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load offset=4
              local.tee 5
              local.get 0
              i32.load offset=112
              i32.eq
              br_if 0 (;@5;)
              local.get 0
              local.get 5
              i32.const 1
              i32.add
              i32.store offset=4
              local.get 5
              i32.load8_u
              local.set 5
              br 1 (;@4;)
            end
            local.get 0
            call $__shgetc
            local.set 5
          end
          local.get 1
          local.get 5
          i32.const 4385
          i32.add
          i32.load8_u
          i32.gt_u
          br_if 0 (;@3;)
        end
        call $__errno_location
        i32.const 34
        i32.store
        local.get 6
        i32.const 0
        local.get 3
        i64.const 1
        i64.and
        i64.eqz
        select
        local.set 6
        local.get 3
        local.set 7
      end
      block  ;; label = @2
        local.get 0
        i64.load offset=120
        i64.const 0
        i64.lt_s
        br_if 0 (;@2;)
        local.get 0
        local.get 0
        i32.load offset=4
        i32.const -1
        i32.add
        i32.store offset=4
      end
      block  ;; label = @2
        local.get 7
        local.get 3
        i64.lt_u
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 3
          i32.wrap_i64
          i32.const 1
          i32.and
          br_if 0 (;@3;)
          local.get 6
          br_if 0 (;@3;)
          call $__errno_location
          i32.const 34
          i32.store
          local.get 3
          i64.const -1
          i64.add
          local.set 3
          br 2 (;@1;)
        end
        local.get 7
        local.get 3
        i64.le_u
        br_if 0 (;@2;)
        call $__errno_location
        i32.const 34
        i32.store
        br 1 (;@1;)
      end
      local.get 7
      local.get 6
      i64.extend_i32_s
      local.tee 3
      i64.xor
      local.get 3
      i64.sub
      local.set 3
    end
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $strtoull (type 7) (param i32 i32 i32) (result i64)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 160
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=52
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 3
    i32.const -1
    i32.store offset=16
    local.get 3
    i32.const 8
    i32.add
    i64.const 0
    call $__shlim
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    i32.const 1
    i64.const -1
    call $__intscan
    local.set 4
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      local.get 3
      i32.load offset=12
      local.get 3
      i32.load offset=52
      i32.sub
      i32.add
      local.get 3
      i32.load offset=136
      i32.add
      i32.store
    end
    local.get 3
    i32.const 160
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $memcpy (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.load8_u
        i32.store8
        local.get 2
        i32.const -1
        i32.add
        local.set 3
        local.get 0
        i32.const 1
        i32.add
        local.set 4
        local.get 1
        i32.const 1
        i32.add
        local.tee 5
        i32.const 3
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 3
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 2
        i32.const -2
        i32.add
        local.set 3
        local.get 0
        i32.const 2
        i32.add
        local.set 4
        local.get 1
        i32.const 2
        i32.add
        local.tee 5
        i32.const 3
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 3
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get 2
        i32.const -3
        i32.add
        local.set 3
        local.get 0
        i32.const 3
        i32.add
        local.set 4
        local.get 1
        i32.const 3
        i32.add
        local.tee 5
        i32.const 3
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 3
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get 2
        i32.const -4
        i32.add
        local.set 3
        local.get 0
        i32.const 4
        i32.add
        local.set 4
        local.get 1
        i32.const 4
        i32.add
        local.set 5
        br 1 (;@1;)
      end
      local.get 2
      local.set 3
      local.get 0
      local.set 4
      local.get 1
      local.set 5
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.const 3
          i32.and
          local.tee 2
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              i32.const 16
              i32.ge_u
              br_if 0 (;@5;)
              local.get 3
              local.set 1
              br 1 (;@4;)
            end
            block  ;; label = @5
              local.get 3
              i32.const -16
              i32.add
              local.tee 1
              i32.const 16
              i32.and
              br_if 0 (;@5;)
              local.get 4
              local.get 5
              i64.load align=4
              i64.store align=4
              local.get 4
              local.get 5
              i64.load offset=8 align=4
              i64.store offset=8 align=4
              local.get 4
              i32.const 16
              i32.add
              local.set 4
              local.get 5
              i32.const 16
              i32.add
              local.set 5
              local.get 1
              local.set 3
            end
            local.get 1
            i32.const 16
            i32.lt_u
            br_if 0 (;@4;)
            local.get 3
            local.set 1
            loop  ;; label = @5
              local.get 4
              local.get 5
              i64.load align=4
              i64.store align=4
              local.get 4
              i32.const 8
              i32.add
              local.get 5
              i32.const 8
              i32.add
              i64.load align=4
              i64.store align=4
              local.get 4
              i32.const 16
              i32.add
              local.get 5
              i32.const 16
              i32.add
              i64.load align=4
              i64.store align=4
              local.get 4
              i32.const 24
              i32.add
              local.get 5
              i32.const 24
              i32.add
              i64.load align=4
              i64.store align=4
              local.get 4
              i32.const 32
              i32.add
              local.set 4
              local.get 5
              i32.const 32
              i32.add
              local.set 5
              local.get 1
              i32.const -32
              i32.add
              local.tee 1
              i32.const 15
              i32.gt_u
              br_if 0 (;@5;)
            end
          end
          block  ;; label = @4
            local.get 1
            i32.const 8
            i32.lt_u
            br_if 0 (;@4;)
            local.get 4
            local.get 5
            i64.load align=4
            i64.store align=4
            local.get 5
            i32.const 8
            i32.add
            local.set 5
            local.get 4
            i32.const 8
            i32.add
            local.set 4
          end
          block  ;; label = @4
            local.get 1
            i32.const 4
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            local.get 5
            i32.load
            i32.store
            local.get 5
            i32.const 4
            i32.add
            local.set 5
            local.get 4
            i32.const 4
            i32.add
            local.set 4
          end
          block  ;; label = @4
            local.get 1
            i32.const 2
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            local.get 5
            i32.load16_u align=1
            i32.store16 align=1
            local.get 4
            i32.const 2
            i32.add
            local.set 4
            local.get 5
            i32.const 2
            i32.add
            local.set 5
          end
          local.get 1
          i32.const 1
          i32.and
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 3
          i32.const 32
          i32.lt_u
          br_if 0 (;@3;)
          local.get 5
          i32.load
          local.set 1
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                i32.const -1
                i32.add
                br_table 0 (;@6;) 1 (;@5;) 2 (;@4;) 0 (;@6;)
              end
              local.get 4
              local.get 1
              i32.store8
              local.get 4
              local.get 1
              i32.const 16
              i32.shr_u
              i32.store8 offset=2
              local.get 4
              local.get 1
              i32.const 8
              i32.shr_u
              i32.store8 offset=1
              local.get 4
              i32.const 3
              i32.add
              local.set 6
              local.get 3
              i32.const -3
              i32.add
              local.set 3
              i32.const 0
              local.set 2
              loop  ;; label = @6
                local.get 6
                local.get 2
                i32.add
                local.tee 4
                local.get 5
                local.get 2
                i32.add
                local.tee 7
                i32.const 4
                i32.add
                i32.load
                local.tee 8
                i32.const 8
                i32.shl
                local.get 1
                i32.const 24
                i32.shr_u
                i32.or
                i32.store
                local.get 4
                i32.const 4
                i32.add
                local.get 7
                i32.const 8
                i32.add
                i32.load
                local.tee 1
                i32.const 8
                i32.shl
                local.get 8
                i32.const 24
                i32.shr_u
                i32.or
                i32.store
                local.get 4
                i32.const 8
                i32.add
                local.get 7
                i32.const 12
                i32.add
                i32.load
                local.tee 8
                i32.const 8
                i32.shl
                local.get 1
                i32.const 24
                i32.shr_u
                i32.or
                i32.store
                local.get 4
                i32.const 12
                i32.add
                local.get 7
                i32.const 16
                i32.add
                i32.load
                local.tee 1
                i32.const 8
                i32.shl
                local.get 8
                i32.const 24
                i32.shr_u
                i32.or
                i32.store
                local.get 2
                i32.const 16
                i32.add
                local.set 2
                local.get 3
                i32.const -16
                i32.add
                local.tee 3
                i32.const 16
                i32.gt_u
                br_if 0 (;@6;)
              end
              local.get 6
              local.get 2
              i32.add
              local.set 4
              local.get 5
              local.get 2
              i32.add
              i32.const 3
              i32.add
              local.set 5
              br 2 (;@3;)
            end
            local.get 4
            local.get 1
            i32.store16 align=1
            local.get 4
            i32.const 2
            i32.add
            local.set 6
            local.get 3
            i32.const -2
            i32.add
            local.set 3
            i32.const 0
            local.set 2
            loop  ;; label = @5
              local.get 6
              local.get 2
              i32.add
              local.tee 4
              local.get 5
              local.get 2
              i32.add
              local.tee 7
              i32.const 4
              i32.add
              i32.load
              local.tee 8
              i32.const 16
              i32.shl
              local.get 1
              i32.const 16
              i32.shr_u
              i32.or
              i32.store
              local.get 4
              i32.const 4
              i32.add
              local.get 7
              i32.const 8
              i32.add
              i32.load
              local.tee 1
              i32.const 16
              i32.shl
              local.get 8
              i32.const 16
              i32.shr_u
              i32.or
              i32.store
              local.get 4
              i32.const 8
              i32.add
              local.get 7
              i32.const 12
              i32.add
              i32.load
              local.tee 8
              i32.const 16
              i32.shl
              local.get 1
              i32.const 16
              i32.shr_u
              i32.or
              i32.store
              local.get 4
              i32.const 12
              i32.add
              local.get 7
              i32.const 16
              i32.add
              i32.load
              local.tee 1
              i32.const 16
              i32.shl
              local.get 8
              i32.const 16
              i32.shr_u
              i32.or
              i32.store
              local.get 2
              i32.const 16
              i32.add
              local.set 2
              local.get 3
              i32.const -16
              i32.add
              local.tee 3
              i32.const 17
              i32.gt_u
              br_if 0 (;@5;)
            end
            local.get 6
            local.get 2
            i32.add
            local.set 4
            local.get 5
            local.get 2
            i32.add
            i32.const 2
            i32.add
            local.set 5
            br 1 (;@3;)
          end
          local.get 4
          local.get 1
          i32.store8
          local.get 4
          i32.const 1
          i32.add
          local.set 6
          local.get 3
          i32.const -1
          i32.add
          local.set 3
          i32.const 0
          local.set 2
          loop  ;; label = @4
            local.get 6
            local.get 2
            i32.add
            local.tee 4
            local.get 5
            local.get 2
            i32.add
            local.tee 7
            i32.const 4
            i32.add
            i32.load
            local.tee 8
            i32.const 24
            i32.shl
            local.get 1
            i32.const 8
            i32.shr_u
            i32.or
            i32.store
            local.get 4
            i32.const 4
            i32.add
            local.get 7
            i32.const 8
            i32.add
            i32.load
            local.tee 1
            i32.const 24
            i32.shl
            local.get 8
            i32.const 8
            i32.shr_u
            i32.or
            i32.store
            local.get 4
            i32.const 8
            i32.add
            local.get 7
            i32.const 12
            i32.add
            i32.load
            local.tee 8
            i32.const 24
            i32.shl
            local.get 1
            i32.const 8
            i32.shr_u
            i32.or
            i32.store
            local.get 4
            i32.const 12
            i32.add
            local.get 7
            i32.const 16
            i32.add
            i32.load
            local.tee 1
            i32.const 24
            i32.shl
            local.get 8
            i32.const 8
            i32.shr_u
            i32.or
            i32.store
            local.get 2
            i32.const 16
            i32.add
            local.set 2
            local.get 3
            i32.const -16
            i32.add
            local.tee 3
            i32.const 18
            i32.gt_u
            br_if 0 (;@4;)
          end
          local.get 6
          local.get 2
          i32.add
          local.set 4
          local.get 5
          local.get 2
          i32.add
          i32.const 1
          i32.add
          local.set 5
        end
        block  ;; label = @3
          local.get 3
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i32.load8_u
          i32.store8
          local.get 4
          local.get 5
          i32.load offset=1 align=1
          i32.store offset=1 align=1
          local.get 4
          local.get 5
          i64.load offset=5 align=1
          i64.store offset=5 align=1
          local.get 4
          local.get 5
          i32.load16_u offset=13 align=1
          i32.store16 offset=13 align=1
          local.get 4
          local.get 5
          i32.load8_u offset=15
          i32.store8 offset=15
          local.get 4
          i32.const 16
          i32.add
          local.set 4
          local.get 5
          i32.const 16
          i32.add
          local.set 5
        end
        block  ;; label = @3
          local.get 3
          i32.const 8
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i64.load align=1
          i64.store align=1
          local.get 4
          i32.const 8
          i32.add
          local.set 4
          local.get 5
          i32.const 8
          i32.add
          local.set 5
        end
        block  ;; label = @3
          local.get 3
          i32.const 4
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i32.load align=1
          i32.store align=1
          local.get 4
          i32.const 4
          i32.add
          local.set 4
          local.get 5
          i32.const 4
          i32.add
          local.set 5
        end
        block  ;; label = @3
          local.get 3
          i32.const 2
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i32.load16_u align=1
          i32.store16 align=1
          local.get 4
          i32.const 2
          i32.add
          local.set 4
          local.get 5
          i32.const 2
          i32.add
          local.set 5
        end
        local.get 3
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 4
      local.get 5
      i32.load8_u
      i32.store8
    end
    local.get 0)
  (func $memset (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i64)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8
      local.get 0
      local.get 2
      i32.add
      local.tee 3
      i32.const -1
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=2
      local.get 0
      local.get 1
      i32.store8 offset=1
      local.get 3
      i32.const -3
      i32.add
      local.get 1
      i32.store8
      local.get 3
      i32.const -2
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=3
      local.get 3
      i32.const -4
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 4
      i32.add
      local.tee 3
      local.get 1
      i32.const 255
      i32.and
      i32.const 16843009
      i32.mul
      local.tee 1
      i32.store
      local.get 3
      local.get 2
      local.get 4
      i32.sub
      i32.const -4
      i32.and
      local.tee 4
      i32.add
      local.tee 2
      i32.const -4
      i32.add
      local.get 1
      i32.store
      local.get 4
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.store offset=8
      local.get 3
      local.get 1
      i32.store offset=4
      local.get 2
      i32.const -8
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -12
      i32.add
      local.get 1
      i32.store
      local.get 4
      i32.const 25
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.store offset=24
      local.get 3
      local.get 1
      i32.store offset=20
      local.get 3
      local.get 1
      i32.store offset=16
      local.get 3
      local.get 1
      i32.store offset=12
      local.get 2
      i32.const -16
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -20
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -24
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -28
      i32.add
      local.get 1
      i32.store
      local.get 4
      local.get 3
      i32.const 4
      i32.and
      i32.const 24
      i32.or
      local.tee 5
      i32.sub
      local.tee 2
      i32.const 32
      i32.lt_u
      br_if 0 (;@1;)
      local.get 1
      i64.extend_i32_u
      i64.const 4294967297
      i64.mul
      local.set 6
      local.get 3
      local.get 5
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 1
        local.get 6
        i64.store
        local.get 1
        i32.const 24
        i32.add
        local.get 6
        i64.store
        local.get 1
        i32.const 16
        i32.add
        local.get 6
        i64.store
        local.get 1
        i32.const 8
        i32.add
        local.get 6
        i64.store
        local.get 1
        i32.const 32
        i32.add
        local.set 1
        local.get 2
        i32.const -32
        i32.add
        local.tee 2
        i32.const 31
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $__strchrnul (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 255
            i32.and
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.const 3
            i32.and
            i32.eqz
            br_if 2 (;@2;)
            block  ;; label = @5
              local.get 0
              i32.load8_u
              local.tee 3
              br_if 0 (;@5;)
              local.get 0
              return
            end
            local.get 3
            local.get 1
            i32.const 255
            i32.and
            i32.ne
            br_if 1 (;@3;)
            local.get 0
            return
          end
          local.get 0
          local.get 0
          call $strlen
          i32.add
          return
        end
        block  ;; label = @3
          local.get 0
          i32.const 1
          i32.add
          local.tee 3
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.set 0
          br 1 (;@2;)
        end
        local.get 3
        i32.load8_u
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 0
          i32.const 2
          i32.add
          local.tee 3
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.set 0
          br 1 (;@2;)
        end
        local.get 3
        i32.load8_u
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 0
          i32.const 3
          i32.add
          local.tee 3
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.set 0
          br 1 (;@2;)
        end
        local.get 3
        i32.load8_u
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        br_if 1 (;@1;)
        local.get 0
        i32.const 4
        i32.add
        local.set 0
      end
      block  ;; label = @2
        i32.const 16843008
        local.get 0
        i32.load
        local.tee 3
        i32.sub
        local.get 3
        i32.or
        i32.const -2139062144
        i32.and
        i32.const -2139062144
        i32.ne
        br_if 0 (;@2;)
        local.get 2
        i32.const 16843009
        i32.mul
        local.set 2
        loop  ;; label = @3
          i32.const 16843008
          local.get 3
          local.get 2
          i32.xor
          local.tee 3
          i32.sub
          local.get 3
          i32.or
          i32.const -2139062144
          i32.and
          i32.const -2139062144
          i32.ne
          br_if 1 (;@2;)
          i32.const 16843008
          local.get 0
          i32.const 4
          i32.add
          local.tee 0
          i32.load
          local.tee 3
          i32.sub
          local.get 3
          i32.or
          i32.const -2139062144
          i32.and
          i32.const -2139062144
          i32.eq
          br_if 0 (;@3;)
        end
      end
      local.get 0
      i32.const -1
      i32.add
      local.set 3
      loop  ;; label = @2
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        i32.load8_u
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 1
        i32.const 255
        i32.and
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 3)
  (func $strdup (type 10) (param i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      call $strlen
      i32.const 1
      i32.add
      local.tee 1
      call $default_malloc
      local.tee 2
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    local.get 2
    local.get 0
    local.get 1
    call $memcpy)
  (func $strlen (type 10) (param i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 0
          i32.load8_u
          br_if 0 (;@3;)
          local.get 0
          local.get 0
          i32.sub
          return
        end
        local.get 0
        i32.const 1
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 2
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 3
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 4
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        br_if 1 (;@1;)
      end
      local.get 1
      i32.const -4
      i32.add
      local.set 2
      local.get 1
      i32.const -5
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 1
        i32.const 4
        i32.add
        local.set 1
        i32.const 16843008
        local.get 2
        i32.const 4
        i32.add
        local.tee 2
        i32.load
        local.tee 3
        i32.sub
        local.get 3
        i32.or
        i32.const -2139062144
        i32.and
        i32.const -2139062144
        i32.eq
        br_if 0 (;@2;)
      end
      loop  ;; label = @2
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        i32.load8_u
        local.set 3
        local.get 2
        i32.const 1
        i32.add
        local.set 2
        local.get 3
        br_if 0 (;@2;)
      end
    end
    local.get 1
    local.get 0
    i32.sub)
  (func $strncmp (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 2
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u
        local.tee 3
        br_if 0 (;@2;)
        i32.const 0
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      i32.const 1
      i32.add
      local.set 0
      local.get 2
      i32.const -1
      i32.add
      local.set 2
      block  ;; label = @2
        loop  ;; label = @3
          local.get 3
          i32.const 255
          i32.and
          local.get 1
          i32.load8_u
          local.tee 4
          i32.ne
          br_if 1 (;@2;)
          local.get 4
          i32.eqz
          br_if 1 (;@2;)
          local.get 2
          i32.const 0
          i32.eq
          br_if 1 (;@2;)
          local.get 2
          i32.const -1
          i32.add
          local.set 2
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 0
          i32.load8_u
          local.set 3
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 3
          br_if 0 (;@3;)
        end
        i32.const 0
        local.set 3
      end
      local.get 3
      i32.const 255
      i32.and
      local.set 3
    end
    local.get 3
    local.get 1
    i32.load8_u
    i32.sub)
  (func $memchr (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 2
    i32.const 0
    i32.ne
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.const 3
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 0
              i32.load8_u
              local.get 1
              i32.const 255
              i32.and
              i32.ne
              br_if 0 (;@5;)
              local.get 0
              local.set 4
              local.get 2
              local.set 5
              br 3 (;@2;)
            end
            local.get 2
            i32.const -1
            i32.add
            local.tee 5
            i32.const 0
            i32.ne
            local.set 3
            local.get 0
            i32.const 1
            i32.add
            local.tee 4
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.eqz
            br_if 1 (;@3;)
            local.get 4
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 2
            i32.const -2
            i32.add
            local.tee 5
            i32.const 0
            i32.ne
            local.set 3
            local.get 0
            i32.const 2
            i32.add
            local.tee 4
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.eqz
            br_if 1 (;@3;)
            local.get 4
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 2
            i32.const -3
            i32.add
            local.tee 5
            i32.const 0
            i32.ne
            local.set 3
            local.get 0
            i32.const 3
            i32.add
            local.tee 4
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.eqz
            br_if 1 (;@3;)
            local.get 4
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 0
            i32.const 4
            i32.add
            local.set 4
            local.get 2
            i32.const -4
            i32.add
            local.tee 5
            i32.const 0
            i32.ne
            local.set 3
            br 1 (;@3;)
          end
          local.get 2
          local.set 5
          local.get 0
          local.set 4
        end
        local.get 3
        i32.eqz
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 4
          i32.load8_u
          local.get 1
          i32.const 255
          i32.and
          i32.eq
          br_if 0 (;@3;)
          local.get 5
          i32.const 4
          i32.lt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 255
          i32.and
          i32.const 16843009
          i32.mul
          local.set 0
          loop  ;; label = @4
            i32.const 16843008
            local.get 4
            i32.load
            local.get 0
            i32.xor
            local.tee 2
            i32.sub
            local.get 2
            i32.or
            i32.const -2139062144
            i32.and
            i32.const -2139062144
            i32.ne
            br_if 2 (;@2;)
            local.get 4
            i32.const 4
            i32.add
            local.set 4
            local.get 5
            i32.const -4
            i32.add
            local.tee 5
            i32.const 3
            i32.gt_u
            br_if 0 (;@4;)
          end
        end
        local.get 5
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 1
      i32.const 255
      i32.and
      local.set 2
      loop  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.load8_u
          local.get 2
          i32.ne
          br_if 0 (;@3;)
          local.get 4
          return
        end
        local.get 4
        i32.const 1
        i32.add
        local.set 4
        local.get 5
        i32.const -1
        i32.add
        local.tee 5
        br_if 0 (;@2;)
      end
    end
    i32.const 0)
  (func $strnlen (type 6) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    i32.const 0
    local.get 1
    call $memchr
    local.tee 2
    local.get 0
    i32.sub
    local.get 1
    local.get 2
    select)
  (func $__lock (type 1) (param i32)
    (local i32 i32)
    block  ;; label = @1
      i32.const 0
      i32.load8_s offset=4963
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.const -2147483647
      call $a_cas.4
      local.set 2
      block  ;; label = @2
        local.get 1
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store8 offset=4963
      end
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.const 2147483647
      i32.add
      local.get 2
      local.get 2
      i32.const 0
      i32.lt_s
      select
      local.tee 2
      local.get 2
      i32.const -2147483647
      i32.add
      call $a_cas.4
      local.tee 1
      local.get 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 2147483647
      i32.add
      local.get 1
      local.get 1
      i32.const 0
      i32.lt_s
      select
      local.tee 2
      local.get 2
      i32.const -2147483647
      i32.add
      call $a_cas.4
      local.tee 1
      local.get 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 2147483647
      i32.add
      local.get 1
      local.get 1
      i32.const 0
      i32.lt_s
      select
      local.tee 2
      local.get 2
      i32.const -2147483647
      i32.add
      call $a_cas.4
      local.tee 1
      local.get 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 2147483647
      i32.add
      local.get 1
      local.get 1
      i32.const 0
      i32.lt_s
      select
      local.tee 2
      local.get 2
      i32.const -2147483647
      i32.add
      call $a_cas.4
      local.tee 1
      local.get 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 2147483647
      i32.add
      local.get 1
      local.get 1
      i32.const 0
      i32.lt_s
      select
      local.tee 2
      local.get 2
      i32.const -2147483647
      i32.add
      call $a_cas.4
      local.tee 1
      local.get 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 2147483647
      i32.add
      local.get 1
      local.get 1
      i32.const 0
      i32.lt_s
      select
      local.tee 2
      local.get 2
      i32.const -2147483647
      i32.add
      call $a_cas.4
      local.tee 1
      local.get 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 2147483647
      i32.add
      local.get 1
      local.get 1
      i32.const 0
      i32.lt_s
      select
      local.tee 2
      local.get 2
      i32.const -2147483647
      i32.add
      call $a_cas.4
      local.tee 1
      local.get 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 2147483647
      i32.add
      local.get 1
      local.get 1
      i32.const 0
      i32.lt_s
      select
      local.tee 2
      local.get 2
      i32.const -2147483647
      i32.add
      call $a_cas.4
      local.tee 1
      local.get 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 2147483647
      i32.add
      local.get 1
      local.get 1
      i32.const 0
      i32.lt_s
      select
      local.tee 2
      local.get 2
      i32.const -2147483647
      i32.add
      call $a_cas.4
      local.tee 1
      local.get 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 2147483647
      i32.add
      local.get 1
      local.get 1
      i32.const 0
      i32.lt_s
      select
      local.tee 2
      local.get 2
      i32.const -2147483647
      i32.add
      call $a_cas.4
      local.get 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.const 1
      call $a_fetch_add
      i32.const 1
      i32.add
      local.set 1
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const -1
            i32.le_s
            br_if 0 (;@4;)
            local.get 1
            local.set 2
            br 1 (;@3;)
          end
          block  ;; label = @4
            local.get 0
            i32.const 128
            local.get 1
            i32.const 0
            i32.const 0
            i32.const 0
            call $__syscall_SYS_futex
            i64.const -38
            i64.ne
            br_if 0 (;@4;)
            local.get 0
            i32.const 0
            local.get 1
            i32.const 0
            i32.const 0
            i32.const 0
            call $__syscall_SYS_futex
            drop
          end
          local.get 1
          i32.const 2147483647
          i32.add
          local.set 2
        end
        local.get 0
        local.get 2
        local.get 2
        i32.const -2147483648
        i32.or
        call $a_cas.4
        local.tee 1
        local.get 2
        i32.ne
        br_if 0 (;@2;)
      end
    end)
  (func $a_cas.4 (type 0) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    i32.atomic.rmw.cmpxchg)
  (func $a_fetch_add (type 6) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.atomic.rmw.add)
  (func $__unlock (type 1) (param i32)
    block  ;; label = @1
      local.get 0
      i32.load
      i32.const -1
      i32.gt_s
      br_if 0 (;@1;)
      local.get 0
      i32.const 2147483647
      call $a_fetch_add
      i32.const -2147483647
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.const 129
      i32.const 1
      i32.const 0
      i32.const 0
      i32.const 0
      call $__syscall_SYS_futex
      i64.const -38
      i64.ne
      br_if 0 (;@1;)
      local.get 0
      i32.const 1
      i32.const 1
      i32.const 0
      i32.const 0
      i32.const 0
      call $__syscall_SYS_futex
      drop
    end)
  (func $__clock_gettime (type 6) (param i32 i32) (result i32)
    (local i64)
    block  ;; label = @1
      local.get 0
      local.get 1
      call $__syscall_SYS_clock_gettime
      local.tee 2
      i32.wrap_i64
      i32.const -38
      i32.ne
      br_if 0 (;@1;)
      i64.const -22
      local.set 2
      local.get 0
      br_if 0 (;@1;)
      local.get 1
      i32.const 0
      call $__syscall_SYS_gettimeofday
      drop
      local.get 1
      local.get 1
      i64.load offset=8
      i64.const 4294967296000
      i64.mul
      i64.const 32
      i64.shr_s
      i64.store offset=8
      i32.const 0
      return
    end
    local.get 2
    i64.extend32_s
    call $__syscall_ret
    i32.wrap_i64)
  (func $access (type 6) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__syscall_SYS_access
    call $__syscall_ret
    i32.wrap_i64)
  (func $close (type 10) (param i32) (result i32)
    (local i64)
    i64.const 0
    local.get 0
    call $dummy.2
    call $__syscall_SYS_close
    local.tee 1
    i64.extend32_s
    local.get 1
    i32.wrap_i64
    i32.const -4
    i32.eq
    select
    call $__syscall_ret
    i32.wrap_i64)
  (func $__lseek (type 13) (param i32 i64 i32) (result i64)
    local.get 0
    local.get 1
    local.get 2
    call $__syscall_SYS_lseek
    call $__syscall_ret)
  (func $__multi3 (type 26) (param i32 i64 i64 i64 i64)
    (local i64)
    local.get 0
    local.get 4
    local.get 1
    i64.mul
    local.get 2
    local.get 3
    i64.mul
    i64.add
    local.get 3
    i64.const 32
    i64.shr_u
    local.tee 2
    local.get 1
    i64.const 32
    i64.shr_u
    local.tee 4
    i64.mul
    i64.add
    local.get 3
    i64.const 4294967295
    i64.and
    local.tee 3
    local.get 1
    i64.const 4294967295
    i64.and
    local.tee 1
    i64.mul
    local.tee 5
    i64.const 32
    i64.shr_u
    local.get 3
    local.get 4
    i64.mul
    i64.add
    local.tee 3
    i64.const 32
    i64.shr_u
    i64.add
    local.get 3
    i64.const 4294967295
    i64.and
    local.get 2
    local.get 1
    i64.mul
    i64.add
    local.tee 1
    i64.const 32
    i64.shr_u
    i64.add
    i64.store offset=8
    local.get 0
    local.get 1
    i64.const 32
    i64.shl
    local.get 5
    i64.const 4294967295
    i64.and
    i64.or
    i64.store)
  (func $__walirt_wasm_memory_grow (type 10) (param i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    memory.grow
    return)
  (func $__walirt_wasm_memory_size (type 4) (result i32)
    memory.size
    return)
  (table (;0;) 5 5 funcref)
  (memory (;0;) 2 32768 shared)
  (global $__stack_pointer (mut i32) (i32.const 72144))
  (global $__tls_base (mut i32) (i32.const 0))
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (export "__wasm_memory_grow" (func $__walirt_wasm_memory_grow))
  (export "__wasm_memory_size" (func $__walirt_wasm_memory_size))
  (start $__wasm_init_memory)
  (elem (;0;) (i32.const 1) func $__stdio_close $__stdio_write $__stdio_seek $__stdout_write)
  (data $.tdata "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
  (data $.rodata "-+   0X0x\00-0X+0X 0X-0x+0x 0x\00nan\00inf\00NAN\00INF\00.\00(null)\00invalid arguments\0a\00round,maps,map_size,total_ns,avg_ns_per_map\0a\00%d,%d,%zu,%llu,%.2f\0a\00munmap failed at round=%d i=%d errno=%d\0a\00mmap failed at round=%d i=%d errno=%d\0a\00usage: %s <maps_per_round> <map_size_bytes> <rounds>\0a\00Support for formatting long double values is currently disabled.\0aTo enable it, remove define '__wali_printscan_enable_long_double'\0a\00\00\00\00\00\00\00\00\00\00\00\00\01\00\02\00\03\00\04\00\05\00\06\00\07\00\08\00\09\00\0a\00\0c\00\0f\00\12\00\14\00\19\00\1f\00$\00*\002\00?\00H\00T\00f\00\7f\00\92\00\aa\00\cc\00\ff\00$\01T\01\99\01\ff\01H\02\aa\022\03\ff\03\91\04T\05e\06\ff\07$\09\aa\0a\cc\0c\ff\0fH\12T\15\98\19\ff\1f\1e\1e\1e\1f\0f\0f\14\0a\0a\1f\0f\07\19\0c\06\15\0a\05\12\08\04\1f\0f\07\1c\0e\06\1c\18\14 \000\12\00\00No error information\00Illegal byte sequence\00Domain error\00Result not representable\00Not a tty\00Permission denied\00Operation not permitted\00No such file or directory\00No such process\00File exists\00Value too large for data type\00No space left on device\00Out of memory\00Resource busy\00Interrupted system call\00Resource temporarily unavailable\00Invalid seek\00Cross-device link\00Read-only file system\00Directory not empty\00Connection reset by peer\00Operation timed out\00Connection refused\00Host is down\00Host is unreachable\00Address in use\00Broken pipe\00I/O error\00No such device or address\00Block device required\00No such device\00Not a directory\00Is a directory\00Text file busy\00Exec format error\00Invalid argument\00Argument list too long\00Symbolic link loop\00Filename too long\00Too many open files in system\00No file descriptors available\00Bad file descriptor\00No child process\00Bad address\00File too large\00Too many links\00No locks available\00Resource deadlock would occur\00State not recoverable\00Previous owner died\00Operation canceled\00Function not implemented\00No message of desired type\00Identifier removed\00Device not a stream\00No data available\00Device timeout\00Out of streams resources\00Link has been severed\00Protocol error\00Bad message\00File descriptor in bad state\00Not a socket\00Destination address required\00Message too large\00Protocol wrong type for socket\00Protocol not available\00Protocol not supported\00Socket type not supported\00Not supported\00Protocol family not supported\00Address family not supported by protocol\00Address not available\00Network is down\00Network unreachable\00Connection reset by network\00Connection aborted\00No buffer space available\00Socket is connected\00Socket not connected\00Cannot send after socket shutdown\00Operation already in progress\00Operation in progress\00Stale file handle\00Remote I/O error\00Quota exceeded\00No medium found\00Wrong medium type\00Multihop attempted\00Required key not available\00Key has expired\00Key has been revoked\00Key was rejected by service\00\00\00\00\00m\00\85\00\9f\00\0d\01\0b\02\15\02\a5\02\82\02\1d\031\03%\01\f1\00[\00B\03/\02\ff\00\af\00S\01E\02T\02d\02\94\02\e1\02\ff\02Q\00s\02N\03\d9\00F\01e\01]\03\ff\01+\008\00\7f\03\cf\02l\03\da\03{\01\bc\02\00\00\f3\03\0e\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00!\045\04G\04V\04\00\00\00\00\00\00o\04\00\00\00\00\00\00\85\04\0b\07\00\00\94\04\bb\00\00\00\a0\04\00\00\00\00\00\00\00\00\00\00\00\00\15\00\00\00\00\00\00\00\bd\04\ca\04\e7\04\f9\04\18\05/\05F\05`\05n\05\8c\05\f0\01\b5\05\cb\05\db\05\ef\05\0b\06\8f\01\1e\068\06L\06a\06\00\00\a8\01\bc\01\cf\01\dc\01\83\06\a1\06\b7\06\00\00\00\00\00\00\00\00\c9\06\da\06\e9\06\f9\06\c7\03\1e\079\07I\07^\07\b3\03\9d\03\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\7f\fc\ff\ff\ff\00\00\00\00\00\00\00\00\19\00\0a\00\19\19\19\00\00\00\00\05\00\00\00\00\00\00\09\00\00\00\00\0b\00\00\00\00\00\00\00\00\19\00\11\0a\19\19\19\03\0a\07\00\01\1b\09\0b\18\00\00\09\06\0b\00\00\0b\00\06\19\00\00\00\19\19\19\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0e\00\00\00\00\00\00\00\00\19\00\0a\0d\19\19\19\00\0d\00\00\02\00\09\0e\00\00\00\09\00\0e\00\00\0e\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0c\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\00\13\00\00\00\00\09\0c\00\00\00\00\00\0c\00\00\0c\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\0f\00\00\00\04\0f\00\00\00\00\09\10\00\00\00\00\00\10\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\12\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\11\00\00\00\00\09\12\00\00\00\00\00\12\00\00\12\00\00\1a\00\00\00\1a\1a\1a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\1a\00\00\00\1a\1a\1a\00\00\00\00\00\00\09\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00\17\00\00\00\00\17\00\00\00\00\09\14\00\00\00\00\00\14\00\00\14\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00\15\00\00\00\00\15\00\00\00\00\09\16\00\00\00\00\00\16\00\00\16\00\000123456789ABCDEF\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\00\01\02\03\04\05\06\07\08\09\ff\ff\ff\ff\ff\ff\ff\0a\0b\0c\0d\0e\0f\10\11\12\13\14\15\16\17\18\19\1a\1b\1c\1d\1e\1f !\22#\ff\ff\ff\ff\ff\ff\0a\0b\0c\0d\0e\0f\10\11\12\13\14\15\16\17\18\19\1a\1b\1c\1d\1e\1f !\22#\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\00\01\02\04\07\03\06\05\00")
  (data $.data "\05\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\03\00\00\00\b4\15\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\ff\ff\ff\ff\ff\ff\ff\ff\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00\03\00\00\00\c8\15\00\00\00\04\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\ff\ff\ff\ff\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00"))
