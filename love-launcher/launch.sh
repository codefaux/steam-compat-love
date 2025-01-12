#!/bin/bash

# Path to the LOVE AppImage
#LOVE_APPIMAGE='/opt/Applications/love-11.5-x86_64.AppImage'
# Path to the extracted LOVE AppRun
#LOVE_APPIMAGE='/opt/love-11.5/AppRun'

# Extract the second argument
FILE="${@:2}"

# Function to check if the file is a Windows executable
is_windows_executable() {
    local file_type
    file_type=$(file -b "$1")
    if [[ $file_type == *"PE32 executable"* || $file_type == *"PE32+ executable"* ]]; then
        return 0
    else
        return 1
    fi
}

# Function to check if the file has a ZIP structure and contains main.lua
has_zip_with_main_lua() {
    if unzip -qq -l "$1" 2>/dev/null | grep -q "main.lua"; then
        return 0
    else
        return 1
    fi
}

# Check if the file exists
if [[ ! -f "$FILE" ]]; then
    echo "Error: File '$FILE' does not exist."
    exit 1
fi

# Validate the file
if is_windows_executable "$FILE" && has_zip_with_main_lua "$FILE"; then
    # Execute the LOVE AppImage with the file
    $LOVE_APPIMAGE "$FILE"
else
    echo "Error: The file '$FILE' is either not a Windows executable or does not contain a valid ZIP structure with main.lua."
    exit 1
fi
