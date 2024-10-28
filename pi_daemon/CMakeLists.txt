cmake_minimum_required(VERSION 3.29)
set(CMAKE_C_COMPILER /usr/bin/gcc)
set(CMAKE_CXX_COMPILER /usr/bin/g++)

# Generates the compile_commands.json for clangd to perform lsp operations
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(kahlito_daemon VERSION 1.0 LANGUAGES C CXX)

set(CMAKE_VERBOSE_MAKEFILE OFF)
# Add the cmake modules directory to call functions in them
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/deps")

# Set boiler settings
include(BuildUtils)
SetBoilerSettings()

add_subdirectory(deps)

option(BUILD_DSA_C_GTESTS "Build GTests for kahlito_daemon" ON)
if (BUILD_DSA_C_GTESTS)
    # If debug is enabled make sure to include CTest at the root. This will allow
    # the ctest config to be placed at the root of the build directory
    IF (CMAKE_BUILD_TYPE STREQUAL "Debug")
        include(CTest)
        add_subdirectory(tests)
    ENDIF()
ENDIF()

add_subdirectory(src)
