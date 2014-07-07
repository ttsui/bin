#!/bin/bash

ls -goR | awk -F' ' '{print $7" "$3}' | /usr/bin/grep -i -e '.MP4' -e '.JPG' | sort 
