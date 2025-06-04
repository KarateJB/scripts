#!/bin/bash

# Define the target date in YYYY-MM-DD format
target_date=${1:-"2024-11-01"}
export target_timestamp=$(date -d "$target_date" +"%s")

# Find directories and subdirectories with specific names and creation date starting from the target date
find . -type d \( -name "PIM*" -o -name "CC1*" -o -name "QT*" -o -name "UTIM*" \) -exec bash -c '
    for dir; do
        created_timestamp=$(stat -c %W "$dir")
        if [[ $created_timestamp -gt $target_timestamp ]]; then
            echo "$dir"
        fi
    done
' bash "{}" +
