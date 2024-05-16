#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ipc.h>
#include <sys/msg.h>

struct msgbuf {
    long mtype;
    char mtext[200];
};

int main() {
    struct msgbuf buf;
    int msgid;
    key_t key;

    // Generate a unique key
    if ((key = ftok("msgqfile", 'B')) == -1) {
        perror("ftok");
        exit(1);
    }

    // Connect to the message queue
    if ((msgid = msgget(key, 0644 | IPC_CREAT)) == -1) {
        perror("msgget");
        exit(1);
    }

    buf.mtype = 1;  // Set the message type
    strcpy(buf.mtext, "Hello, world!");  // Set the message text

    // Send the message
    if (msgsnd(msgid, &buf, strlen(buf.mtext) + 1, 0) == -1) {
        perror("msgsnd");
        exit(1);
    }

    printf("Sent: \"%s\"\n", buf.mtext);

    return 0;
}
