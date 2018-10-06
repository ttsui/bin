#!/bin/bash

ls -lR | awk '{ print $5 " " $6 " " $7 " " $8 " "$9}'
