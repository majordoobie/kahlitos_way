#include <stdlib.h>
#include <cstring>

#include <gtest/gtest.h>
#include <cli_parser.h>

class CLIParserParameterizedTestFixture :public ::testing::TestWithParam<std::tuple<std::vector<std::string>,bool>> {};

TEST_P(CLIParserParameterizedTestFixture, CheckArgValues) {
    std::vector<std::string> args = std::get<0>(GetParam());
    bool expect_null = std::get<1>(GetParam());

    // Create a char** array
    size_t count = args.size();
    char **arg_strs = new char *[count]; // Allocate memory for the array of char*

    // Convert std::string to char* and populate cStrings
    for (size_t i = 0; i < count; i++) {
        arg_strs[i] = new char[args[i].size() + 1]; // Allocate memory for each string
        std::strcpy(arg_strs[i], args[i].c_str());  // Copy the string data
    }

    cli_t * cli = parse_args((int)count, arg_strs);
    if (expect_null) {
        EXPECT_EQ(nullptr, cli);
    } else {
        EXPECT_NE(nullptr, cli);
    }

    for (size_t i = 0; i < count; i++) {
        delete[] arg_strs[i]; // Free each string
    }
    delete[] arg_strs;

}

INSTANTIATE_TEST_CASE_P(
        ArgChecks,
        CLIParserParameterizedTestFixture,
        ::testing::Values(
            std::make_tuple(std::vector<std::string>{"program"}, true),
            std::make_tuple(std::vector<std::string>{"program", "-p", "1000"}, true),
            std::make_tuple(std::vector<std::string>{"program", "-p", "70000"}, true),
            std::make_tuple(std::vector<std::string>{"program", "--port", "A12"}, true),
            std::make_tuple(std::vector<std::string>{"program", "---port", "A12"}, true),
            std::make_tuple(std::vector<std::string>{"-h"}, true)
        ));
