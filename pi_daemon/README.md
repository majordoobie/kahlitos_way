# Compiling
cmake -DCMAKE_BUILD_TYPE=Debug -S . -B build && cmake --build build/ 
cmake -DCMAKE_BUILD_TYPE=Debug -S . -B build && cmake --build build/ && ctest --test-dir build


# Debugging
ctest --test-dir build --stop-on-failure --output-on-failure
