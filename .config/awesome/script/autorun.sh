#!/usr/bin/env bash
# https://github.com/raven2cz/awesomewm-config/blob/48194094ab4f9aa2985d50361c566756e12de0d1/autorun.sh
# if ! pgrep -f cloud-drive-ui; then synology-drive start; fi

function run {
	$@&
}

# only one instance
function run_one {
	if ! pgrep -f $1 ;
	then
		$@&
	fi
}

run_one /bin/pulseaudio --start 
run_one /bin/picom

run_one /bin/xbindkeys 
run_one /bin/xfsettingsd -D --replace 

run_one /bin/volctl 
run_one /bin/lxpolkit 
run_one /bin/flameshot 
run_one /bin/runsvdir -P $HOME/servicex

# text widgets
killall stw
sleep 5 && run \
	/usr/local/bin/stw -F 'carlito:size=16' -A 0.1 -p 10 -f '#F8CB00' -b black -B 5 -- cat ~/today.md \
	&
sleep 5 && run \
	/usr/local/bin/stw -F 'carlito:size=16' -A 0.1 -p 20 -f '#F8CB00' -b black -B 5 -x 100% -X -100% -- ~/.local/bin/gtasks-pretty.sh \
	&

run_one /bin/safeeyes

# startup sound
sleep 2 && run /bin/mpg123 /usr/local/share/sounds/system/Login2.mp3 &

# visual
#~/.local/bin/grayon &
#run /bin/nitrogen --restore
