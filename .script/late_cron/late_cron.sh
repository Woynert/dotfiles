#!/usr/bin/env sh

# alert
$HOME/.script/late_cron/notify_shutdown.sh &

# grayscale
nvidia-settings -a [DPY:1]/DigitalVibrance=-800 &

# safeeyes
# safeeyes &

# sound 
mpg123 /usr/local/share/sounds/system/Notify.mp3 &
