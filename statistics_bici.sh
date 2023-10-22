#!/bin/bash

# Define the file path
file_path="data_consolidated/consolidated_output.csv"

# Count the total number of distinct 'Bici' values
distinct_bici_count=$(tail -n +2 "$file_path" | cut -d ',' -f 4 | sort -u | wc -l)

# Print the total number of distinct 'Bici' values
echo "Total Distinct Bici Values: $distinct_bici_count"

# Count and display only the top and bottom 10 'Bici' values by count
echo -e "\nTop 10 Rows per Distinct Bici Value (Ordered by Count):"
tail -n +2 "$file_path" | cut -d ',' -f 4 | sort | uniq -c | sort -rn | awk '{printf "%-10s %s\n", $2, $1}' | head -n 10
