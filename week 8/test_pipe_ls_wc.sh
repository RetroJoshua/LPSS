#!/bin/bash

# Compile the C program
gcc -o pipe_ls_wc pipe_ls_wc.c

# Check if the compilation was successful
if [ $? -ne 0 ]; then
    echo "Compilation failed."
    exit 1
fi

echo "Running pipe_ls_wc program..."

# Run the compiled program
./pipe_ls_wc > output.txt

# Run the shell command for comparison
ls | wc -l -c -w > expected_output.txt

# Compare the outputs
if diff output.txt expected_output.txt > /dev/null; then
    echo "Test Passed: The outputs are identical!"
else
    echo "Test Failed: The outputs differ."
    diff output.txt expected_output.txt
fi

# Clean up
rm output.txt expected_output.txt pipe_ls_wc

echo "Testing completed."
