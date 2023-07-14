#system
alias ols='\ls --group-directories-first --color=auto'
alias ls='ls --group-directories-first --color=auto -X -1'
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
alias timer='termdown -c 60 --no-figlet -a'
alias grep='grep --color=auto'
alias diff='diff --color=always'
alias quickhtml='python3 -m http.server 8000'
alias swapreset='sudo swapoff -a && sudo swapon -a'
alias lf1='lf -command "set nopreview; set ratios 1"'
alias lf2='lf -command "set ratios 1:3"'
alias ips="ip ad 2> /dev/null | grep inet | awk '{print \$1, \$2}'"

#appimages / portable apps
alias godot='/appimages/Godot_v3.64'
alias godot4='/appimages/Godot_misc/Godot_v4.1-stable_linux.x86_64/Godot_v4.1-stable_linux.x86_64'


# package manager
alias xinstall='xbps-install'
alias xquery='xbps-query -Rs'
alias xqueryl='xbps-query -s'


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

