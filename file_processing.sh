#!/bin/bash

# Check if the data file exists
if [ ! -f "data.txt" ]; then
    echo "Error: data.txt file not found."
    exit 1
fi

# Calculate the sum of values in the second column
sum=0
while IFS=',' read -r _ val _; do
    sum=$((sum + val))
done < <(awk -F',' '{print $2}' data.txt)
echo "Sum of values in the second column: $sum"

# Find the maximum value in the third column
max=$(awk -F',' '{print $3}' data.txt | sort -nr | head -n 1)
echo "Maximum value in the third column: $max"

# Determine the average value in the fourth column
total=0
count=0
while IFS=',' read -r _ _ _ val; do
    total=$(bc <<< "$total + $val")
    ((count++))
done < "data.txt"
average=$(bc <<< "scale=2; $total / $count")
echo "Average value in the fourth column: $average"
