#!/bin/bash

set -euo pipefail

# Set IFS to only newline character to handle file names with spaces
IFS=$'\n'

# Define the root directory for the source files as the current working directory
source_dir=$(pwd)

# Set the target directory as the source directory by default or use the provided argument
target_dir="${1:-$source_dir}"

# Normalize the paths to avoid issues with trailing slashes
source_dir=$(realpath "$source_dir")
target_dir=$(realpath "$target_dir")

# Use find to execute commands directly, avoiding subshell and issues with filenames
for file in $(find "${source_dir}" -type f \( -iname "*.mp3" -o -iname "*.wav" -o -iname "*.aac" -o -iname "*.flac" -o -iname "*.m4a" \)); do
  # Compute the relative path from the source directory
  relative_path="${file#$source_dir/}"
  dir=$(dirname "$relative_path")
  src=$(basename "$file")
  base="${src%.*}"
  dest="${base}.mp3"
  echo "The file is ${file}, relative_path is ${relative_path}, dir is ${dir}, src is ${src}, base is ${base} dest is ${dest}"

  # Determine the target file name and path
  if [ "$source_dir" = "$target_dir" ]; then
    # If the source and target directories are the same, prefix the file name with an underscore
    dest="_${dest}"
  fi

  # Create the target directory structure if it doesn't exist
  target_dir_structure="${target_dir}/${dir}"
  mkdir -p "$target_dir_structure"

  # Define the temporary file path
  temp_file="${target_dir_structure}/.${dest}.tmp"

  # Check if the target file already exists in the target directory structure
  target="${target_dir_structure}/${dest}"
  if [ -f "$target" ]; then
    echo "The file ${target} already exists"
    continue
  fi

  # Convert file to mp3 and save as a temporary file
  if ffmpeg -i "${file}" -y -f mp3 -c:a libmp3lame -ar 44100 -q:a 2 "${temp_file}" && [ -f "${temp_file}" ]; then
    # Move the temporary file to the destination file upon successful conversion
    mv "${temp_file}" "${target}"
    echo "Converted file ${file} to ${target}"
  else
    echo "Failed to convert ${file}"
    [ -f "${temp_file}" ] && rm "${temp_file}" # Clean up temp file in case of failure
  fi
done

