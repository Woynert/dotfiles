#!/usr/bin/env bash

isNumber() {
    local re
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
        return 1
    fi
    return 0
}

default_width=1400
default_height=900

# read state

w=$(~/.script/read-state.sh screen_res_width)
h=$(~/.script/read-state.sh screen_res_height)

if ! isNumber $w || ! isNumber $h; then
    echo dafsd
    w=$default_width
    h=$default_height

    # save state
    ~/.script/write-state.sh screen_res_width "$w"
    ~/.script/write-state.sh screen_res_height "$h"
fi

# check res changed

curr_res=$(xrandr --query | grep " connected" | awk '{ print $4 }' | egrep -o '^[^+]+')
echo "$curr_res : ${w}x$h"

if [ $curr_res != "${w}x$h" ]; then

    diffH=$(((1920 - $w) / 2))
    diffV=$(((1080 - $h) / 2))

    nvidia-settings -a CurrentMetaMode="HDMI-0: 1920x1080+0+0 { ViewPortOut=${w}x$h+$diffH+$diffV }"

    xrandr --setmonitor my-monitor-$(uuidgen) $w/${w}x$h/$h+0+0 HDMI-0
fi


