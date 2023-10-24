#!/usr/bin/env bash

STATE_FILE=~/.local/share/woynert-state/state.json

exec jq --raw-output ".$1" $STATE_FILE
