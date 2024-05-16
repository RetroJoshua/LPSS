#!/bin/bash

# Define FIFO paths
FIFO_SENDER_TO_RECEIVER="fifo_sender_to_receiver"
FIFO_RECEIVER_TO_SENDER="fifo_receiver_to_sender"

# Create FIFOs
mkfifo $FIFO_SENDER_TO_RECEIVER
mkfifo $FIFO_RECEIVER_TO_SENDER

# Compile the sender and receiver programs
gcc sender.c -o sender
gcc receiver.c -o receiver

# Check if compilation was successful
if [ $? -ne 0 ]; then
    echo "Compilation failed."
    exit 1
fi

# Run receiver in the background
./receiver &
RECEIVER_PID=$!

# Run sender in the foreground
./sender

# Wait for the receiver to finish
wait $RECEIVER_PID

# Cleanup: Remove FIFOs and executables
rm $FIFO_SENDER_TO_RECEIVER $FIFO_RECEIVER_TO_SENDER
rm sender receiver

echo "Testing completed."
