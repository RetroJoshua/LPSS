**Step 1:** Define the Message Structure 
Messages in System V IPC are sent using a structure that includes a long integer type and a message text. Here's a common structure:
```
#include <sys/types.h>

struct msgbuf {
    long mtype;     // message type, must be > 0
    char mtext[1];  // message data, size can be adjusted
};
```
**Step 2:** Sender Program
This program sends messages to a message queue.

**Step 3:** Receiver Program
This program receives messages from the message queue.

Compilation and Execution
1. Create a file named `msgqfile` in the same directory as your programs. This file is used by `ftok` to generate a unique key.
2. Compile the programs:
   ```
   gcc sender.c -o sender
   gcc receiver.c -o receiver
   ```
3. Run the receiver first, then the sender:
   ```
   ./receiver
   ./sender
   ```
