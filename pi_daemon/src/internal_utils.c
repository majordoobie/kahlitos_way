#include <errno.h>
#include <internal_utils.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

status_t str_to_4byte_num(const char *number, uint32_t *result) {
    char *endptr = NULL;
    errno = 0;
    const long res = strtol(number, &endptr, 10);

    if (ERANGE == errno) {
        debug_print("ERROR: Conversion out of range (%s)", number);
        goto ret_null;
    } else if (endptr == number) {
        debug_print("ERROR: No digits were founds (%s)", number);
        goto ret_null;
    } else if (*endptr != '\0') {
        debug_print("ERROR: Further characters found after parsing: %s",
                    endptr);
    }

    *result = (uint32_t)res;

    return OK;

ret_null:
    return ERR;
}

status_t str_to_float(const char *number, float *result) {
    char *endptr = NULL;
    float value = 0;
    errno = 0;

    value = strtof(number, &endptr);

    // if no convertion performed, then the memory address of
    // endptr and number is the same
    if (endptr == number) {
        debug_print("ERROR: No digits were found in %s", number);
        goto ret_null;
    }

    if (ERANGE == errno) {
        if (isinf(value) && value > 0) {
            debug_print("ERROR: Conversion will lead to positive infinity (%s)",
                        number);
        } else if (isinf(value) && value < 0) {
            debug_print("ERROR: Conversion will lead to negative infinity (%s)",
                        number);
        } else {
            debug_print("ERROR: Conversion would be too small (%s)", number);
        }

        goto ret_null;
    }

    *result = value;
    return OK;

ret_null:
    return ERR;
}
