#!/usr/bin/env bash

echo "$1x$2"
diffH=$(((1920 - $1) / 2))
diffV=$(((1080 - $2) / 2))

#xrandr --output HDMI-0 --mode 1920x1080 --panning 1920x1080
#sleep 2
#xrandr --output HDMI-0 --mode 1920x1080 --fb "$1x$2" --transform 1,0,-$diffH,0,1,-$diffV,0,0,1
#curr_res=$(xdpyinfo | awk '/dimensions/{print $2}')
#curr_res=$(xrandr --query | grep -A 1 connected | grep -v connected | head -1 | awk '{print $1}')
#curr_res=$(xrandr --query | grep " connected" | awk '{ print $4 }' | egrep -o '^[^+]+')

# read state
curr_res=$(~/.script/read-state.sh screen_res)

echo "$curr_res $1x$2"

# check conf changed

if [ $curr_res != "$1x$2" ]; then

    nvidia-settings -a CurrentMetaMode="HDMI-0: 1920x1080+0+0 { ViewPortOut=$1x$2+$diffH+$diffV }"

    xrandr --setmonitor my-monitor-$(uuidgen) $1/$1x$2/$2+0+0 HDMI-0

    # save state
    ~/.script/write-state.sh screen_res "$1x$2"

    # apply wallpaper
    sleep 2 &&
    nitrogen --restore
fi


