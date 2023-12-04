#!/bin/bash

# Define the URL of the resource to be downloaded
DOWNLOAD_URL="https://github.com/swanwish/tools/raw/master/mac/convert_audio.tar.gz"
# Define the temporary download path
TMP_DOWNLOAD_PATH="/tmp/convert_audio.tar.gz"
# Define the target directory where the files will be extracted
TARGET_DIR="/usr/local/bin"

# Function to check if the script is run as root
check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo "This script must be run as root."
        exit 1
    fi
}

# Function to download the file
download_file() {
    echo "Downloading convert_audio.tar.gz..."
    curl -L "$DOWNLOAD_URL" -o "$TMP_DOWNLOAD_PATH"
}

# Function to extract the file
extract_file() {
    echo "Extracting convert_audio.tar.gz to $TARGET_DIR..."
    tar -xzf "$TMP_DOWNLOAD_PATH" -C "$TARGET_DIR"
    xattr -d com.apple.quarantine "$TARGET_DIR/convert_audio.sh"
    xattr -d com.apple.quarantine "$TARGET_DIR/ffmpeg"
}

# Main script execution
# Check if the user is root
check_root
# Download the file
download_file
# Extract the file
extract_file

# Clean up the temporary download file
rm "$TMP_DOWNLOAD_PATH"

echo "Installation completed successfully."
