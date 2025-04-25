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
    -DCMAKE_BUILD_TYPE=Release

cmake --build build --target=lldb-dap -j $(nproc)

rm -rf lldb-dap-linux-x86_64
mkdir lldb-dap-linux-x86_64
mkdir lldb-dap-linux-x86_64/bin
mkdir lldb-dap-linux-x86_64/lib
cp build/bin/lldb-dap lldb-dap-linux-x86_64/bin
cp build/lib/liblldb*.so lldb-dap-linux-x86_64/lib
rm -f lldb-dap-linux-x86_64.tar.gz
tar czf lldb-dap-linux-x86_64.tar.gz lldb-dap-linux-x86_64/
