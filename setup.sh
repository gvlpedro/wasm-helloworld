
rm -rf target
rm -rf pkg
wasm-pack build --target web
kill -9 $(lsof -ti:3000)
npx serve .
