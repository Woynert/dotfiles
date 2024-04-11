#!/usr/bin/env bash
# This script displays battery icon according to the charge level and charging state
# Author: Piotr Miller
# Hacked by: Woynert
# e-mail: nwg.piotr@gmail.com
# Website: http://nwg.pl
# Project: https://github.com/nwg-piotr/tint2-executors
# License: GPL3

acpi_output=$(acpi -b)

if [[ $? -ne 0 ]]; then
    exit 1
fi

state=$(echo ${acpi_output} | awk '{print $3}')

if [[ "$state" = "Not" ]]; then
    level=$(echo ${acpi_output} | awk '{print $5}')
    level=${level::-1}

else
    level=$(echo ${acpi_output} | awk '{print $4}')
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

if [[ -z $level ]]; then
    exit 1
fi

if [[ "$acpi_output" == *"until"* ]]; then
	level=↑$level
fi

level=98
echo " ${level}%"
