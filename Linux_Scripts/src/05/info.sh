#!/bin/bash

dir=$1

NUM_FOLDERS=$(sudo find "$dir" -type d | wc -l)
TOP_FOLDERS=$(sudo du -h "$dir"* | sort -hr | head -n 5 | awk '{print NR " - " $2 ", " $1}')
NUM_FILES=$(sudo find "$dir" -type f | wc -l)
CONF=$(sudo find "$dir" -type f -name "*.conf" | wc -l)
TXT=$(sudo find "$dir" -type f -name "*.txt" | wc -l)
EXEC=$(sudo find "$dir" -type f -executable | wc -l)
LOG=$(sudo find "$dir" -type f -name "*.log" | wc -l)
ARCHIVE=$(sudo find "$dir" -type f \( -name "*.zip" -o -name "*.7z" -o -name "*.tar" -o -name "*.rar" -o -name "*.gz" \) | wc -l)
LINKS=$(sudo find "$dir" -type l | wc -l)
TOP_MAX_FILES=$(sudo find "$dir" -type f -exec du -h {} + | sort -hr | head -n 10 | awk '{printf "%d - %s, %s, ", NR, $2, $1; system("md5sum \"" $2 "\" | cut -d\" \" -f1")}')
TOP_EXEC_FILES=$(sudo find "$dir" -type f -executable -exec du -h {} +| sort -hr | head -n 10 | awk '{printf "%d - %s, %s, ", NR, $2, $1; system("md5sum " $2 " | cut -d\" \" -f1")}')

echo "Total number of folders (including all nested ones) = $NUM_FOLDERS"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$TOP_FOLDERS"
echo "Total number of files = $NUM_FILES"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $CONF"
echo "Text files = $TXT"
echo "Executable files = $EXEC"
echo "Log files (with the extension .log) = $LOG"
echo "Archive files = $ARCHIVE"
echo "Symbolic links = $LINKS"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$TOP_MAX_FILES"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
echo "$TOP_EXEC_FILES"
