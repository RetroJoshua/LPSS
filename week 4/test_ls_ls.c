#include <stdio.h>
#include <stdlib.h>

// Prototype of the function from ls_ls.c
void ls_ls(const char *path);

int main() {
    // Provide the directory path you want to test
    const char *directory_path = "/path/to/directory";

    printf("Testing ls_ls function with directory: %s\n", directory_path);
    printf("============================================\n");

    ls_ls(directory_path);

    printf("============================================\n");
    printf("Testing complete.\n");

    return 0;
}
