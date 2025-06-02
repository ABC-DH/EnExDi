#!/bin/bash

# Navigate to the directory
cd "my_folder"

# Loop through each file in the directory
for file in *; do
    # Rename the file
    mv "$file" "$file new"
done

# Print a message showing that the process was successful
echo "All files renamed successfully"
