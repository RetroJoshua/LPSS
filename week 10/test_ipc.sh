#!/bin/bash

# Define source files
SENDER_SRC="sender.c"
RECEIVER_SRC="receiver.c"

# Define executable names
SENDER_EXE="sender"
RECEIVER_EXE="receiver"

# Create a unique file for ftok
touch msgqfile

# Compile the sender and receiver programs
gcc $SENDER_SRC -o $SENDER_EXE
gcc $RECEIVER_SRC -o $RECEIVER_EXE

# Check if compilation was successful
if [ $? -ne 0 ]; then
    echo "Compilation failed."
    exit 1
fi

echo "Running IPC tests..."

# Run receiver in the background
./$RECEIVER_EXE &
RECEIVER_PID=$!

# Give the receiver some time to start and be ready to receive messages
sleep 1

# Run sender
./$SENDER_EXE

# Wait for the receiver to finish
wait $RECEIVER_PID

# Check the exit status of the receiver
if [ $? -eq 0 ]; then
    echo "Test Passed: Receiver exited with status 0"
else
    echo "Test Failed: Receiver exited with status $?"
fi

# Cleanup: Remove executables and the message queue file
rm $SENDER_EXE $RECEIVER_EXE msgqfile

echo "Testing completed."
