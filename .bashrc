#  /| ､      
# (°､ ｡ 7   
#  |､  ~ヽ 
#  じしf_,)〳

# if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# tmux session
[ -z "$TMUX" ] && command -v tmux > /dev/null 2>&1 && tmux new-session -t global

# append to the history file, don't overwrite it
shopt -s histappend
# check the window size after each command
shopt -s checkwinsize
# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	# different prompt for ssh
	PS1='\[\033[01;33m\]\w\[\033[01;34m\]$(__git_ps1 " %s")\[\033[33m\]\$\[\033[00m\] '
else
    PS1='\[\033[01;34m\]$(if [ "$?" -ne "0" ]; then printf "\[\e[0;35m\]"; fi)>>> \w\[\033[00m\]$(__git_ps1 " %s")\n\[\033[00m\]$ '
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export HISTSIZE=100000
export HISTFILESIZE=200000
export HISTCONTROL=ignoredups:erasedups # avoid duplicate entries
export EDITOR=vim
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.script"

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_paths ] && source ~/.bash_paths

eval "$(zoxide init bash)"
source ~/.git-prompt.sh
