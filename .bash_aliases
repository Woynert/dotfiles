# system
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias ols='\ls --group-directories-first --color=auto -X'
alias ls='ls --group-directories-first --color=auto -1'
alias nano='nano -a -j -x -T 4 -$ -U -i'
alias c='clear &&'
alias cls='clear && ls'
alias rm='trash'
alias rmls='trash-list | sort'
alias lxcls='lxc list -c ns4'
alias vsv='sudo vsv'
alias vsvu='\vsv -d ~/service'
alias vsvx='\vsv -d ~/servicex'
alias tree='tree -C --dirsfirst'
alias grep='grep --color=auto'
alias diff='diff --color=always'
alias quickhtml='python3 -m http.server 8000'
alias swapreset='sudo swapoff -a && sudo swapon -a'
alias lf1='lf -command "set nopreview; set ratios 1"'
alias lf2='lf -command "set ratios 1:3"'
alias ips="ip ad 2> /dev/null | grep inet | awk '{print \$1, \$2}'"
alias vims="steam-run vim"
alias xkill9="kill -9 \$(xprop | grep PID | awk '{print \$3}')"

# package manager
alias xinstall='xbps-install'
alias xquery='xbps-query -Rs'
alias xqueryl='xbps-query -s'

# nix
alias nixquery='nix --extra-experimental-features nix-command --extra-experimental-features flakes search nixpkgs'

# git
alias gs="git status"

# dotfiles
alias dot='git --git-dir="$HOME/.dot.git" --work-tree="$HOME"'
alias dotrm='dot rm -r --cached -f $HOME'

# docker
alias dockerremove='docker rm $(docker ps -qa)'

docker-ips() {
	for conId in $(docker ps -q); do
		printf "$conId "
		docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} {{.Name}}' $conId
		#docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} {{.Id}}' $(docker ps -q)
	done
}

xqueryex() {
	xbps-query -Rs $1 | awk '{ print $1,$2 }' | grep $1
}

# navigation

# cd to next     directory in stack (left  rotate)
ncd(){ pushd +1 > /dev/null ; }
# cd to previous directory in stack (right rotate)
pcd(){ pushd -0 > /dev/null ; }

vimfzf() {
	file=$(fzf)
	echo $file
	vim $file
}

# =============== tmux ================

# Create or attach

tmuxmirror () {
    SESSION="$*"
    if [ -z "$SESSION" ]; then
        if [ -n "$(tmux ls)" ]; then
            SESSION=$(tmux list-sessions -F '#{session_group} (#{session_group_attached} clients)' \
                | uniq | fzf --height 10  --prompt "Choose session group (^C to cancel): " \
                | sed 's/ \S* \S*$//'
            )
        fi
    fi
    if [ -n "$SESSION" ]; then
        if [ -z "$TMUX" ];then
            tmux a -t "$SESSION" || tmux new -t "$SESSION"
        else 
            NEW_S=$(tmux new-session -d -P -t "$SESSION")
            tmux switch-client -t "$SESSION"
        fi
    fi
}

# Join to an existing session group
# TODO: Show #{session_attached_list}

tjoin () {
    if [ -n "$(tmux ls)" ]; then
        SESSION=$(tmux list-sessions -F '#{session_group} (#{session_group_attached} clients)' \
            | uniq | fzf --height 10  --prompt "Choose session group (^C to cancel): " \
            | sed 's/ \S* \S*$//'
        )
    fi
    if [ -n "$SESSION" ]; then
        if [ -z "$TMUX" ];then
            # To create OR attach to the session group
            tmux new-session -t "$SESSION"
        else 
            NEW_S=$(tmux new-session -d -P -t "$SESSION")
            tmux switch-client -t "$NEW_S"
        fi
    fi
}

# https://github.com/tmux/tmux/issues/2346

tmux-kill-group () {
	local GROUP="$*"
	tmux list-sessions -F '#{session_group} #{session_name}' \
		| grep "^$GROUP " | sed "s/$GROUP //" \
		| while read -r SESSION; do
			echo "Killing $SESSION"
			tmux kill-session -t "$SESSION"
		done
}
