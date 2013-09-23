#!/bin/bash

HOME=/home/tony
SRC=root@192.168.1.4:/mnt/pools/A/A0/Backups/Pictures/Photos
DEST="/mnt/Windows/Documents and Settings/Win7/My Documents/My Pictures"
DATE=`date +%Y-%m-%d`
LOG=$HOME/backup-from-nas-${DATE}.log

rsync --archive --recursive --no-relative --delete --verbose --itemize-changes --exclude="**/Archive/" "$SRC" "${DEST}/" 2>&1 | tee $LOG
