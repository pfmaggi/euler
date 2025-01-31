#!/bin/bash

# Find and execute all p_XXXX files in numerical order
find . -maxdepth 1 -type f -name 'p_[0-9][0-9][0-9][0-9].out' -print0 | 
    sort -z -V | 
    while IFS= read -r -d $'\0' file; do
        # Check if file is executable
        if [[ -x "$file" ]]; then
            # echo "🟢 Executing: $file"
            ./"$file"
        else
            echo "🔴 Skipping: $file (not executable)"
        fi
    done

echo "✅ All matching files processed"
