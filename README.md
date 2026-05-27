# exercism-wasi

[Exercism](https://exercism.org) exercises implemented in [WebAssembly Text format (WAT)](https://webassembly.github.io/spec/core/text/index.html) using [WASI](https://wasi.dev) for I/O.

## Prerequisites

- [wat2wasm](https://github.com/WebAssembly/wabt) — part of the WebAssembly Binary Toolkit (WABT)
- [wasmtime](https://wasmtime.dev) — a WebAssembly runtime

## Usage

Each exercise lives in its own directory and has a `Makefile` with three targets:

```sh
make              # compile hello_world.wat → hello_world.wasm
make run          # compile and run with wasmtime
make clean        # remove the compiled .wasm file
```

## Exercises

| Exercise | Description |
|----------|-------------|
| [hello_world](hello_world/) | Print "Hello, World!" to stdout via WASI `fd_write` |
