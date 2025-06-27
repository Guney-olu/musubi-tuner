#!/bin/bash

# Configuration
SOURCE_DIR="videos"
DEST_DIR="videos_trimmed"
TARGET_DURATION=2 # Target length in seconds

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Loop through all mp4 files in the source directory
for video in "$SOURCE_DIR"/*.mp4; do
  # Get the base filename
  filename=$(basename "$video")
  
  echo "Processing $filename..."
  
  # Use ffmpeg to trim the video to the target duration
  ffmpeg -i "$video" -t "$TARGET_DURATION" -c copy "$DEST_DIR/$filename"
done

echo "All videos trimmed and saved to $DEST_DIRY"
