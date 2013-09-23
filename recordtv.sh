#!/bin/sh

CHANNEL=$1
FILE=${2}-`date +%Y-%m-%d`.mpg

# Use the remaining arguments as a time spec
shift 2
DURATION=$@

MPLAYER='mplayer dvb://'

if [ -a "$FILE" ]; then
	echo "The file: $FILE already exists"
	exit 0
fi

pkill -f "$MPLAYER"
sleep 1
pkill -f "$MPLAYER"

if [ -n "$DURATION" ]; then
	mplayer "dvb://${CHANNEL}" -dumpstream -dumpfile "${FILE}" &
	PID=$!
	echo "kill $PID; sleep 1; kill $PID" | at now + $DURATION
else
	mplayer "dvb://${CHANNEL}" -dumpstream -dumpfile "${FILE}"
fi

