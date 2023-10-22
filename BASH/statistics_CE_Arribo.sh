#!/bin/bash

# Define the file path
file_path="data_consolidated/consolidated_output.csv"

# Count the total number of distinct 'Ciclo_EstacionArribo' values
distinct_Ciclo_EstacionArribo_count=$(tail -n +2 "$file_path" | cut -d ',' -f 8 | sort -u | wc -l)

# Print the total number of distinct 'Ciclo_EstacionArribo' values
echo "Total Distinct Ciclo_EstacionArribo Values: $distinct_Ciclo_EstacionArribo_count"

# Count and display only the top and bottom 10 'Ciclo_EstacionArribo' values by count
echo -e "\nTop 10 Rows per Distinct Ciclo_EstacionArribo Value (Ordered by Count):"
tail -n +2 "$file_path" | cut -d ',' -f 8 | sort | uniq -c | sort -rn | awk '{printf "%-10s %s\n", $2, $1}' | head -n 10
