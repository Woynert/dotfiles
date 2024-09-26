#!/usr/bin/env bash

# Explanation:
# For some reason with my AMD GPU when I shrink the resolution using xrandr, the border or empty
# parts of the screen remain unclean, this space will be glitchy and repeatedly flash the last two
# frames that were shown on the screen before the resolution change. The workaround is to show two
# different colors at full screen, both colors are different shades of black, so when the screen
# flashes between these two the glitch won't be perceptible.

# Some screen sizes:
# 1280 720
# 1366 768
# 1920 1080

SCREEN_W=1920
SCREEN_H=1080

screen_cut()
{
    echo "$1x$2"

    # center-center
    #diffH=$(((1920 - $1) / 2))
    #diffV=$(((1080 - $2) / 2))

    # center-bottom
    diffH=$(((SCREEN_W - $1) / 2))
    diffV=$(((SCREEN_H - $2)))

    xrandr --output HDMI-A-0 --mode 1920x1080 --panning 1920x1080
    sleep 1
    xrandr --output HDMI-A-0 --mode 1920x1080 --fb "$1x$2" --transform 1,0,-$diffH,0,1,-$diffV,0,0,1
}

IMAGE=/tmp/amd_black.png

# create blank image to being able too use feh
ffmpeg -y -f lavfi -i color=black:size=16x16 -vframes 1 "$IMAGE"

# fullscreen color one
feh -F -B '#000001' "$IMAGE" &
FEH_PID1=$!
sleep 0.3

# fullscreen color two
feh -F -B '#000000' "$IMAGE" &
FEH_PID2=$!
sleep 0.3

# change resolution
if [ "$1" == "reset" ]; then
    screen_cut $SCREEN_W $SCREEN_H
elif [ "$1" == "one" ]; then
    screen_cut 1366 768
else
    screen_cut $1 $2
fi

# kill feh
kill "$FEH_PID1"
kill "$FEH_PID2"

