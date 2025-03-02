#!/bin/sh

# Check if the correct number of argument is provided
if [ "$#" -ne 2 ]; then
    echo "Error: 2 arguments are expected."
    echo "Usage: $0 <directory_path> <search_string>"
    exit 1
fi

# Assign the arguments to variables
filesdir="$1"
searchstr="$2"

# Check if the provided filesdir is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a valid directory."
    exit 1
fi

# Initialize counters for files and matching lines
file_count=0
matching_lines_count=0

# Find all files in the directory (and subdirectories) and loop through them
for file in $(find "$filesdir" -type f); do
    # Increment file count
    file_count=$((file_count + 1))
    
    # Search for the string and count matching lines
    line_count=$(grep -c "$searchstr" "$file")
    matching_lines_count=$((matching_lines_count + line_count))
done

# Output the result
echo "The number of files are $file_count and the number of matching lines are $matching_lines_count"
