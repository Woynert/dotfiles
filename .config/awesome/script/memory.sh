#!/bin/sh
echo `free -h | tail -n 2 | head -n 1 | awk '{print $3}'`