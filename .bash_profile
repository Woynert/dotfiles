# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc
[ -f $HOME/.bash_paths ] && . $HOME/.bash_paths

# env vars
RANGER_LOAD_DEFAULT_RC=FALSE

# Stop tty beep
setterm -blength 0

export PATH="$PATH:$HOME/.local/bin:$HOME/bin"
