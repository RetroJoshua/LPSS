#!/bin/bash

# Check if correct number of arguments provided
if [ $# -lt 2 ]; then
    echo "Usage: $0 <word> <file1> [<file2> ...]"
    exit 1
fi

# Extract the word to be deleted
word=$1

# Loop through each file provided
for file in "${@:2}"; do
    # Check if file exists
    if [ ! -f "$file" ]; then
        echo "Error: File '$file' not found."
        continue
    fi
    
    # Create a temporary file to store filtered content
    tmp_file=$(mktemp)

    # Delete lines containing the specified word
    # Complete this section using grep and redirection
    # grep -v "$word" "$file" > "$tmp_file"

    # Replace original file with filtered content
    # mv "$tmp_file" "$file"

    echo "Lines containing '$word' deleted from '$file'."
done

