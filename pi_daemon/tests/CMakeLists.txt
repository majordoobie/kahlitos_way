include(BuildUtils)
add_executable(
        gtest_arge_parse
        gtest_argparse.cpp
)
target_link_libraries(
        gtest_arge_parse
        PUBLIC
        cli_parser
)

GTest_add_target(gtest_arge_parse)
