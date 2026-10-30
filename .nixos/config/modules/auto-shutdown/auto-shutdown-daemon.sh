#!/usr/bin/env bash

# target time

destHour=21
destMin=0
destDate=0

tick() {
	if [ $(date +%H) -ge $destHour ]; then
		echo "I: Poweroff"
		poweroff
		exit 0
	fi
}

# daemon loop

while [[ 1 ]]; do
	sleep 60
	tick
done
