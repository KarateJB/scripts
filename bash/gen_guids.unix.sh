#!/bin/bash

# Check if the input parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <number_of_guids> [-hyphen]"
  exit 1
fi

# Validate that the input is a positive integer
if ! [[ "$1" =~ ^[0-9]+$ ]]; then
  echo "Error: Input must be a positive integer."
  exit 1
fi

# Default to 1 if no input is provided
COUNT=${1:-1}

# Variable to control if GUIDs should include dashes
INCLUDE_DASHES=true
if [ "$2" == "-hyphen" ]; then
  INCLUDE_DASHES=true
else
  INCLUDE_DASHES=false
fi

# Generate the specified number of GUIDs
for ((i = 0; i < $COUNT; i++)); do
  uuid=$(uuidgen)
  if [ "$INCLUDE_DASHES" = false ]; then
    uuid=$(echo "$uuid" | tr -d '-')
  fi
  echo "$uuid"
done
