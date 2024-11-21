#include <stdlib.h>
#include <cstring>
#include "internal_utils.h"

#include <gtest/gtest.h>
#include <cli_parser.h>

extern "C" {
    uint8_t get_float(const char *number, float *value);
    void uint32_to_ip(uint32_t ip, char *buffer, size_t buffer_size);
}

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

    cli_t * p_cli = parse_args((int)count, arg_strs);
    if (expect_null) {
        EXPECT_EQ(nullptr, p_cli);
    } else {
        EXPECT_NE(nullptr, p_cli);
        print_cli(p_cli);
    }

    for (size_t i = 0; i < count; i++) {
        delete[] arg_strs[i]; // Free each string
    }
    delete[] arg_strs;

    if (nullptr != p_cli) {
        destroy_cli(&p_cli);
    }

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
            std::make_tuple(std::vector<std::string>{"program", "--port", "3000", "-n", "60"}, false),
            std::make_tuple(std::vector<std::string>{"program", "--port", "3000", "-n", "60", "-d", "80"}, false),
            std::make_tuple(std::vector<std::string>{"program", "--port", "3000", "-n", "60", "-d", "-80"}, false),
            std::make_tuple(std::vector<std::string>{"-h"}, true)
        ));


TEST(TestFloatConversion, FloatConversionTest) {
    const char argv[] = "3.14";
    float value;
    uint8_t result = get_float(argv, &value);

    EXPECT_EQ(result, 0);
    EXPECT_FLOAT_EQ(3.14f, value);
}

TEST(TestFloatConversion, FloatConversionTest2) {
    const char argv[] = "3.1699999";
    float value;
    uint8_t result = get_float(argv, &value);

    EXPECT_EQ(result, 0);
    EXPECT_FLOAT_EQ(3.1699999f, value);
}
