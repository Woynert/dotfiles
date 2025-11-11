#!/usr/bin/env bash

# from https://gist.github.com/ElfSundae/92a5868f418ec3187dfff90fe6b20387

remote=origin;

for brname in `git branch -r | grep $remote | grep -v /master | grep -v /HEAD | awk '{gsub(/^[^\/]+\//,"",$1); print $1}'`;
    do git branch --track $brname $remote/$brname || true;
done


# git fetch --all
# git pull --all

GREEN="\033[0;33m"
NOCOL="\033[0m"
printf "Now you can run ${GREEN}git fetch --all${NOCOL} and then ${GREEN}git pull --all${NOCOL}\n"

