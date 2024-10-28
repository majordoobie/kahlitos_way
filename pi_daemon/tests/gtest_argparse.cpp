#include <gtest/gtest.h>
#include <cli_parser.h>

/**
 * @brief Dynamically create an array of strings
 *
 * @param count Number of strings in the array
 * @param static_array Static array of strings to create
 * @return Array of dynammically allocated strings
 */
char ** make_string_array(size_t count, const char ** static_array) {
    char ** char_array = (char **)calloc(count, sizeof(char *));
    if (NULL == char_array) {
        return NULL;
    }

    for (size_t i = 0; i < count; i++) {
        char_array[i] = strdup(static_array[i]);
    }

    return char_array;
}


/**
 * @brief Free the dynamically create array of strings
 *
 * @param count Nubmer of strings in the array.
 * @param string_array Array of strings to free
 */
void free_string_array(size_t count, char ** string_array) {
    for (size_t i = 0; i < count; i++) {
        free(string_array[i]);
    }
    free(string_array);
}

TEST(ArgParserTest, TestNumConversion) {
     
}

TEST(ArgParserTest, TestNoOptions) {
    int argc = 1;
    const char *argv[] = {"program"};
    char ** argv2 = make_string_array((size_t)argc, argv);

    cli_t * cli = parse_args(argc, argv2);
    EXPECT_EQ(nullptr, cli);

    free_string_array((size_t)argc, argv2);
}

TEST(ArgParserTest, TestPortOutOfRange1) {
    int argc = 3;
    const char *argv[] = {"program", "-p", "1000"};
    char ** argv2 = make_string_array((size_t)argc, argv);

    cli_t * cli = parse_args(argc, argv2);
    EXPECT_EQ(nullptr, cli);

    free_string_array((size_t)argc, argv2);
}

TEST(ArgParserTest, TestPortOutOfRange2) {
    int argc = 3;
    const char *argv[] = {"program", "-p", "3000"};
    char ** argv2 = make_string_array((size_t)argc, argv);

    cli_t * cli = parse_args(argc, argv2);
    EXPECT_EQ(nullptr, cli);

    free_string_array((size_t)argc, argv2);
}


