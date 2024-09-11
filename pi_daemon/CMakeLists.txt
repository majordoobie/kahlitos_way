cmake_minimum_required(VERSION 3.30)
set(CMAKE_C_COMPILER /usr/bin/gcc)
set(CMAKE_CXX_COMPILER /usr/bin/g++)

project(kahlito_daemon VERSION 1.0 LANGUAGES C CXX)

set(CMAKE_VERBOSE_MAKEFILE ON)
# Add the cmake modules directory to call functions in them
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

# Set boiler settings
include(cmake/BuildUtils.cmake)
SetBoilerSettings()

# option(BUILD_DSA_C_GTESTS "Build GTests for kahlito_daemon" ON)
# if (BUILD_DSA_C_GTESTS)
#     # If debug is enabled make sure to include CTest at the root. This will allow
#     # the ctest config to be placed at the root of the build directory
#     IF (CMAKE_BUILD_TYPE STREQUAL "Debug")
#         include(CTest)
#     ENDIF()
# ENDIF()
#
# add_subdirectory(deps)
add_subdirectory(src)
