#!/bin/bash

data_folder="data"
consolidated_file="data_consolidated/consolidated_output.csv"

# Count all files in the data folder
file_count=$(find "$data_folder" -maxdepth 1 -type f -name "*.csv" | wc -l)
echo "Total number of files: $file_count"

# Initialize variables for row counts
total_rows=0
total_rows_without_headers=0

# Process each CSV file in the data folder
for file in "$data_folder"/*.csv; do
    # Count rows per file
    rows_in_file=$(wc -l < "$file")
    echo "Rows in $file: $rows_in_file"

    # Add to the total row count
    total_rows=$((total_rows + rows_in_file))

    # Exclude header row from the count
    rows_without_headers=$((rows_in_file - 1))
    total_rows_without_headers=$((total_rows_without_headers + rows_without_headers))
done

echo "Total rows in all files: $total_rows"
echo "Total rows in all files (without headers): $total_rows_without_headers"

# Get total rows less number of files
rowslessfiles=$((total_rows - file_count))
echo "Total rows in all files - number of files: $rowslessfiles"

# Get total rows in the consolidated file
total_rows_in_consolidated=$(wc -l < "$consolidated_file")
total_rows_in_consolidated_no_header=$((total_rows_in_consolidated - 1))
echo "Total rows in consolidated file: $total_rows_in_consolidated"
echo "Total rows in consolidated file without header: $total_rows_in_consolidated_no_header"

