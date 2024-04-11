#!/usr/bin/env bash

# target time

destHour=20
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
	sleep 10
	tick
done
