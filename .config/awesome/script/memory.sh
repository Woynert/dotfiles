#!/usr/bin/env sh
mem=$(free -h | awk 'NR == 2 {print $3}')
swap=$(free -h | awk 'NR == 3 {print $3}')
printf "$mem, $swap"
