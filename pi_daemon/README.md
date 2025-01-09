# Compiling
cmake -DCMAKE_BUILD_TYPE=Debug -S . -B build && cmake --build build/ 
cmake -DCMAKE_BUILD_TYPE=Debug -S . -B build && cmake --build build/ && ctest --test-dir build


# Debugging
ctest --test-dir build --stop-on-failure --output-on-failure

# Debug Server
lldb-server platform --verbose --server --listen "*:4444" --gdbserver-port 4445
