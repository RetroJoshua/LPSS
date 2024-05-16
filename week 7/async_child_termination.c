#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>

// Signal handler for SIGCHLD
void sigchld_handler(int sig) {
    // Reap child processes
}

int main() {
    // Fork a child process
    pid_t pid = fork();

    if (pid == -1) {
        // Handle fork error
        return 1;
    }

    if (pid == 0) {
        // Child process code
        return 0; // Exit status
    } else {
        // Parent process code
        // Set up the signal handler for SIGCHLD
        struct sigaction sa;
        sa.sa_handler = sigchld_handler;
        sigemptyset(&sa.sa_mask);
        sa.sa_flags = 0;

        sigaction(SIGCHLD, &sa, NULL);

        // Wait for signals
        while (1) {
            pause();
        }
    }

    return 0;
}
