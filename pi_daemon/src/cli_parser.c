#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <cli_parser.h>
#include <internal_utils.h>

#define PORT_MAX 0xFFFF
#define PORT_MIN 1024

DEBUG_STATIC uint16_t get_port_number(const char *number);

cli_t *parse_args(int argc, char **argv) {
    int opt;
    uint16_t port = 0;

    // Parse command-line options
    while ((opt = getopt(argc, argv, "p:")) != -1) {
        switch (opt) {
            case 'p':
                port = get_port_number(optarg);
                break;
            case '?':
                // Handle unknown option
                fprintf(stderr, "Usage: %s -p <port>\n", argv[0]);
                exit(EXIT_FAILURE);
        }
    }

    // Check if the port was set
    if (0 == port) {
        fprintf(stderr, "Error: -p option for port number is required.\n");
        fprintf(stderr, "Usage: %s -p <port>\n", argv[0]);
        return NULL;
    }

    cli_t *args = malloc(sizeof(cli_t));
    args->port = port;

    return args;
}

DEBUG_STATIC uint16_t get_port_number(const char *number) {
    char *endptr = NULL;
    errno = 0;  // Reset errno to check for errors later
    const long result = strtol(number, &endptr, 10);

    // Error handling
    if (errno == ERANGE) {
        fprintf(stderr, "Value out of range\n");
    } else if (endptr == number) {
        fprintf(stderr, "No digits were found\n");
    } else if (*endptr != '\0') {
        fprintf(stderr, "Extra characters after the number\n");
    } else if (result > PORT_MAX || result < PORT_MIN) {
        fprintf(stderr, "Converted value is out of int range\n");
    }

    return (uint16_t)result;
}


