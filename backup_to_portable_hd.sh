#!/bin/bash
SRC_DIR=`dirname $0`
DEST=/run/media/tony/External\ HD/backup/ 

$SRC_DIR/backup.sh "$DEST" $SRC_DIR/files-to-backup.txt $SRC_DIR/files-to-exclude.txt
