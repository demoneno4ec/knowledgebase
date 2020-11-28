#!/bin/bash

if [ $# -eq 0 ]; then
    echo "directory to find required (директория для поиска обязательна)"
    exit 1;
fi


targetDirectory=$1;
doubleSlash='//';
oneSlash='/';
for dir in $(ls -A $targetDirectory);
do
  targetSubDirectory=$targetDirectory"/"$dir;
  for countFiles in $(ls -A $targetSubDirectory | wc -l);
  do
    echo $(du -sh "${targetSubDirectory//$doubleSlash/$oneSlash}")". Count files = "$countFiles;
  done
done