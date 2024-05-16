#include <stdio.h>
#include <stdlib.h>
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
    if ((msgid = msgget(key, 0644)) == -1) {
        perror("msgget");
        exit(1);
    }

    // Receive the message
    if (msgrcv(msgid, &buf, sizeof(buf.mtext), 0, 0) == -1) {
        perror("msgrcv");
        exit(1);
    }

    printf("Received: \"%s\"\n", buf.mtext);

    // Optionally, remove the message queue
    if (msgctl(msgid, IPC_RMID, NULL) == -1) {
        perror("msgctl");
        exit(1);
    }

    return 0;
}
