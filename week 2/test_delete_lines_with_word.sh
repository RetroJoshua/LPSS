#!/bin/bash

# Function to compare two files
compare_files() {
    diff -q "$1" "$2" >/dev/null
    if [ $? -eq 0 ]; then
        echo "Pass"
    else
        echo "Fail"
    fi
}

# Function to run test cases
run_test_cases() {
    total_tests=$#
    passed_tests=0

    for ((i=1; i<=$total_tests; i+=2)); do
        echo "Test Case $((i/2 + 1)):"

        # Run delete_lines_with_word.sh script
        ./delete_lines_with_word.sh "$1" "$2"

        # Compare output file with expected file
        compare_files "$2" "$3"

        if [ "$(compare_files "$2" "$3")" == "Pass" ]; then
            ((passed_tests++))
        fi

        echo
        shift 2
    done

    # Calculate percentage of tests passed
    percentage=$((passed_tests * 100 / total_tests))
    echo "Status: $percentage% of test cases passed"
}

# Create sample input files
echo "Line 1 with example word" > file1.txt
echo "Line 2 without example word" >> file1.txt
echo "Line 3 with example word" > file2.txt
echo "Line 4 without example word" >> file2.txt

# Create expected output files
cp file1.txt file1_expected.txt
sed -i '/example/d' file1_expected.txt
cp file2.txt file2_expected.txt
sed -i '/example/d' file2_expected.txt

# Run test cases
run_test_cases "example" "file1.txt" "file1_expected.txt" "example" "file2.txt" "file2_expected.txt"

# Clean up temporary files
rm file1.txt file1_expected.txt file2.txt file2_expected.txt
