// server.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <signal.h>
#include <sys/wait.h>

#define PORT 8080
#define MAX 1024

int is_prime(int num) {
    if (num <= 1) return 0;
    for (int i = 2; i <= num / 2; i++) {
        if (num % i == 0) return 0;
    }
    return 1;
}

int is_even(int num) {
    return num % 2 == 0;
}

void handle_client(int new_socket) {
    char buffer[MAX] = {0};
    int valread = read(new_socket, buffer, MAX);
    if (valread < 0) {
        perror("read");
        close(new_socket);
        return;
    }

    int num;
    char response[MAX];
    if (strstr(buffer, "isprime") != NULL) {
        sscanf(buffer, "isprime %d", &num);
        sprintf(response, "isprime: %d", is_prime(num));
    } else if (strstr(buffer, "iseven") != NULL) {
        sscanf(buffer, "iseven %d", &num);
        sprintf(response, "iseven: %d", is_even(num));
    } else {
        sprintf(response, "Unknown command");
    }

    send(new_socket, response, strlen(response), 0);
    close(new_socket);
}

void sigchld_handler(int s) {
    // Wait for all dead processes
    // We use a loop to handle all terminated children
    while (waitpid(-1, NULL, WNOHANG) > 0);
}

int main() {
    int server_fd, new_socket;
    struct sockaddr_in address;
    int opt = 1;
    int addrlen = sizeof(address);
    struct sigaction sa;

    // Creating socket file descriptor
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) {
        perror("socket failed");
        exit(EXIT_FAILURE);
    }

    // Forcefully attaching socket to the port 8080
    if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &opt, sizeof(opt))) {
        perror("setsockopt");
        close(server_fd);
        exit(EXIT_FAILURE);
    }

    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(PORT);

    // Bind the socket to the network address and port
    if (bind(server_fd, (struct sockaddr *)&address, sizeof(address)) < 0) {
        perror("bind failed");
        close(server_fd);
        exit(EXIT_FAILURE);
    }

    // Listen for incoming connections
    if (listen(server_fd, 3) < 0) {
        perror("listen");
        close(server_fd);
        exit(EXIT_FAILURE);
    }

    // Set up the signal handler for SIGCHLD
    sa.sa_handler = sigchld_handler; // Reap all dead processes
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = SA_RESTART; // Restart interrupted system calls
    if (sigaction(SIGCHLD, &sa, NULL) == -1) {
        perror("sigaction");
        exit(1);
    }

    printf("Server listening on port %d\n", PORT);

    while (1) {
        // Accept an incoming connection
        if ((new_socket = accept(server_fd, (struct sockaddr *)&address, (socklen_t*)&addrlen)) < 0) {
            perror("accept");
            continue;
        }

        // Fork a new process to handle the client
        if (!fork()) {
            // Child process
            close(server_fd); // Close the listening socket in the child process
            handle_client(new_socket);
            exit(0);
        }
        close(new_socket); // Parent process closes the connected socket
    }

    return 0;
}
