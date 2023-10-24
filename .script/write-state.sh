#!/usr/bin/env bash

STATE_FILE=~/.local/share/woynert-state/state.json
echo "received ($1) and ($2)"

# create state file if it doesn't exists

if [ ! -f $STATE_FILE ] || [ ! -s $STATE_FILE ]; then
    echo {} > $STATE_FILE
fi

# validate input

if [ "$1" == "" ] || [ "$2" == "" ]; then
    echo Invalid input
    exit 1
fi

if jq ".$1 = \"$2\"" $STATE_FILE > /dev/null; then

    # completed successfully
    # overwrite source file

    jq ".$1 = \"$2\"" $STATE_FILE > /tmp/jqjsonfile
    mv /tmp/jqjsonfile $STATE_FILE
else
    echo "An error ocurred: $?"
    exit 1
fi
