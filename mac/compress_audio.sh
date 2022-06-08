#!/bin/bash

set -e

for file in $(find . -name *.mp3); do
  dir=$(dirname $file)
  fileName=$(basename $file)

  # Check whether the file start with "_", if true, then skip this file
  if [[ ${fileName} == _* ]]; then
    echo "Skip file ${fileName}"
    continue
  fi

  # Check the target exists or not
  target="$dir/_${fileName}"
  if [ -f $target ]; then
    echo "The file ${target} already exists"
    continue
  fi

  # Convert the mp3 file
  echo "Convert file ${file}"
  ffmpeg -i "${file}" -c:a libmp3lame -q:a 7  "${target}"
done
