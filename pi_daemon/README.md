cmake -DCMAKE_BUILD_TYPE=Debug -S . -B build && cmake --build build/ 
cmake -DCMAKE_BUILD_TYPE=Debug -S . -B build && cmake --build build/ && ctest --test-dir build
