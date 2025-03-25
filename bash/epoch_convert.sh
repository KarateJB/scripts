#!/bin/bash
function getNow()
{
  unix_timestamp=$(date +%s)

  # Convert Unix timestamp to milliseconds
  unix_timestamp_ms=$((unix_timestamp * 1000))

  echo "Unix Timestamp (ms): $unix_timestamp_ms"
  echo $unix_timestamp_ms | clip
}
function convertDate() 
{
  echo 'Enter a date (YYYY-MM-DD HH:MM:SS):'
  read input_date
  # Input date in "YYYY-MM-DD HH:MM:SS" format
  # input_date="2023-08-31 15:30:00"

  if [ -n "$input_date" ]; then
    # Convert input date to Unix timestamp in seconds
    unix_timestamp=$(date -d "$input_date" +"%s")

    # Convert Unix timestamp to milliseconds
    unix_timestamp_ms=$((unix_timestamp * 1000))

    echo "Input Date: $input_date"
    echo "Unix Timestamp (ms): $unix_timestamp_ms"
    echo $unix_timestamp_ms | clip
  fi
}

function convertEpoch() 
{
  echo 'Enter an epoch (ms):'
  read input_epoch
  # Input epoch in milliseconds
  # input_epoch="1672473000000"

  if [ -n "$input_epoch" ]; then
    # Convert epoch to Unix timestamp in seconds
    unix_timestamp=$((input_epoch / 1000))

    # Convert Unix timestamp to date
    date=$(date -d @$unix_timestamp +"%Y-%m-%d %H:%M:%S")

    echo "Input Epoch (ms): $input_epoch"
    echo "Date: $date"
    echo $date | clip
  fi
}

select choice in "Get current Epoch" "Convert Date to Epoch" "Convert Epoch to Date" "Exit"; do
  case $choice in
    "Get current Epoch" ) getNow; break;;
    "Convert Date to Epoch" ) convertDate; break;;
    "Convert Epoch to Date" ) convertEpoch; break;;
    "Exit" ) exit;;
  esac
done
