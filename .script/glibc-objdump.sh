#!/usr/bin/env sh
objdump -T $1 | grep GLIBC | awk '{print $5,"\t",$6}' | sort -V
