$ErrorActionPreference = "Stop"


          
cmake `
    -B build `
    -S llvm-project/llvm `
    -A x64 `
    -DCMAKE_TOOLCHAIN_FILE="$env:VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake" `
    -DVCPKG_TARGET_TRIPLET=x64-windows `
    -DLLVM_ENABLE_PROJECTS="lldb;clang" `
    -DBUILD_SHARED_LIBS=OFF `
    -DLLVM_ENABLE_LIBXML2=ON `
    -DLLVM_ENABLE_ZLIB=OFF `
    -DLLVM_ENABLE_ZSTD=OFF `
    -DLLVM_TARGETS_TO_BUILD=WebAssembly `
    -DLLDB_INCLUDE_TESTS=OFF `
    -DLLDB_ENABLE_PYTHON=OFF `
    -DLLDB_ENABLE_LIBEDIT=OFF `
    -DLLDB_ENABLE_LIBXML2=ON `
    -DLLDB_ENABLE_LUA=OFF `
    -DLLDB_ENABLE_LZMA=OFF `
    -DLLVM_ENABLE_LIBEDIT=OFF `
    -DLLVM_ENABLE_LIBPFM=OFF `
    -DLLVM_ENABLE_PLUGINS=OFF `
    -DLLDB_ENABLE_CURSES=OFF `
    -DCMAKE_BUILD_TYPE=Release 

if(!($LastExitCode -eq 0)) {
    exit $LastExitCode
}

cmake --build build --target lldb-dap --config Release --parallel
if(!($LastExitCode -eq 0)) {
    exit $LastExitCode
}

cmake --build build --target lldb-server --config Release --parallel
if(!($LastExitCode -eq 0)) {
    exit $LastExitCode
}
