#include <cli_parser.h>
#include <errno.h>
#include <getopt.h>
#include <internal_utils.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define PORT_MAX 0xFFFF
#define PORT_MIN 1024
#define DAY_TIME_TEMP 87
#define DAY_TIME_FLOAT 2
#define NIGHT_TIME_TEMP 71
#define NIGHT_TIME_FLOAT 1
#define DAY_TIME_START 7
#define NIGHT_TIME_START 20

DEBUG_STATIC uint16_t get_port_number(const char *number);
static cli_t *get_cli_conf(void);

cli_t *parse_args(int argc, char **argv) {
    int opt;
    cli_t *p_cli = get_cli_conf();  // null already checked

    struct option long_options[] = {
        {"help", no_argument, 0, 'h'},              // --help or -h
        {"port", required_argument, 0, 'p'},        // --port or -p
        {"day-temp", required_argument, 0, 'd'},    // --config or -c
        {"night-temp", required_argument, 0, 'n'},  // --config or -c
        {0, 0, 0, 0}                                // End of options
    };

    // Parse options
    while ((opt = getopt_long(argc, argv, "hp:c:", long_options, NULL)) != -1) {
        switch (opt) {
            case 'h':
                printf(
                    "Usage: %s [--help] [--port <number>] [--config <file>]\n",
                    argv[0]);
                exit(0);
            case 'p':
                p_cli->port = get_port_number(optarg);
                break;
            default:
                fprintf(stderr, "Unknown option\n");
                goto ret_null;
        }
    }
    // Check if the port was set
    if (0 == p_cli->port) {
        fprintf(stderr, "Error: -p option for port number is required.\n");
        fprintf(stderr, "Usage: %s -p <port>\n", argv[0]);
        goto ret_null;
    }

    return p_cli;

ret_null:

    return NULL;
}

void destroy_cli(cli_t **pp_cli) {
    if ((NULL == pp_cli) || (NULL == *pp_cli)) {
        return;
    }
    free(*pp_cli);
    *pp_cli = NULL;
}

DEBUG_STATIC uint16_t get_port_number(const char *number) {
    char *endptr = NULL;
    errno = 0;  // Reset errno to check for errors later
    const long result = strtol(number, &endptr, 10);

    // Error handling
    if (errno == ERANGE) {
        fprintf(stderr, "Value out of range\n");
        goto ret_null;
    } else if (endptr == number) {
        fprintf(stderr, "No digits were found\n");
        goto ret_null;
    } else if (*endptr != '\0') {
        fprintf(stderr, "Extra characters after the number\n");
        goto ret_null;
    } else if (result > PORT_MAX || result < PORT_MIN) {
        fprintf(stderr, "Converted value is out of int range\n");
        goto ret_null;
    }
    return (uint16_t)result;

ret_null:
    return 0;
}


/**
 * @brief Allocate memory for the cli_t object
 *
 * @return cli_t object
 */
static cli_t *get_cli_conf(void) {
    cli_t *p_cli = malloc(sizeof(cli_t *));

    if (NULL == p_cli) {
        fprintf(stderr, "Unable to allocate memory for cli_config");
        exit(1);
    }

    *p_cli = (cli_t){
        .port = 0, .day_temp = DAY_TIME_TEMP, .night_temp = NIGHT_TIME_TEMP};

    return p_cli;
}
