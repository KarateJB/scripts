#!/bin/bash

# Check if the year is provided as a parameter
if [ -z "$1" ]; then
  echo "Usage: $0 <year>"
  exit 1
fi

YEAR=$1

# Loop through all months in the given year
for MONTH in {01..12}; do
  # Define the base directory for the current month
  MONTH_DIR="${YEAR}/${YEAR}${MONTH}"

  # Define the subdirectories
  SUBDIRS=("Daily" "Clips")

  # Create each subdirectory
  for SUBDIR in "${SUBDIRS[@]}"; do
    FULL_PATH="${MONTH_DIR}/${SUBDIR}"
    if [ ! -d "$FULL_PATH" ]; then
      mkdir -p "$FULL_PATH"
      echo "Created: $FULL_PATH"
    else
      echo "Skipped: $FULL_PATH (already exists)"
    fi
  done
done

echo "Directory creation completed for year $YEAR."
