#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>

int main() {
    int send_fd, recv_fd;
    char buffer[1024];  // Buffer for receiving data

    // Open the FIFO for reading from the sender
    recv_fd = open("fifo_sender_to_receiver", O_RDONLY);
    if (recv_fd == -1) {
        perror("Failed to open receive FIFO");
        exit(EXIT_FAILURE);
    }

    // Open the FIFO for writing back to the sender
    send_fd = open("fifo_receiver_to_sender", O_WRONLY);
    if (send_fd == -1) {
        perror("Failed to open send FIFO");
        close(recv_fd);
        exit(EXIT_FAILURE);
    }

    // Read data from the sender
    // read(recv_fd, buffer, sizeof(buffer));

    // Process the data (optional, depending on application)

    // Write response back to the sender
    // write(send_fd, "Your response here", strlen("Your response here") + 1);

    // Close the FIFOs
    close(recv_fd);
    close(send_fd);

    return 0;
}
