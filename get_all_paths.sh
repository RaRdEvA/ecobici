#!/bin/bash

base_url="https://ecobici.cdmx.gob.mx/datos-abiertos/"
output_file="file_paths.txt"

# Clear existing file paths
> "$output_file"

# Download HTML content
html_content=$(curl -s "$base_url")

# Extract file paths using grep and sed, prepend base URL
echo "$html_content" | grep -Eo 'a href="/wp-content/uploads/[0-9]{4}/[0-9]{2}/(ecobici_)?[0-9]{4}(_|-)[0-9]{2}.csv"' | sed 's/a href="//;s/"$//' | sed "s|^/|$base_url|;s|datos-abiertos/||" >> "$output_file"

echo "File paths extracted and saved to $output_file"
