hello_world.wasm:
	@wat2wasm hello_world.wat

clean:
	@rm -f hello_world.wasm

run: hello_world.wasm
	@wasmtime hello_world.wasm