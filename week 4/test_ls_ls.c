#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Prototype of the function from ls_ls.c
void ls_ls(const char *path);

int main() {
    printf("Testing ls_ls function\n");
    printf("==============================\n");

    // Test case 1: Test with current directory
    printf("Test Case 1: Current Directory\n");
    printf("--------------------------------\n");
    printf("Output of 'ls -ls' command:\n");
    ls_ls(".");
    printf("\n\n");

    // Test case 2: Test with a specific directory
    const char *directory_path = "/path/to/directory"; // Replace with an actual directory path
    printf("Test Case 2: Directory %s\n", directory_path);
    printf("--------------------------------\n");
    printf("Output of 'ls -ls' command:\n");
    ls_ls(directory_path);
    printf("\n\n");

    // Test case 3: Test with a non-existent directory
    const char *non_existent_path = "/non_existent_directory";
    printf("Test Case 3: Non-existent Directory %s\n", non_existent_path);
    printf("--------------------------------\n");
    printf("Output of 'ls -ls' command:\n");
    ls_ls(non_existent_path);
    printf("\n\n");

    printf("==============================\n");
    printf("Testing complete.\n");

    return 0;
}
