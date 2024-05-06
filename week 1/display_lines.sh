#!/bin/bash

# Check if correct number of arguments provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <file_name> <start_line_number> <end_line_number>"
    exit 1
fi

# Extract arguments
file_name=$1
start_line=$2
end_line=$3

# Check if file exists
if [ ! -f "$file_name" ]; then
    echo "Error: File '$file_name' not found."
    exit 1
fi

# Check if start line number is less than end line number
if [ $start_line -gt $end_line ]; then
    echo "Error: Start line number cannot be greater than end line number."
    exit 1
fi

# Display lines between start and end line numbers
# Complete this section

