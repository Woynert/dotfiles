#!/usr/bin/env sh
free -h | awk 'NR != 1 {printf $3 " "}'
