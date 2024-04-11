#!/usr/bin/env bash
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

# util
run_one xbindkeys 
run_one xfsettingsd -D --replace 
run_one lxpolkit 

# app
run_one volctl 
run_one flameshot 
run_one safeeyes

# visual
run_one xfce4-screensaver
run_one xfdesktop
