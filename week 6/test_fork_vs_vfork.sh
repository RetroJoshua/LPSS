#!/bin/bash

# Compile the C program
gcc -o fork_vfork_demo fork_vfork_demo.c

# Check if the compilation was successful
if [ $? -ne 0 ]; then
    echo "Compilation failed."
    exit 1
fi

echo "Running fork and vfork demonstration program..."

# Test case 1: Basic run
echo "Test Case 1: Basic Execution"
./fork_vfork_demo

# Additional test cases can be added here
# For example, running under different system loads, adding delays, etc.
# Since the program does not take input or use the environment, we are limited in what can be changed.

# If the program took arguments or could be influenced by environment variables, you could run:
# Example:
# export SOME_VAR="test"
# ./fork_vfork_demo "argument1"

# Clean up (optional)
# rm fork_vfork_demo

echo "Testing completed."
