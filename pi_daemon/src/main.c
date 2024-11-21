#include <cli_parser.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "internal_utils.h"

int main(int argc, char** argv) {
    cli_t* p_cli = parse_args(argc, argv);
    if (NULL == p_cli) {
        printf("error bitch");
    } else {
        print_cli(p_cli);
    }

    destroy_cli(&p_cli);
}
