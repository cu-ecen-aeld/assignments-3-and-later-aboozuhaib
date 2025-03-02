#!/bin/bash

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Both a file path and text string are required as arguments."
    echo "Usage: $0 <directory_path> <search_string>"
    exit 1
fi

# Assign arguments to variables
writefile=$1
writestr=$2

# Create the directory path if it doesn't exist
dir=$(dirname "$writefile")
if [ ! -d "$dir" ]; then
  echo "Directory does not exist. Creating directory path..."
  mkdir -p "$dir" || { echo "Error: Could not create directory path."; exit 1; }
fi

# Write the text string to the file (overwrites existing file)
echo "$writestr" > "$writefile" || { echo "Error: Could not write to file."; exit 1; }

echo "File created and text written successfully."
