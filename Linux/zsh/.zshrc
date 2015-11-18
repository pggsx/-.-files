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

#Alias Commands
alias p="pwd"
alias update="sudo dnf update"
alias upgrade="sudo dnf upgrade"
alias inst="sudo dnf install"
alias search="sudo dnf search"
alias remp="sudo dnf purge"
alias ls="ls -al"
alias l="ls"
alias c="clear"
alias up="cd .."
alias home="cd ~"
alias disk="cd /"
alias trash="shred -f ~/.Trash"
alias stu="ssh gudimepg@stu.cs.jmu.edu && reset"
alias r="reset"
export TERM='xterm-256color'

#update of PS1 variable
function _update_ps1()
{
    export PROMPT="$(~/powerline-zsh.py $?)"
}
precmd()
{
    _update_ps1
}
#export Go src location
export GOPATH ~/github/fun-with-go/
