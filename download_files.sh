#!/bin/bash

input_file="file_paths.txt"
download_folder="data"

# Clear existing download folder
rm -rf "$download_folder"
mkdir -p "$download_folder"

# Read file paths and download files
while IFS= read -r file_path; do
  # Download file with original filename
  wget "$file_path" -P "$download_folder/"

done < "$input_file"

echo "Download complete!"
