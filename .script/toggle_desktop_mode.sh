#!/bin/bash

# requires:
# wmctrl
# awk

# MODE=`wmctrl -m | grep 'mode:' | awk '{ print $7 }'`

if wmctrl -m | grep "mode: ON"; then
  exec wmctrl -k off
else
  exec wmctrl -k on
fi
