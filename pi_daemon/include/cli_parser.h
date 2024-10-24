#ifndef CLI_PARSER_H
#define CLI_PARSER_H

#include <stdint.h>

typedef struct {
    uint16_t port;
} cli_t;

cli_t* parse_args(int argc, char** argv);

#endif
