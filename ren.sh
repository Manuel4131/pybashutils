#!/bin/bash

#don't mess with the quotes on $pat. You will need to "" quote your input pattern

pat=$1
[[ -z $pat ]] && { echo "must specify a file pattern to process. Glob inside double quotes *.png "; exit 1; }

for f in $(ls -A $pat); do
g=$(echo $f | sed -e 's/\.//') #removes first (leftmost) dot in filename. FFMPEG can handle only one dot in filename.
g=$(echo $g | sed -e 's/\:/-/g') #removes all colons in filename, which FFMPEG can't handle
#echo $g
mv -iv $f $g
done
