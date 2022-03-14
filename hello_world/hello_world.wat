(module
  (import "wasi_snapshot_preview1" "fd_write" (func $fd_write (param i32 i32 i32 i32) (result i32)))

  (global $stdout i32 (i32.const 1))

  (global $nwrittenOffset i32 (i32.const 16))
  (global $iovecOffset i32 (i32.const 32))
  
  (global $iovecLength i32 (i32.const 1))

  (memory (export "memory") 1)
  ;; Initializes the WebAssembly Linear Memory with a UTF-8 string of 14 characters starting at offset 64
  (data (i32.const 64) "Hello, World!\n")

  ;; Returns the base offset and length of the greeting
  (func $hello (export "hello") (result i32 i32)
    (i32.const 64) (i32.const 14)
  )

  (func (export "_start")
    (local $offset i32)
    (local $length i32)

    ;; Multivalue returns are hard to consume directly off the stack. Move to locals to reorder as needed for WASI
    ;; Rightmost argument is on top of stack when returned, so store in reverse
    (call $hello)
    (local.set $length)
    (local.set $offset)

    ;; iovec is a struct of layout (i32, i32)
    (i32.store (global.get $iovecOffset) (local.get $offset))
    (i32.store (i32.add (global.get $iovecOffset) (i32.const 4)) (local.get $length))

    (call $fd_write
      (global.get $stdout)
      (global.get $iovecOffset)
      (global.get $iovecLength)
      (global.get $nwrittenOffset)
    )

    ;; fd_write returns return code, just drop
    drop
  )
)