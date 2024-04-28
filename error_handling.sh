#!/bin/bash

# Check if a required command-line argument is provided
if [ $# -eq 0 ]; then
    echo "Error: No command-line argument provided. Please provide a filename."
    exit 1
fi

filename=$1

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' does not exist."
    exit 1
fi

# Attempt to read from the file
echo "Attempting to read from file: $filename"
cat "$filename"
