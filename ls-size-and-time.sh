#!/bin/bash

ls -lR | gawk 'match($0, /staff(.*)/, a) {print a[1]}'
