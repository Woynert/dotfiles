#!/usr/bin/env bash

# if takes more than 10 seconds, die

timeout 10s `which tasks1` tasks list MDY0MzUyMTk2OTI2MDkzMzMyNjk6MDow | jq --compact-output --raw-output '.items[] | { a:.due, b:.title } | join(" ") ' | sort | awk '
{
    cmd = "date -d \""$1"\" +\"%B %d\" | cat"; if ( (cmd | getline line) > 0 ) $1=line; close(cmd)
    printf $1 " @";
    for (i=2; i<NF; i++) printf $i " "; print $NF
} ' 2>/dev/null | column -t -s'@'
