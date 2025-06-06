$ErrorActionPreference = "Stop"

cmake -B build -S llvm-project/llvm -T ClangCL -DLLVM_ENABLE_PROJECTS="lldb;clang" -DBUILD_SHARED_LIBS=OFF -DLLVM_ENABLE_LIBXML2=OFF -DLLVM_ENABLE_ZLIB=OFF -DLLVM_ENABLE_ZSTD=OFF -DLLVM_TARGETS_TO_BUILD=X86 -DLLDB_INCLUDE_TESTS=OFF -DLLDB_ENABLE_PYTHON=OFF -DLLDB_ENABLE_LIBEDIT=OFF -DLLDB_ENABLE_LIBXML2=OFF -DLLDB_ENABLE_LUA=OFF -DLLDB_ENABLE_LZMA=OFF -DLLVM_ENABLE_LIBEDIT=OFF -DLLVM_ENABLE_LIBPFM=OFF -DLLVM_ENABLE_PLUGINS=OFF -DLLDB_ENABLE_CURSES=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded
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
