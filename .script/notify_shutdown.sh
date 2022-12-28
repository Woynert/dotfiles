#!/usr/bin/env sh
# ⏰️🕘️💤️☕️🏠️.🤕️🌘️🌓️🌙️💢️👁️🦉️🔪️

# 3 * 60 * 1000
option=$(notify-send \
	-u normal -t 180000 \
	-A "💤️ Apagar ahora mismo" \
	-A "🤕️ Esperar" \
	"🌙️ Es hora de apagar" \
	"\n- Ya son más de las 9:00 PM
- Continua mañana temprano con nuevas energias
- Evita tener contacto con luz artificial para dormir más facilmente
- Recuerda que ya no eres productivo a esta hora")

case $option in
0)
	echo "Poweroff"
	loginctl poweroff;;
1)
	echo "Postpone"
	notify-send -u normal -t 18000 "$(fortune)" ;;
esac
