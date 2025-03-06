#!/bin/bash
# Thu 06 Mar 2025 09:44:00 AM UTC

# Variables
BASE="/home/ubuntu/Desktop"
DAYS=10
DEPTH=1
RUN=0

# Check if directory is present or not
if [ ! -d "$BASE" ]; then
    echo "Directory does not exist: $BASE"
    exit 1
fi

# Create archive folder if not present
ARCHIVE_DIR="$BASE/archive" 
if [ ! -d "$ARCHIVE_DIR" ]; then
    mkdir "$ARCHIVE_DIR"
fi

# Find list of files larger than 20MB
find "$BASE" -maxdepth "$DEPTH" -type f -size +20M -print0 | while IFS= read -r -d '' i; do
    if [ "$RUN" -eq 0 ]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Archiving $i ==> $ARCHIVE_DIR"
        gzip "$i" || exit 1
        mv "$i.gz" "$ARCHIVE_DIR" || exit 1
    fi
done
