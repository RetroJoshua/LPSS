#!/bin/bash

echo "Welcome to the Basic Command Guide!"
echo "This script will guide you through some basic commands: ls, cat, and commands that read files with arguments."
echo

# Function to guide the user through the 'ls' command
function guide_ls {
    echo "The 'ls' command lists the contents of a directory."
    echo "Usage: ls [options] [directory]"
    echo "Examples:"
    echo "  ls            # List files in the current directory"
    echo "  ls -l         # List files in long format"
    echo "  ls -a         # List all files including hidden files"
    echo "  ls /path/to/directory  # List files in the specified directory"
    echo
}

# Function to guide the user through the 'cat' command
function guide_cat {
    echo "The 'cat' command concatenates and displays the content of files."
    echo "Usage: cat [options] [file]"
    echo "Examples:"
    echo "  cat file.txt            # Display the content of file.txt"
    echo "  cat file1.txt file2.txt # Display the content of file1.txt and file2.txt"
    echo "  cat -n file.txt         # Display the content of file.txt with line numbers"
    echo
}

# Function to guide the user through commands that read files with arguments
function guide_read_files {
    echo "Commands that read files with arguments:"
    echo "1. 'head' command: Display the first part of files."
    echo "   Usage: head [options] [file]"
    echo "   Examples:"
    echo "     head file.txt        # Display the first 10 lines of file.txt"
    echo "     head -n 5 file.txt   # Display the first 5 lines of file.txt"
    echo
    echo "2. 'tail' command: Display the last part of files."
    echo "   Usage: tail [options] [file]"
    echo "   Examples:"
    echo "     tail file.txt        # Display the last 10 lines of file.txt"
    echo "     tail -n 5 file.txt   # Display the last 5 lines of file.txt"
    echo
    echo "3. 'grep' command: Search for patterns in files."
    echo "   Usage: grep [options] pattern [file]"
    echo "   Examples:"
    echo "     grep 'search_term' file.txt  # Search for 'search_term' in file.txt"
    echo "     grep -i 'search_term' file.txt  # Case-insensitive search for 'search_term' in file.txt"
    echo
}

# Main menu
while true; do
    echo "Please select a command to learn about:"
    echo "1. ls"
    echo "2. cat"
    echo "3. Commands that read files with arguments"
    echo "4. Exit"
    read -p "Enter your choice (1-4): " choice

    case $choice in
        1)
            guide_ls
            ;;
        2)
            guide_cat
            ;;
        3)
            guide_read_files
            ;;
        4)
            echo "Exiting the guide. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 4."
            ;;
    esac
    echo
done
