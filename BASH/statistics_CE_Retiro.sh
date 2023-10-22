#!/bin/bash

# Define the file path
file_path="data_consolidated/consolidated_output.csv"

# Count the total number of distinct 'Ciclo_Estacion_Retiro' values
distinct_Ciclo_Estacion_Retiro_count=$(tail -n +2 "$file_path" | cut -d ',' -f 5 | sort -u | wc -l)

# Print the total number of distinct 'Ciclo_Estacion_Retiro' values
echo "Total Distinct Ciclo_Estacion_Retiro Values: $distinct_Ciclo_Estacion_Retiro_count"

# Count and display only the top and bottom 10 'Ciclo_Estacion_Retiro' values by count
echo -e "\nTop 10 Rows per Distinct Ciclo_Estacion_Retiro Value (Ordered by Count):"
tail -n +2 "$file_path" | cut -d ',' -f 5 | sort | uniq -c | sort -rn | awk '{printf "%-10s %s\n", $2, $1}' | head -n 10
