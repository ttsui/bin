#!/bin/bash

TARGET_URL=file:///media/UNTITLED/NAS/Backup

OPTS="--no-encryption --volsize 250"

duplicity $OPTS "/mnt/windows/Documents and Settings/Jenny/Pictures/Photos" ${TARGET_URL}/Photos
duplicity $OPTS "/mnt/windows/Documents and Settings/Jenny/Videos" ${TARGET_URL}/Videos
duplicity $OPTS --exclude /home/tony/Applications/ "/home/tony" ${TARGET_URL}/tony
