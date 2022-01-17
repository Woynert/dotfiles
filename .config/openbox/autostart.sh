
pulseaudio --start &


# System

nitrogen --restore &
tint2 &
xbindkeys &

sleep 1s &&

jgmenu --hide-on-startup &

sleep 1s &&

xfsettingsd & #settings manager

sleep 1s &&

lxpolkit &

dunst &

sleep 1s &&

flameshot &

GTK_THEME=Yaru-Orange-dark volumeicon &

GTK_THEME=Yaru-Orange-dark nm-applet &

sleep 5s &&

picom &
#xsnow -bg SkyBlue3 &
