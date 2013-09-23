#!/bin/bash

DEST=$1
FILES_FROM=$2
EXCLUDES_FROM=$3
DATE=`date +%Y-%m-%d`
LOG=$HOME/backup-${DATE}.log


PROG=`basename $0`

print_usage()
{
	cat << EOF
Usage:
	$PROG DEST FILE_LIST_TO_BACKUP FILE_LIST_TO_EXCLUDE 
EOF
}

if [ $# != 3 ]; then
	print_usage
	exit 1
fi

rsync --archive --recursive --no-relative --delete --verbose -v --no-whole-file --exclude-from=$EXCLUDES_FROM --files-from=$FILES_FROM / "${DEST}/" 2>&1 | tee $LOG
#rsync --archive --no-owner --no-perms --no-group --recursive --no-relative --delete --verbose -v --no-whole-file --exclude-from=$EXCLUDES_FROM --files-from=$FILES_FROM / "${DEST}/" 2>&1 | tee $LOG
