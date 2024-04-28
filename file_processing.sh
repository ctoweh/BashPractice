#!/bin/bash

# Check if data.txt exists
if [ ! -f "data.txt" ]; then
    echo "Error: data.txt not found."
    exit 1
fi

# Calculate the sum of values in the second column
sum=0
while IFS=',' read -r col1 col2 col3 col4; do
    sum=$((sum + col2))
done < data.txt
echo "Sum of values in the second column: $sum"

# Find the maximum value in the third column
max=$(awk -F ',' '{if($3 > max) max=$3} END {print max}' data.txt)
echo "Maximum value in the third column: $max"

# Determine the average value in the fourth column
count=0
total=0
while IFS=',' read -r col1 col2 col3 col4; do
    total=$(echo "$total + $col4" | bc)
    count=$((count + 1))
done < data.txt
average=$(echo "scale=2; $total / $count" | bc)
echo "Average value in the fourth column: $average"
