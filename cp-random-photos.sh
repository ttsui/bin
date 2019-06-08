#!/bin/bash

set -e

if [ $# -ne 2 ]; then
  echo "Usage: `basename $0` LIST_OF_FILES.txt DEST"
  exit 0
fi

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
