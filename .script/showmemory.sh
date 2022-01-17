#!/bin/bash

mem=`free | awk '/Mem/ {printf "%d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
echo "$mem"


