#!/bin/bash

set -e

ALL_FILES=$1
DEST=$2


RANDOM_FILES=random-files.txt

sort -R $ALL_FILES | grep -i '.jpg'  | head -n 1000 > $RANDOM_FILES

TO_COPY_FILE="to-copy-to-frame.txt"
rm -f $TO_COPY_FILE 

while read FILE; do 
  ORIENTATION=`mdls --name kMDItemOrientation "$FILE"`

  if [ "$ORIENTATION" = 'kMDItemOrientation = 0' ]; then
    echo $FILE >> $TO_COPY_FILE
  fi
done < $RANDOM_FILES

rsync -v --files-from=$TO_COPY_FILE / "$2"
