#!/bin/bash

for i in "$@"; do mencoder -ovc xvid -xvidencopts bitrate=1796 -oac copy -o "${i%%.rec}.avi" "$i"; done
