launch_clean() {
    local lockfile="$1"
    shift
    local cmd=( "$@" )

    mkdir -p "$(dirname "$lockfile")"

    if [[ -f "$lockfile" ]]; then
        local old_pid
        old_pid=$(cat "$lockfile")

        if [[ "$old_pid" =~ ^[0-9]+$ ]] && kill -0 "$old_pid" 2>/dev/null; then
            echo "Restarting previous process $old_pid"

            kill "$old_pid"

            # Wait for clean exit
            for i in {1..20}; do
                kill -0 "$old_pid" 2>/dev/null || break
                sleep 0.1
            done

            # Force if needed
            kill -9 "$old_pid" 2>/dev/null || true
        else
            echo "Removing stale lockfile"
        fi

        rm -f "$lockfile"
    fi

    # Launch fresh
    "${cmd[@]}" &
    local new_pid=$!

    echo "$new_pid" > "$lockfile"
    echo "Started new process $new_pid"
}

launch_clean $@
