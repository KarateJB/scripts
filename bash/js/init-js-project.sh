#!/bin/bash

# This script initializes a JavaScript project with common dependencies and configurations for ESLint and Jest.

# 1. Install npm dev dependencies
echo "Installing development dependencies..."
if [ ! -f package.json ]; then
  echo "package.json not found in the current directory. Please run 'npm init' first."
  exit 1
fi
npm install --save-dev \
  "@babel/core@^7.24.7" \
  "@babel/preset-env@^7.24.7" \
  "@eslint/js@^10.0.1" \
  "babel-jest@^29.7.0" \
  "jest@^29.7.0" \
  "eslint@^10.1.0"

# Check if the installation was successful
if [ $? -ne 0 ]; then
  echo "Failed to install npm dependencies. Aborting."
  exit 1
fi

echo "Dependencies installed successfully."

# 2. Update package.json
echo "Updating package.json..."

# Check if package.json exists
if [ ! -f package.json ]; then
  echo "package.json not found in the current directory. Please run 'npm init' first."
  exit 1
fi

# Use sed to perform the replacements.
# Note: Using different delimiters for sed to avoid issues with slashes in the replacement string.
sed -i 's|"type": "commonjs"|"type": "module"|' package.json
sed -i 's|"main": "index.js"|"main": "main.js"|' package.json
sed -i 's|"test": "echo \\"Error: no test specified\\" && exit 1"|"start": "node main.js",\n    "test": "node --experimental-vm-modules node_modules/jest/bin/jest.js"|' package.json


echo "package.json updated successfully."

# 3. Copy configuration files
echo "Copying configuration files..."

# Get the directory where the script is located
SCRIPT_DIR=$(dirname "$0")

# Copy babel.config.js and eslint.config.js from the script's directory to the current directory
if [ -f "$SCRIPT_DIR/babel.config.js" ]; then
  cp "$SCRIPT_DIR/babel.config.js" .
  echo "Copied babel.config.js."
else
  echo "Warning: babel.config.js not found in $SCRIPT_DIR. Skipping copy."
fi

if [ -f "$SCRIPT_DIR/eslint.config.js" ]; then
  cp "$SCRIPT_DIR/eslint.config.js" .
  echo "Copied eslint.config.js."
else
  echo "Warning: eslint.config.js not found in $SCRIPT_DIR. Skipping copy."
fi

echo "Project initialization complete."
