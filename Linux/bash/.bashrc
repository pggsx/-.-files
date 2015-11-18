# Bash Configuration Files for Bash Shell
# 
# Lib path for rbenv libraries (not installed by default)
export PATH="$HOME/.rbenv/shims:$PATH"
# modified PS1 variable to be more minimalistics
export PS1='> '
# Lib path for rvm libraries (not installed by default)
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#LifeHackerTweaks Below 
#Various Alias command to navigate around directories and update/upgrades
alias where="pwd"
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias inst="sudo apt-get install"
alias search="apt-cache search"
alias remp="sudo aptitude purge"
alias ls="ls -al"
alias l="ls"
alias c="clear"
alias up="cd .."
alias home="cd ~"
alias disk="cd /"
alias trash="rm -fr ~/.Trash"
alias stu="ssh gudimepg@stu.cs.jmu.edu && reset"
alias r="reset"
#Bash History Filesize (can be init'ed to 0 to prevent storing of history)
HISTFILESIZE=100000000

#Bash command History size (can be init'ed to 0 to prevent storing of history)
HISTSIZE=100000
#enable bash tab-completion
if [ -f /etc/bash_completion ]; then


		. /etc/bash_completion

fi
#simple GPG encryption alias
encrypt ()

{

		gpg -ac --no-options "$1"

}


#simple GPG decryption alias
decrypt ()

{

		gpg --no-options "$1"

}
