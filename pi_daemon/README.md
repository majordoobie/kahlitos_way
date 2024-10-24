cmake -DCMAKE_BUILD_TYPE=Debug -S . -B build
ctest --test-dir build
