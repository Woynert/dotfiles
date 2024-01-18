#/usr/bin/env sh

isNumber() {
    local re
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
        return 1
    fi
    return 0
}

if ! isNumber $1 || ! isNumber $2; then
    echo "Wrong arguments" >&2; exit 1
fi

write-state.sh screen_res_width $1
write-state.sh screen_res_height $2
