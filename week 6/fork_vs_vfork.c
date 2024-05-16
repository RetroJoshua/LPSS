#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    int variable = 100;

    // Using fork
    if (fork() == 0) {
        // Child process code for fork
        _exit(0);
    } else {
        // Parent process waits for child to finish
        wait(NULL);
    }

    // Using vfork
    if (vfork() == 0) {
        // Child process code for vfork
        _exit(0);
    } else {
        // Parent process waits for child to finish
        wait(NULL);
    }

    return 0;
}
