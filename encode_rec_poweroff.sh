#!/bin/bash
guppy
ls -1 *.rec  > files.txt
rec2mp4  files.txt
sudo pm-hibernate

