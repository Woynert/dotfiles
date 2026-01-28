#!/usr/bin/env bash

KEY="4g8Pb0XQ"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

function run {
	$@&
}

# For multi-instance apps
function run_one() {
	"${SCRIPT_DIR}/launch_clean.sh" "/tmp/${KEY}-${1}-${KEY}" $@ &
	#notify-send "/tmp/${KEY}-${1}-${KEY}" "$@"
}


# util
run_one xbindkeys 
run_one xfsettingsd -D --replace 
run_one lxpolkit 

# app
run_one volctl 
run_one flameshot 
run safeeyes

# visual
#run_one xfdesktop
run_one xfce4-screensaver
#run_one ~/.script/ui/stw-statusbar.sh
