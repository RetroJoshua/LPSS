#!/bin/bash

# Create sample files with different permissions
touch readable_file
chmod +rw readable_file

touch writable_file
chmod +wr writable_file

touch executable_file
chmod +x executable_file

touch readable_writable_file
chmod +rw readable_writable_file

touch readable_executable_file
chmod +rx readable_executable_file

touch writable_executable_file
chmod +wx writable_executable_file

touch readable_writable_executable_file
chmod +rwx readable_writable_executable_file

# Run the script being tested
echo "Accessible files:"
./list_accessible_files.sh

# Clean up sample files
rm readable_file writable_file executable_file readable_writable_file readable_executable_file writable_executable_file readable_writable_executable_file
