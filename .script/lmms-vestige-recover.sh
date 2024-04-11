#!/usr/bin/env bash

project=$1
lmms=$2
tmp_file=/tmp/lmms-tmp-project.mmp

if [ "$#" -eq 0 ]; then
    echo "usage: $0 [LMMS project path] [LMMS binary path]"
    exit 1
fi

if [ ! -e "$project" ]; then
    echo "Project file does not exist or not provided: '$project'"
    exit 1
fi

if [[ "$project" == *.mmpz ]]; then
    if [ ! -e "$lmms" ]; then
        echo "LMMS path not exist or not provided: '$lmms'"
        exit 1
    fi

    $lmms --dump $project > $tmp_file
    project=$tmp_file
fi

# 1. cat file
# 2. get interesting tags
# 3. remove the chunk attribute which is very long
# 4. highlight the lines with vestige

cat $project | grep -e '<track' -e '<instrumenttrack' -e '<vestige' | sed 's/chunk="[^"]*"//' | grep --color=always -e '^' -e '<vestige'
