#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t pid;

    // Create a child process
    pid = fork();

    if (pid < 0) {
        // Fork failed
        perror("Fork failed");
        exit(1);
    } else if (pid == 0) {
        // Child process
        printf("Child process: PID = %d\n", getpid());
        // Child process code goes here
        // For example, you can simulate some work with sleep
        // sleep(2);
        // End of child process code
        printf("Child process exiting\n");
        exit(0);
    } else {
        // Parent process
        printf("Parent process: PID = %d, waiting for child process to exit\n", getpid());
        // Wait for the child process to exit
        wait(NULL);
        printf("Child process has exited, parent process continuing\n");
    }

    return 0;
}
