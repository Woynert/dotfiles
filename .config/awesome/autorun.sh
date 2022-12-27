#!/usr/bin/env bash
# https://github.com/raven2cz/awesomewm-config/blob/48194094ab4f9aa2985d50361c566756e12de0d1/autorun.sh
# if ! pgrep -f cloud-drive-ui; then synology-drive start; fi

# only one instance
function run {
	if ! pgrep -f $1 ;
	then
		$@&
	fi
}

#~/.local/bin/grayon &
run /bin/pulseaudio --start 
run /bin/xbindkeys 
run /bin/xfsettingsd -D --replace 
run /bin/volctl 
run /bin/lxpolkit 
run /bin/flameshot 
run /bin/runsvdir -P $HOME/servicex
