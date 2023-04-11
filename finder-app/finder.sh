#!/bin/bash

# Check if the script is being run with the correct number of arguments
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <directory_path> <search_string>"
    exit 1
fi

# Check if the first argument is a directory
if [[ ! -d $1 ]]; then
    echo "$1 is not a directory"
    exit 1
fi

# Store the command line arguments in variables
filesdir="$1"
searchstr="$2"

# Use the find command to locate all files in the directory and its subdirectories
# and pass them to grep to search for the search string
matches=$(find "$filesdir" -type f -exec grep -H "$searchstr" {} \;)

# Count the number of files and matching lines found
num_files=$(echo "$matches" | cut -d ':' -f 1 | sort -u | wc -l)
num_lines=$(echo "$matches" | wc -l)

# Print the results
echo "The number of files are $num_files and the number of matching lines are $num_lines"

