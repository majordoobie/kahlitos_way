#include <errno.h>
#include <internal_utils.h>
#include <netdb.h>
#include <server.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>

int8_t start_server(char* p_port) {
    // Set up the hints structure to specify the parameters we want
    struct addrinfo hints;
    struct addrinfo* network_record_root;
    struct addrinfo* network_record;
    int sock_fd, enable_setsockopt;

    //
    memset(&hints, 0, sizeof(struct addrinfo));
    hints = (struct addrinfo){
        .ai_canonname = NULL,
        .ai_addr = NULL,
        .ai_next = NULL,
        .ai_socktype = SOCK_STREAM,  // TCP
        .ai_family = AF_UNSPEC,      // Allows IPv4 or IPv6
        .ai_flags = AI_PASSIVE,      // Use wildcard IP address (quad 0)
    };


    // Request socket structures that meet our criteria. This is the current meta
    // allos for automatic ipv4 vs ipv6
    if (0 != getaddrinfo(NULL, p_port, &hints, &network_record_root)) {
        debug_print_err("[SERVER] Unable to fetch socket structures: %s\n",
                        strerror(errno));
        goto RET_NULL;
    }


RET_NULL:
    return -1;
}

