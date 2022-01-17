#!/bin/sh
# Show time and volume

VOL=$(pamixer --get-volume)
LOCALTIME=$(date '+%I:%M %P   %d/%m/%Y')
MEM=`free | awk '/Mem/ {printf "%d MiB\n", $3 / 1024.0, $2 /1024.0 }'`

xsetroot -name "$MEM   $VOL%   $LOCALTIME"

