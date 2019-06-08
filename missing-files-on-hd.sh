#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: `basename $0` FILES_ON_HD.tx"
  exit 0
fi

ls-size-and-time.sh | while read LINE; do 
  grep --silent "$LINE" $1 || echo "Missing $LINE"; 
done 
