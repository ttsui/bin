#!/bin/sh
OUTPUT=`basename ${!#}`

mplayer -noframedrop -dumpfile $OUTPUT -dumpstream  $@

real2mp3.sh $OUTPUT
