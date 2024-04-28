#!/bin/bash

# Check if the data file exists
if [ ! -f "data.txt" ]; then
    echo "Error: data.txt file not found."
    exit 1
fi

# Initialize variables
sum=0
max=0
total=0
count=0

# Process each line in the file
while IFS=',' read -r _ val2 val3 val4; do
    # Sum of values in the second column
    sum=$((sum + val2))

    # Maximum value in the third column
    if (( val3 > max )); then
        max=$val3
    fi

    # Total sum in the fourth column
    total=$((total + val4))
    ((count++))
done < "data.txt"

# Calculate the average value in the fourth column
average=$(bc <<< "scale=2; $total / $count")

# Display results
echo "Sum of values in the second column: $sum"
echo "Maximum value in the third column: $max"
echo "Total sum in the fourth column: $total"
echo "Number of values in the fourth column: $count"
echo "Average value in the fourth column: $average"
