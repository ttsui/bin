#!/bin/bash


# TODO: Make this optional
DEST=/local/tmp

for file_path; do
	echo "file = $file_path"
	file=${file_path##*/}
	WAV=${DEST}/${file%%.ogg}.wav
	MP3=${DEST}/${file%%.ogg}.mp3
	echo oggdec -o "$WAV" "$file_path"
	echo lame --preset standard "$WAV" "$MP3"
	echo rm -f "$WAV"
done
