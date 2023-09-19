#!/usr/bin/env bash

# This script displays battery icon according to the charge level and charging state

# Author: Piotr Miller
# Hacked by:
# - Woynert
# e-mail: nwg.piotr@gmail.com
# Website: http://nwg.pl
# Project: https://github.com/nwg-piotr/tint2-executors
# License: GPL3

function is_bin_in_path {
  builtin type -P "$1" &> /dev/null
}

# dependencie acpi is in path

if ! is_bin_in_path acpi; then
    exit 1
fi

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
