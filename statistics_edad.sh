#!/bin/bash

data_file="data_consolidated/consolidated_output.csv"

# Extract Edad_Usuario column without header and excluding nulls
edad_column=$(cut -d ',' -f 3 "$data_file" | tail -n +2 | grep -v '^\s*$' | grep -v 'NULL')

# Function to calculate descriptive statistics for numerical column
calculate_numerical_stats() {
    awk 'BEGIN {count=0; sum=0; sumsq=0; min=9999999999; max=0}
         {count++; sum+=$1; sumsq+=$1*$1; if ($1 < min) min=$1; if ($1 > max) max=$1}
         END {
             print "Count: " count;
             print "Mean: " sum/count;
             print "Min: " min;
             print "Max: " max;
             print "Standard Deviation: " sqrt(sumsq/count - (sum/count)**2);
             arr[count]; split("", arr);
             while ((getline < "/dev/stdin") > 0) { arr[$1]++ }
             close("/dev/stdin");
             asorti(arr, sorted_indices);
             print "Median: " int(min+max)/2+1;
         }'
}

# Calculate distinct values for Edad_Usuario and sort them numerically
distinct_values=$(echo "$edad_column" | awk '!seen[$1]++' | sort -n)

# Calculate descriptive statistics for Edad_Usuario
echo -e "\nDistinct values for Edad_Usuario (sorted numerically):"
echo "$distinct_values"

echo -e "\nDescriptive statistics for Edad_Usuario (excluding nulls):"
echo "$edad_column" | calculate_numerical_stats
