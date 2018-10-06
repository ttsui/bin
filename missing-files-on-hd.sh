#!/bin/bash

ls-size-and-time.sh | while read LINE; do 
  grep --silent "$LINE" $1 || echo "Missing $LINE"; 
done 
