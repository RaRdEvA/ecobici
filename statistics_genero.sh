#!/bin/bash

data_file="data_consolidated/consolidated_output.csv"

# Extract Genero_Usuario column without header and excluding nulls
genero_column=$(cut -d ',' -f 2 "$data_file" | tail -n +2)

# Function to calculate distinct values, count, and percentage for categorical column
calculate_categorical_stats() {
    awk 'BEGIN {count=0}
         {count++; arr[$1]++}
         END {
             print "Distinct values:";
             for (val in arr) {
                 print val;
                 print "Count: " arr[val];
                 print "Percentage: " (arr[val]/count)*100 "%";
                 print "";
             }
         }'
}

# Calculate distinct values, count, and percentage for Genero_Usuario
echo -e "\nDistinct values for Genero_Usuario:"
echo "$genero_column" | calculate_categorical_stats
