#include <cli_parser.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char** argv) {
    cli_t* args = parse_args(argc, argv);
    if (NULL == args) {
        printf("error bitch");
    } else {
        printf("Got the value of %d\n", args->port);
        // free(args);
    }
}
