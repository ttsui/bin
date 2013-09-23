#!/bin/bash

HOME=/home/tony
DEST=root@192.168.1.4:/mnt/pools/A/A0/Backups/
FILES_FROM=$HOME/Applications/bin/files-to-backup.txt
EXCLUDES_FROM=$HOME/Applications/bin/files-to-exclude.txt
DATE=`date +%Y-%m-%d`
LOG=$HOME/backup-${DATE}.log


rsync --archive --recursive --no-relative --delete -v -v --exclude-from=$EXCLUDES_FROM --files-from=$FILES_FROM / "${DEST}/" 2>&1 | tee $LOG
