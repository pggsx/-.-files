# Bash Configuration Files for Bash Shell
# 
# Lib path for rbenv libraries (not installed by default)
export PATH="$HOME/.rbenv/shims:$PATH"
# modified PS1 variable to be more minimalistics
export PS1='> '
# Lib path for rvm libraries (not installed by default)
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#Bash History Filesize (can be init'ed to 0 to prevent storing of history)
HISTFILESIZE=100000000

#source ~/bash.aliases for alias commands
source .bash.aliases
#Bash command History size (can be init'ed to 0 to prevent storing of history)
HISTSIZE=100000
#enable bash tab-completion
if [ -f /etc/bash_completion ]; then


	. /etc/bash_completion

fi

#source aliases
source ~/.bash.aliases
