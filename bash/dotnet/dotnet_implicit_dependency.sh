# !/bin/bash
if [ -z "$1" ]; then
  echo "Usage: $0 package-name"
  exit 1
fi
dotnet list package --include-transitive | grep -iE "project|$1";
