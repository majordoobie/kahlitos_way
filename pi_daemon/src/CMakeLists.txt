
include(BuildUtils)

add_executable(main main.c)
set_project_properties(main ${CMAKE_CURRENT_SOURCE_DIR}/../include)

# IF (CMAKE_BUILD_TYPE STREQUAL "Debug")
#     add_subdirectory(../tests ../tests)
# ENDIF()
