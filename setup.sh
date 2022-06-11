echo "setup wasm-pack..."

if [ -z ${CC} ]; then
  # install dependencies
  echo "installing ..."

  # cargo 'add' command is a third party subcommand;
  # it is not built in to cargo: https://crates.io/crates/cargo-edit
  # cargo install cargo-edit
  # cargo add zstd

  # https://github.com/gyscos/zstd-rs/wiki/Compile-for-WASM
  rustup target add wasm32-unknown-unknown

  brew install llvm
  export PATH="/usr/local/opt/llvm/bin/:$PATH"

  # Install ??? zstd-sys: https://crates.io/crates/zstd-sys
  # git clone https://github.com/gyscos/zstd-rs --recursive
  # git submodule update --init
  #
  # ERROR: failed to run custom build command for `zstd-sys v1.6.3+zstd.1.5.2`

  export CC=/usr/local/opt/llvm/bin/clang
  export AR=/usr/local/opt/llvm/bin/llvm-ar
else
   echo "CC variable is unset"
fi
echo "executing ..."

# clean
rm -rf target
rm -rf pkg

wasm-pack build --target web

# kill previous execution
kill -9 $(lsof -ti:3000)
npx serve .

# Check http://localhost:3000
