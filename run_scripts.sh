#!/bin/bash

# List of bash scripts to run
script_list=("get_files_2023.sh" "rename_files.sh" "consolidate_files.sh" "statistics_genero.sh" "statistics_edad.sh" "statistics_bici.sh" "statistics_CE_Retiro.sh" "statistics_CE_Arribo.sh")

# Iterate through the script list and run each script
for script in "${script_list[@]}"; do
    echo "Running $script..."
    bash "$script"
    exit_code=$?

    # Check the exit code of the script
    if [ $exit_code -ne 0 ]; then
        echo "Error: $script failed with exit code $exit_code"
        exit $exit_code
    fi

    echo "$script completed successfully."
done

echo "All scripts have been run successfully."
