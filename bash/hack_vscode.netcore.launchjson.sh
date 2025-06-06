#!/bin/bash

# Helo
if [ "$1" = '-h' ]; then
  echo "[netcore] Hack VSCODE launch.json to use preferred profile in launchSettings.json"
  echo "Usage: hack_vscode.netcore.launchjson.sh [profile_name]"
  exit 0
fi

# File path
launch_json_file=".vscode/launch.json"

# Check if launch.json exists
if [ ! -f "${launch_json_file}" ]; then
    echo ".vscode/launch.json file not found. Run '.NET: Generate Assets for Build and Debug' first."
    exit 1
fi

# Default profile name
profile_name=${1:-dev}

# Replacement args block
replace_args="        \\\"args\\\": [\n            \\\"--launch-profile\\\",\n            \\\"${profile_name}\\\"\n        ],"

# sed pattern
sed_pattern="/\"args\": \\[/,/],/c\\${replace_args}"

# Execute sed command
sed -i "${sed_pattern}" "${launch_json_file}"
