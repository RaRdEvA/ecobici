#!/bin/bash

# Specify the directory where the files are located
directory="data"

# Navigate to the directory
cd "$directory" || exit

# Iterate over each file in the directory
for file in *; do
  # Check if the file is a regular file
  if [[ -f "$file" ]]; then
    # Extract the first 4 numbers and the last 2 numbers using a regular expression
    if [[ "$file" =~ ([0-9]{4}).*([0-9]{2}) ]]; then
      # Create the new filename using the captured groups
      new_name="${BASH_REMATCH[1]}-${BASH_REMATCH[2]}.${file##*.}"

      # Rename the file
      mv "$file" "$new_name"
      echo "Renamed $file to $new_name"
    else
      echo "Skipped $file - No match found"
    fi
  fi
done

echo "File renaming complete!"
