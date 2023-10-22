#!/bin/bash

# Specify the directory path
directory="data"

# Specify the output file in the original level
output_file="../headers.txt"

# Navigate to the directory
cd "$directory" || exit

# Clear existing output file
> "$output_file"

# Iterate over each .csv file in the directory
for file in *.csv; do
  if [[ -f "$file" ]]; then
    # Read the header and append it to the output file with the filename
    header=$(head -n 1 "$file")
    echo "$file,$header" >> "$output_file"
    echo "Header of $file added to $output_file"
  fi
done

echo "Header extraction complete!"
