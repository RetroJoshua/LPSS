// process3.c
#include <sys/ipc.h>
#include <sys/msg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX 100

struct message {
    long msg_type;
    char msg_text[MAX];
};

int main() {
    key_t key;
    int msgid;
    struct message msg;

    // Generate unique key
    key = ftok("progfile", 65);

    // Get the message queue id
    msgid = msgget(key, 0666 | IPC_CREAT);
    if (msgid == -1) {
        perror("msgget");
        exit(1);
    }

    // Send request
    msg.msg_type = 1;
    sprintf(msg.msg_text, "isprime 17");
    msgsnd(msgid, &msg, sizeof(msg), 0);

    // Receive response
    msgrcv(msgid, &msg, sizeof(msg), 2, 0);
    printf("Response: %s\n", msg.msg_text);

    return 0;
}
