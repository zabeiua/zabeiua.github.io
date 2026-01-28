#!/bin/bash

# Script to re-create t-hunter.xpi from the source directory

SOURCE_DIR="addon_yt_sync"
OUTPUT_FILE="yt_sync.xpi"

# Check if zip command exists
if ! command -v zip &>/dev/null; then
  echo "Error: 'zip' command not found. Please install zip."
  exit 1
fi

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory '$SOURCE_DIR' not found."
  exit 1
fi

# Remove existing xpi file
if [ -f "$OUTPUT_FILE" ]; then
  echo "Removing existing $OUTPUT_FILE..."
  rm "$OUTPUT_FILE"
fi

echo "Creating $OUTPUT_FILE from $SOURCE_DIR..."

# Navigate to source directory to zip relative paths
cd "$SOURCE_DIR" || exit

# Zip contents, excluding hidden files like .git or .DS_Store if they exist
# -r: recursive
# -FS: file sync (updates archive to match file system, removing deleted files if updating) - standard zip doesn't always need this for fresh creation
zip -r "../$OUTPUT_FILE" . -x "*.git*" -x "*.DS_Store*"

# Check if zip was successful
if [ $? -eq 0 ]; then
  echo "Successfully created $OUTPUT_FILE"
else
  echo "Error creating $OUTPUT_FILE"
  exit 1
fi

cd ..
