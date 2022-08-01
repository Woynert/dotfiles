#!/bin/bash

# This script displays battery icon according to the charge level and charging state

# Author: Piotr Miller
# e-mail: nwg.piotr@gmail.com
# Website: http://nwg.pl
# Project: https://github.com/nwg-piotr/tint2-executors
# License: GPL3

# Dependencies: `acpi`

bat=$(acpi -b)
state=$(echo ${bat} | awk '{print $3}')

if [[ "$state" = "Not" ]]; then
    level=$(echo ${bat} | awk '{print $5}')
    level=${level::-1}

else
    level=$(echo ${bat} | awk '{print $4}')
    if [[ "$state" == *"Unknown"* ]]; then
        level=${level::-1}
    else
        if [[ "$level" == "100%" ]]; then
          level=${level::-1}
        else
          level=${level::-2}
        fi
    fi
fi

if [[ "$bat" == *"until"* ]]; then
	level=↑$level
fi

echo ${level}%
