#Aliases files for zshrc
alias p="pwd"
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
alias s="cd"
alias sp="cd && pwd"
alias shcl="truncate -s 0 .bash_history"

stu ()
{
	ssh $1@stu.cs.jmu.edu	
}
alias r="reset"
alias w="who"
alias sub=cd $submit
m ()
{
	"cd ../;
	make clean;
	make"
}
HISTFILESIZE=100000000
HISTSIZE=100000
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
