#!/bin/bash

# Create a sample file for testing
echo "Line 1" > test_file.txt
echo "Line 2" >> test_file.txt
echo "Line 3" >> test_file.txt
echo "Line 4" >> test_file.txt
echo "Line 5" >> test_file.txt
echo "Line 6" >> test_file.txt
echo "Line 7" >> test_file.txt
echo "Line 8" >> test_file.txt
echo "Line 9" >> test_file.txt
echo "Line 10" >> test_file.txt

# Test case 1: Display lines 3 to 7
echo "Test case 1:"
./display_lines.sh test_file.txt 3 7
echo

# Test case 2: Display lines 1 to 5
echo "Test case 2:"
./display_lines.sh test_file.txt 1 5
echo

# Test case 3: Display lines 6 to 10
echo "Test case 3:"
./display_lines.sh test_file.txt 6 10
echo

# Test case 4: Display lines 8 to 12 (should give error)
echo "Test case 4:"
./display_lines.sh test_file.txt 8 12
echo

# Clean up the sample file
rm test_file.txt
