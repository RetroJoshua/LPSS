// process2.c
#include <sys/ipc.h>
#include <sys/msg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAX 100

struct message {
    long msg_type;
    char msg_text[MAX];
};

int is_prime(int num) {
    if (num <= 1) return 0;
    for (int i = 2; i <= num / 2; i++) {
        if (num % i == 0) return 0;
    }
    return 1;
}

int is_even(int num) {
    return num % 2 == 0;
}

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

    while (1) {
        // Receive message
        msgrcv(msgid, &msg, sizeof(msg), 1, 0);

        int num = atoi(msg.msg_text);
        char response[MAX];

        if (strstr(msg.msg_text, "isprime") != NULL) {
            sprintf(response, "isprime: %d", is_prime(num));
        } else if (strstr(msg.msg_text, "iseven") != NULL) {
            sprintf(response, "iseven: %d", is_even(num));
        }

        // Send response
        msg.msg_type = 2;
        strcpy(msg.msg_text, response);
        msgsnd(msgid, &msg, sizeof(msg), 0);
    }

    return 0;
}
