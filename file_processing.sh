#!/bin/bash

# Check if data.txt exists
if [ ! -f "data.txt" ]; then
    echo "Error: data.txt not found."
    exit 1
fi

# Calculate the sum of values in the second column
sum=$(awk -F ',' '{sum+=$2} END {print sum}' data.txt)
echo "Sum of values in the second column: $sum"

# Find the maximum value in the third column
max=$(awk -F ',' '{if(max==""){max=$3}; if($3>max) {max=$3}} END {print max}' data.txt)
echo "Maximum value in the third column: $max"

# Determine the average value in the fourth column
average=$(awk -F ',' '{total+=$4; count++} END {print total/count}' data.txt)
echo "Average value in the fourth column: $average"
