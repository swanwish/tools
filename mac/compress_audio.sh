#!/bin/bash

set -e

for src in *.mp3; do 
  # No mp3 file found
  if [ ! -f ${src} ]; then
    echo "No mp3 file in the directory"
    break
  fi

  # Check whether the file start with "_", if true, then skip the file
  if [[ ${src} == _* ]]; then
    echo "Skip file ${src}"
    continue
  fi

  # Check the target exists or not
  target="_${src}"
  if [ -f $target ]; then
    echo "The file ${target} already exists"
    continue
  fi

  # Convert the mp3 file
  echo "Convert file ${src}"
  ffmpeg -i "${src}" -c:a libmp3lame -q:a 7  "${target}"
done
