#!/bin/sh

/bin/pulseaudio --start &
/bin/xbindkeys &
/bin/xfsettingsd -D --replace &
/bin/volctl &
/bin/lxpolkit &
/bin/flameshot &
#~/.local/bin/grayon &
