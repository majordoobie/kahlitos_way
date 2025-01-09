#ifndef CLI_PARSER_H
#define CLI_PARSER_H
#ifdef __cplusplus
extern "C" {
#endif

#include <internal_utils.h>
#include <stdint.h>

typedef struct {
    uint16_t port;
    float day_temp;
    float night_temp;
    uint32_t day_start;
    uint32_t night_start;
} cli_t;

/**
 * @brief Printout the values of the cli config
 *
 * @param p_cli Pointer to the cli object
 */
void print_cli(cli_t* p_cli);

/**
 * @brief Parse the argv and argc values to create
 * and validate the clit_t object
 *
 * @param argc Number of strings in argv
 * @param argv Arguments passed into stdin
 * @return cli_t object
 */
cli_t* parse_args(int argc, char** argv);

/**
 * @brief Destroy the allocated cli_t object
 *
 * @param pp_cli Double pointer to cli_t object
 */
void destroy_cli(cli_t** pp_cli);

#ifdef __cplusplus
}
#endif
#endif
