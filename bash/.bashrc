#!/bin/bash

# Set the prompt.
export PS1="[\A] \w >\[$(tput sgr0)\] "

# Force steam scaling (undo hidpi correction)
export GDK_SCALE=1

# Set nvim as editor.
export EDITOR="nvim"

# Add ~/bin to path
PATH="$PATH:$HOME/bin"

# Set XDG_CONFIG_HOME
export XDG_CONFIG_HOME="${HOME}/.config"

# Set XDG_CACHE_HOME
export XDG_CACHE_HOME="${HOME}/.cache"

# Force nvidia shader disk cache location
export __GL_SHADER_DISK_CACHE_PATH=XDG_CACHE_HOME

# History completion.
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Don't log duplicate commands.
export HISTCONTROL=ignoredups

# Check window size after every command
shopt -s checkwinsize

# Enable extended globbing allowing composite patterns
shopt -s extglob

complete -d cd

# ALIASES
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# git hub autocompletions
if [ -f ~/dotfiles/git/.hub.bash_completion ]; then
  source ~/dotfiles/git/.hub.bash_completion
fi

if [ "$HOSTNAME" = archy ]; then
	export MONITOR1="DVI-I-1"
	export MONITOR2="DVI-D-0"
else
	export MONITOR1="DP-2"
	export MONITOR2="DP-4"
fi

# Source git autocompletions
source /usr/share/bash-completion/completions/git

umask 027
