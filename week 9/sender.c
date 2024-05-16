#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>

int main() {
    int send_fd, recv_fd;
    char buffer[1024];  // Buffer for receiving data

    // Open the FIFO for writing to the receiver
    send_fd = open("fifo_sender_to_receiver", O_WRONLY);
    if (send_fd == -1) {
        perror("Failed to open send FIFO");
        exit(EXIT_FAILURE);
    }

    // Open the FIFO for reading from the receiver
    recv_fd = open("fifo_receiver_to_sender", O_RDONLY);
    if (recv_fd == -1) {
        perror("Failed to open receive FIFO");
        close(send_fd);
        exit(EXIT_FAILURE);
    }

    // Write data to the receiver
    // write(send_fd, "Your data here", strlen("Your data here") + 1);

    // Read response from the receiver
    // read(recv_fd, buffer, sizeof(buffer));

    // Close the FIFOs
    close(send_fd);
    close(recv_fd);

    return 0;
}
