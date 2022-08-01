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
alias tree='tree -C --dirsfirst'

#appimages / portable apps
alias godot='/appimages/Godot_v3.64'


# package manager
alias xinstall='xbps-install'
alias xquery='xbps-query -Rs'


# dotfiles
alias dot='git --git-dir="$HOME/.dot.git" --work-tree="$HOME"'
alias dotrm='dot rm -r --cached -f $HOME'

# docker
alias dockerremove='docker rm $(docker ps -qa)'