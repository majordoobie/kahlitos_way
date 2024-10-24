#include <cli_parser.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

cli_t *parse_args(int argc, char **argv) {
    int chr;
    while ((chr = getopt(argc, argv, "p:")) != -1) {
        switch (chr) {
            case 'p':
                printf("Got the port number of %s\n", optarg);
            case '?':
                printf("unknown value passed in\n");
            default:
                printf("This is how you do shit");
        }
    }

    cli_t *args = malloc(sizeof(cli_t));
    args->port = 10;

    return args;
}
