#ifndef CLI_PARSER_H
#define CLI_PARSER_H
#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

typedef struct {
    uint16_t port;
    float day_temp;
    float night_temp;
} cli_t;

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
