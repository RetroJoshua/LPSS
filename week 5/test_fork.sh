#!/bin/bash

# Define the C source file and the output executable
SOURCE_FILE="fork_example.c"
EXECUTABLE="fork_example"

# Create the C source file with the provided code
cat << 'EOF' > $SOURCE_FILE
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
        // Simulate some work in the child process
        sleep(2);
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
EOF

# Compile the C program
gcc -o $EXECUTABLE $SOURCE_FILE

# Check if the compilation was successful
if [ $? -ne 0 ]; then
    echo "Compilation failed"
    exit 1
fi

# Run the compiled program
./$EXECUTABLE

# Check if the program ran successfully
if [ $? -ne 0 ]; then
    echo "Program execution failed"
    exit 1
fi

# Clean up
rm -f $SOURCE_FILE $EXECUTABLE

echo "Test completed successfully"
