#!/bin/bash

# Function to pause and wait for user input
pause() {
    read -p "Press [Enter] key to continue..."
}

# Function to check user command and execute it if correct
check_command() {
    local expected_command="$1"
    local user_command
    read -p "Type the command: " user_command
    if [ "$user_command" == "$expected_command" ]; then
        echo "Correct!"
        coins=$((coins + 10))
        correct_activities=$((correct_activities + 1))
        eval "$user_command"
    else
        echo "Incorrect. The correct command was: $expected_command"
        eval "$expected_command"
    fi
    total_activities=$((total_activities + 1))
}

# Initialize counters
coins=0
correct_activities=0
total_activities=0

# Introduction
echo "Welcome to the interactive shell command tutorial!"
echo "You will learn the following commands: ls, cat, cd, pwd, man, and sed."
echo "You will earn 10 coins for each correct command."
pause

# Guide for 'ls' command
echo -e "\n1. ls - List directory contents"
echo "The 'ls' command is used to list files and directories in the current directory."
echo "Try running the following command:"
echo "ls"
check_command "ls"
pause

echo "Here are some important arguments for the 'ls' command:"
echo "-a: List all files including hidden files (those starting with a dot)"
echo "ls -a"
check_command "ls -a"
pause

echo "-l: List in long format, showing detailed information about each file"
echo "ls -l"
check_command "ls -l"
pause

echo "-h: With -l, print sizes in human-readable format (e.g., 1K, 234M)"
echo "ls -lh"
check_command "ls -lh"
pause

echo "-R: List directories and their contents recursively"
echo "ls -R"
check_command "ls -R"
pause

# Guide for 'cat' command
echo -e "\n2. cat - Concatenate and display file content"
echo "The 'cat' command is used to display the content of a file."
echo "First, let's create a sample file. Run the following command:"
echo "echo 'Hello, World!' > sample.txt"
check_command "echo 'Hello, World!' > sample.txt"
pause

echo "Now, use the 'cat' command to display the content of 'sample.txt':"
echo "cat sample.txt"
check_command "cat sample.txt"
pause

echo "Here are some important arguments for the 'cat' command:"
echo "-n: Number all output lines"
echo "cat -n sample.txt"
check_command "cat -n sample.txt"
pause

echo "-b: Number non-blank output lines"
echo "cat -b sample.txt"
check_command "cat -b sample.txt"
pause

echo "-s: Squeeze multiple adjacent blank lines into a single blank line"
echo "echo -e 'Line 1\n\n\nLine 2' > sample.txt"
check_command "echo -e 'Line 1\n\n\nLine 2' > sample.txt"
pause

echo "cat -s sample.txt"
check_command "cat -s sample.txt"
pause

# Guide for 'cd' command
echo -e "\n3. cd - Change directory"
echo "The 'cd' command is used to change the current directory."
echo "Let's create a new directory and navigate into it. Run the following commands:"
echo "mkdir sample_dir"
check_command "mkdir sample_dir"
pause

echo "cd sample_dir"
check_command "cd sample_dir"
pause

echo "Now, you are in the 'sample_dir' directory. Use 'pwd' to confirm your current directory:"
echo "pwd"
check_command "pwd"
pause

# Guide for 'pwd' command
echo -e "\n4. pwd - Print working directory"
echo "The 'pwd' command is used to display the current working directory."
echo "You have already used 'pwd' in the previous step. Try running it again:"
echo "pwd"
check_command "pwd"
pause

# Guide for 'man' command
echo -e "\n5. man - Manual pages"
echo "The 'man' command is used to display the manual pages for other commands."
echo "For example, to learn more about the 'ls' command, run the following command:"
echo "man ls"
check_command "man ls"
pause

# Guide for 'sed' command
echo -e "\n6. sed - Stream editor"
echo "The 'sed' command is used to perform basic text transformations on an input stream (a file or input from a pipeline)."
echo "Let's create a sample file for demonstration. Run the following command:"
echo "echo -e 'Line 1\nLine 2\nLine 3\nLine 4\nLine 5' > sample.txt"
check_command "echo -e 'Line 1\nLine 2\nLine 3\nLine 4\nLine 5' > sample.txt"
pause

echo "Now, use the 'sed' command to display lines 2 to 4 of 'sample.txt':"
echo "sed -n '2,4p' sample.txt"
check_command "sed -n '2,4p' sample.txt"
pause

echo "Here are some important arguments and use cases for the 'sed' command:"
echo "-n: Suppress automatic printing of pattern space"
echo "p: Print the current pattern space"
echo "d: Delete the pattern space; immediately start the next cycle"
echo "s: Substitute command, used for search and replace"
echo "For example, to replace 'Line' with 'Row' in 'sample.txt', run:"
echo "sed 's/Line/Row/g' sample.txt"
check_command "sed 's/Line/Row/g' sample.txt"
pause

echo "To delete the 3rd line in 'sample.txt', run:"
echo "sed '3d' sample.txt"
check_command "sed '3d' sample.txt"
pause

# Additional sed use cases
echo "To insert a line before the 2nd line in 'sample.txt', run:"
echo "sed '2i\Inserted Line' sample.txt"
check_command "sed '2i\Inserted Line' sample.txt"
pause

echo "To append a line after the 2nd line in 'sample.txt', run:"
echo "sed '2a\Appended Line' sample.txt"
check_command "sed '2a\Appended Line' sample.txt"
pause

echo "To replace the first occurrence of 'Line' with 'Replaced' in each line, run:"
echo "sed 's/Line/Replaced/' sample.txt"
check_command "sed 's/Line/Replaced/' sample.txt"
pause

echo "To replace all occurrences of 'Line' with 'Replaced' in each line, run:"
echo "sed 's/Line/Replaced/g' sample.txt"
check_command "sed 's/Line/Replaced/g' sample.txt"
pause

echo "To replace 'Line' with 'Replaced' only on lines 2 to 4, run:"
echo "sed '2,4s/Line/Replaced/g' sample.txt"
check_command "sed '2,4s/Line/Replaced/g' sample.txt"
pause

echo "To delete lines that match a pattern (e.g., lines containing 'Line 3'), run:"
echo "sed '/Line 3/d' sample.txt"
check_command "sed '/Line 3/d' sample.txt"
pause

# Conclusion
echo -e "\nCongratulations! You have learned the basics of the following commands: ls, cat, cd, pwd, man, and sed."
echo "Feel free to explore more commands and their manual pages using the 'man' command."
echo "Happy learning!"

# Display results
echo -e "\nSummary:"
echo "Total coins earned: $$coins"
echo "Correct activities: $$correct_activities"
echo "Total activities: $total_activities"

# Clean up
cd ..
rm -r sample_dir
rm sample.txt
