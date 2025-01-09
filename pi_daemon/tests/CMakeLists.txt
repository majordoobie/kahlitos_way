include(BuildUtils)

# Internals test
add_executable(
    gtest_utils
    gtest_utils.cpp
)

target_link_libraries(
    gtest_utils
    PUBLIC
    internal_utils
)

# # CLI Tests
# add_executable(
#         gtest_arge_parse
#         gtest_argparse.cpp
# )
#
#
# target_link_libraries(
#         gtest_arge_parse
#         PUBLIC
#         cli_parser
# )
#
# GTest_add_target(gtest_arge_parse)
GTest_add_target(gtest_utils)
