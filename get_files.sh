#!/bin/bash

# Function to validate numeric input with a limit of 2 to 4 digits
validate_numeric() {
  input=$1
  if ! [[ $input =~ ^[0-9]{2,4}$ ]]; then
    echo "Invalid input. Please enter a valid numeric value with 2 to 4 digits."
    exit 1
  fi
}

read -p "Enter starting year (YYYY): " start_year
validate_numeric "$start_year"

read -p "Enter starting month (MM): " start_month
validate_numeric "$start_month"

read -p "Enter ending year (YYYY): " end_year
validate_numeric "$end_year"

read -p "Enter ending month (MM): " end_month
validate_numeric "$end_month"

# Validate input range
start_date="${start_year}-${start_month}-01"
end_date="${end_year}-${end_month}-01"

# Calculate the previous month of the current date
current_date=$(date +%Y-%m-%d)
previous_month=$(date -d "$current_date - 1 month" +%Y-%m-%d)
valid_end="${previous_month}"

if [[ $start_date < "2010-02-01" || $end_date > $valid_end ]]; then
  echo "Invalid date range. Please enter dates between February 2010 and the previous month of the current date."
  exit 1
fi

# Delete existing "data" folder and recreate it
rm -rf data
mkdir -p data

# Loop through the date range and download files into separate folders
current_date="${start_date}"

while [[ $current_date < $end_date ]]; do
  year=$(date -d "$current_date" +%Y)
  month=$(date -d "$current_date" +%m)

  # Create the folder for the current year if it doesn't exist
  mkdir -p "data/${year}"

  # Create the folder for the current month if it doesn't exist
  mkdir -p "data/${year}/${month}"

  # Download file
  file_url="https://ecobici.cdmx.gob.mx/wp-content/uploads/${year}/${month}/ecobici_${year}_${month}.csv"
  wget "$file_url" -P "data/${year}/${month}/"

  # Move to the next month
  current_date=$(date -d "$current_date + 1 month" +%Y-%m-%d)
done

echo "Download complete!"
