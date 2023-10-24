#/usr/bin/env sh

while ! pulseaudio --check
do
    echo "Waiting for pulseaudio"
    ((c++)) && ((c==20)) && c=0 && exit 1
    sleep 2
done

sleep 1
mpg123 $1
