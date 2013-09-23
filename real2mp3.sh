#!/bin/bash

FILE=${1%%.*}

mplayer ${1} -ao pcm:file=${FILE}.wav -vc dummy -vo null
if [ $? -ne 0 ]; then
	echo "$0: Failed to convert $1 to wav format."
	exit 1
fi

lame ${FILE}.wav ${FILE}.mp3
if [ $? -ne 0 ]; then
	echo "$0: Failed to convert $1 to mp3 format."
	exit 1
fi

rm -f ${FILE}.wav

id3tag -a $FILE
if [ $? -ne 0 ]; then
	echo "$0: Failed to tag ${FILE}.mp3"
	exit 1
fi
