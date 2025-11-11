#!/usr/bin/env bash
# Lists windows titles for current workspace

current_ws=$(wmctrl -d | awk '/\*/ {print $1}')

wmctrl -l | awk -v ws="$current_ws" '$2 == ws { $1=$2=$3=""; print substr($0,4) }'
