#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Error: missing arguments"
    echo "Usage: writer.sh writefile writestr"
    exit 1
fi

writefile=$1
writestr=$2

# Create directory path if it doesn't exist
if [ ! -d "$(dirname "$writefile")" ]; then
    mkdir -p "$(dirname "$writefile")"
fi

# Create or overwrite file with writestr
if ! echo "$writestr" > "$writefile"; then
    echo "Error: could not write to file $writefile"
    exit 1
fi
