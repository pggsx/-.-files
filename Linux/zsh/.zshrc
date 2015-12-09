#!/bin/zsh
# zsh shell configuration files
#

# Simple PS1 export for a more minimalized look 
export PS1=" > "
# Auto tab and command completion init and 
autoload -U compinit
compinit
setopt correctall
autoload -U promptinit
promptinit
# Set max command history list size
export HISTSIZE=1000
# Set max command history list size
export HISTFILE="$HOME/.history"
#sets up zsh auto ignore and other zsh-related capabilities
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt autocd
setopt extendedglob

#export Go src location
export GOPATH ~/github/fun-with-go/
