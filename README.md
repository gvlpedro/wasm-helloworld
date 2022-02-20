
# Resources:
https://aralroca.com/blog/first-steps-webassembly-rust
https://github.com/aralroca/helloworld-wasm-rust

## Install
cargo install wasm-pack

## Compile
rm -rf target
rm -rf pkg
wasm-pack build --target web

## Launch 
npx serve .

## Stop
Ctrl+c

kill -9 $(lsof -ti:3000)