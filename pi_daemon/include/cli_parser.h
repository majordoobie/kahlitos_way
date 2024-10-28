#ifndef CLI_PARSER_H
#define CLI_PARSER_H
#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

typedef struct {
    uint16_t port;
} cli_t;

cli_t* parse_args(int argc, char** argv);

#ifdef __cplusplus
}
#endif
#endif
