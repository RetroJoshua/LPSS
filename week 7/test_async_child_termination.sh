#!/bin/bash

# Compile the C program
gcc -o async_child_termination async_child_termination.c

# Check if the compilation was successful
if [ $? -ne 0 ]; then
    echo "Compilation failed."
    exit 1
fi

echo "Running async_child_termination program..."

# Function to kill the program after a delay
kill_after_delay() {
    sleep 5
    kill $1
    echo "Program killed after delay to test signal handling."
}

# Run the program in the background
./async_child_termination &
PID=$!

# Use a function to kill the program after a delay to simulate external termination
kill_after_delay $PID &

# Wait for the program to exit
wait $PID

# Check exit status
STATUS=$?
if [ $STATUS -eq 0 ]; then
    echo "Program exited normally."
else
    echo "Program exited with status: $STATUS"
fi

echo "Testing completed."
