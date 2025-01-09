#include <gtest/gtest.h>
#include <internal_utils.h>


TEST(TestFloatConversion, FloatConversionTest) {
    const char argv[] = "3.14";
    float value;

    EXPECT_EQ(OK, str_to_float(argv, &value));
    EXPECT_FLOAT_EQ(3.14f, value);
}

TEST(TestFloatConversion, FloatConversionTest2) {
    const char argv[] = "3.1699999";
    float value;

    EXPECT_EQ(OK, str_to_float(argv, &value));
    EXPECT_FLOAT_EQ(3.1699999f, value);
}


TEST(TestFloatConversion, FloatOverflow) {
    const char argv[] = "1e999";
    float value;

    EXPECT_EQ(ERR, str_to_float(argv, &value));
}

TEST(TestFloatConversion, FloatOverflow2) {
    const char argv[] = "-1e999";
    float value;

    EXPECT_EQ(ERR, str_to_float(argv, &value));
}

TEST(TestFloatConversion, FloatUnderflow) {
    const char argv[] = "1e-999";
    float value;

    EXPECT_EQ(ERR, str_to_float(argv, &value));
}

TEST(TestFloatConversion, Invalid) {
    const char argv[] = "abc";
    float value;

    EXPECT_EQ(ERR, str_to_float(argv, &value));
}

TEST(TestIntConversion, Valid) {
    const char argv[] = "3";
    uint32_t value;

    EXPECT_EQ(OK, str_to_4byte_num(argv, &value));
    EXPECT_EQ(3, value);
}

TEST(TestIntConversion, Valid2) {
    const char argv[] = "-3000";
    uint32_t value;

    EXPECT_EQ(OK, str_to_4byte_num(argv, &value));
    EXPECT_EQ(-3000, value);
}

TEST(TestIntConversion, Valid3) {
    const char argv[] = "2147483647";
    uint32_t value;

    EXPECT_EQ(OK, str_to_4byte_num(argv, &value));
    EXPECT_EQ(INT32_MAX, value);
}

TEST(TestIntConversion, Valid4) {
    const char argv[] = "−2147483648";
    uint32_t value;

    EXPECT_EQ(OK, str_to_4byte_num(argv, &value));
    EXPECT_EQ(INT32_MIN, value);
}

TEST(TestIntConversion, Invalid) {
    const char argv[] = "214748648";
    uint32_t value;

    EXPECT_EQ(ERR, str_to_4byte_num(argv, &value));
}

TEST(TestIntConversion, Invalid2) {
    const char argv[] = "−2147483649";
    uint32_t value;

    EXPECT_EQ(ERR, str_to_4byte_num(argv, &value));
}

