#!/bin/bash

# Create the output folder if it doesn't exist
mkdir -p data_consolidated

# Define the consolidated file
consolidated_file="data_consolidated/consolidated_output.csv"

# Clear the file contents
> "$consolidated_file"

# Add header to consolidated file
echo "Filename,Genero_Usuario,Edad_Usuario,Bici,Ciclo_Estacion_Retiro,Fecha_Retiro,Hora_Retiro,Ciclo_Estacion_Arribo,Fecha_Arribo,Hora_Arribo,Hora_Retiro_int,Hora_Arribo_int" > "$consolidated_file"

# Process each CSV file in the data folder

for file in data/*.csv; do
    filename=$(basename "$file" .csv)
    tail -n +2 "$file" | awk -v var="$filename" -F, '{split($6, time1, ":"); split($9, time2, ":"); $0 = $0 "," time1[1] "," time2[1]; print var "," $0}' | sed 's/\.csv//' >> "$consolidated_file"
done

echo "Consolidation completed. Output saved to: $consolidated_file"
