#!/usr/bin/env sh
export LC_TIME=en_US.UTF-8
mem=$(~/.config/awesome/script/memory.sh)
date=$(date +"%a %b %d %H:%M")
win_titles=$(~/.script/ui/list-active-windows.sh)

printf "%s\n%s%s\n" "$win_titles" "$mem" "$date"
