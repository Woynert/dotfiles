#!/usr/bin/env bash
# ⏰️🕘️💤️☕️🏠️.🤕️🌘️🌓️🌙️💢️👁️🦉️🔪️
# 3 * 60 * 1000

# https://unix.stackexchange.com/questions/596194/absolute-value-of-number
abs() {
	echo "${1##*[+-]}"
}

# calculate time left till wake up
destHour=6
destMin=0
destDate=0

if [[ $(date +%H) -gt $destHour ]]; then

	# get next day at 6am
	# destDate = currDate.dateOnly + 1day + desHour * 360000
	
	destDate=`date -d "$(date +%D) 01:00:00" +%s`
	destDate=$(( destDate + 86400 ))
	destDate=`date -d "$(date --date=@$destDate +%D) $destHour:$destMin:00" +%s`
else
	# get same day at 6am
	# destDate = currDate.date + destHour * 360000
	
	destDate=`date -d "$(date +%D) 01:00:00" +%s`
	destDate=`date -d "$(date --date=@$destDate +%D) $destHour:$destMin:00" +%s`
fi

# calculate difference

dateDiff=`date --date=@$(( destDate - $(date +%s) )) +%s`
hours=$(( dateDiff / 60 / 60 ))
minutes=$(( (dateDiff / 60) - hours*60 ))
echo "$hours:$minutes"

# show notification

option=$(notify-send \
	-u normal -t 180000 \
	-A "💤️ Terminar" \
	-A "👁️ Seguir" \
	"$hours horas y $minutes minutos para las $destHour AM.")

case $option in
0)
	echo "Poweroff"
	sleep 1
	notify-send -u normal -t 2000 "Gracias"
	sleep 2
	notify-send -u normal -t 20000 "$(fortune)"
	sleep 20
	loginctl poweroff
	;;
1)
	echo "Postpone"
	notify-send -u normal -t 18000 "$(fortune)"
	;;
esac
