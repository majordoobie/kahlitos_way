#include <cli_parser.h>
#include <errno.h>
#include <getopt.h>
#include <internal_utils.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define PORT_MAX 0xFFFF
#define PORT_MIN 1024

#define DAY_TIME_TEMP 87.0f
#define DAY_TIME_FLOAT 2
#define DAY_TIME_START 7

#define NIGHT_TIME_TEMP 71.0f
#define NIGHT_TIME_FLOAT 1
#define NIGHT_TIME_START 20

DEBUG_STATIC uint16_t get_port_number(const char *number);
DEBUG_STATIC uint8_t get_float(const char *number, float *value);
static cli_t *get_cli_conf(void);

void print_cli(cli_t *p_cli) {
    if (NULL == p_cli) {
        return;
    }
    printf("Sock: 0.0.0.0:%d\nday_temp: %.02f\nnight_temp: %.02f\n",
           p_cli->port, p_cli->day_temp, p_cli->night_temp);
}

cli_t *parse_args(int argc, char **argv) {
    int opt;
    uint8_t error = 0;
    cli_t *p_cli = get_cli_conf();  // null already checked

    struct option long_options[] = {
        {"help", no_argument, 0, 'h'},                    // --help or -h
        {"port", required_argument, 0, 'p'},              // --port or -p
        {"day-temp", required_argument, 0, 'd'},          // --config or -c
        {"night-temp", required_argument, 0, 'n'},        // --config or -c
        {"night-time-start", required_argument, 0, 's'},  // --config or -c
        {"day-time-start", required_argument, 0, 'e'},    // --config or -c
        {0, 0, 0, 0}                                      // End of options
    };

    while ((0 == error) &&
           ((opt = getopt_long(argc, argv, "hp:d:n:", long_options, NULL)) !=
            -1)) {
        switch (opt) {
            case 'h':
                printf(
                    "Usage: %s [--help] [--port <number>] [--config <file>]\n",
                    argv[0]);
                goto ret_null;
            case 'p':
                p_cli->port = get_port_number(optarg);
                break;
            case 'd':
                if (0 != get_float(optarg, &p_cli->day_temp)) {
                    error = 1;
                }
                break;
            case 'n':
                if (0 != get_float(optarg, &p_cli->night_temp)) {
                    error = 1;
                }
                break;
            case 's':
                if (0 != get_float(optarg, &p_cli->day)) {
                    error = 1;
                }
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
    if (NULL != p_cli) {
        destroy_cli(&p_cli);
    }
    return NULL;
}

void destroy_cli(cli_t **pp_cli) {
    if ((NULL == pp_cli) || (NULL == *pp_cli)) {
        return;
    }
    free(*pp_cli);
    *pp_cli = NULL;
}

/**
 * @brief Convert a float string into a float
 *
 * @param number Number string to convert
 * @param value Resulting value
 * @retval 0 on success
 * @retval non-zero on failure
 */
DEBUG_STATIC uint8_t get_float(const char *number, float *value) {
    char *endptr;
    uint8_t error = 0;
    errno = 0;

    *value = strtof(number, &endptr);
    if (errno != 0 || *endptr != '\0') {
        debug_print_err("Invalid float value: %s\n", number);
        error = 1;
    }

    return error;
}

DEBUG_STATIC uint16_t get_port_number(const char *number) {
    uint32_t port = 0;
    if (OK == str_to_4byte_num(number, &port)) {
        if (port > PORT_MAX || port < PORT_MIN) {
            goto ret_null;
        }
    }

    return (uint16_t)port;

ret_null:
    return 0;
}

/**
 * @brief Allocate memory for the cli_t object
 *
 * @return cli_t object
 */
static cli_t *get_cli_conf(void) {
    cli_t *p_cli = malloc(sizeof(cli_t));

    if (NULL == p_cli) {
        fprintf(stderr, "Unable to allocate memory for cli_config");
        exit(1);
    }

    *p_cli = (cli_t){
        .port = 0, .day_temp = DAY_TIME_TEMP, .night_temp = NIGHT_TIME_TEMP};

    return p_cli;
}
