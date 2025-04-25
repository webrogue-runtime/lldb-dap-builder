ARCH=$1 # arm64 x86_64

cmake -B build -S llvm-project/llvm \
    -DLLVM_ENABLE_PROJECTS="lldb;clang" \
    -DBUILD_SHARED_LIBS=OFF \
    -DLLVM_ENABLE_LIBXML2=OFF \
    -DLLVM_ENABLE_ZLIB=OFF \
    -DLLVM_ENABLE_ZSTD=OFF \
    -DLLVM_TARGETS_TO_BUILD= \
    -DLLDB_INCLUDE_TESTS=OFF \
    -DLLDB_ENABLE_PYTHON=OFF \
    -DLLDB_ENABLE_LIBEDIT=OFF \
    -DLLDB_ENABLE_LIBXML2=OFF \
    -DLLDB_ENABLE_LUA=OFF \
    -DLLDB_ENABLE_LZMA=OFF \
    -DLLVM_ENABLE_LIBEDIT=OFF \
    -DLLVM_ENABLE_LIBPFM=OFF \
    -DLLVM_ENABLE_PLUGINS=OFF \
    -DLLDB_ENABLE_CURSES=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_OSX_ARCHITECTURES=$ARCH

cmake --build build --target=lldb-dap
cmake --build build --target=lldb-server

rm -rf lldb-dap-macos-$ARCH
mkdir lldb-dap-macos-$ARCH
mkdir lldb-dap-macos-$ARCH/bin
mkdir lldb-dap-macos-$ARCH/lib
cp build/bin/lldb-dap build/bin/lldb-server lldb-dap-macos-$ARCH/bin
cp build/lib/liblldb*.dylib lldb-dap-macos-$ARCH/lib
rm -f lldb-dap-macos-$ARCH.tar.gz
tar czf lldb-dap-macos-$ARCH.tar.gz lldb-dap-macos-$ARCH/
