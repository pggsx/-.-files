#!/bin/bash
# Git Clean up script to ensure symlinks are removed before commit
#
#
b=$1
bash_home="~/.bashrc"
curr_user="echo ~$(whoami)"
zsh_home="echo $curr_user/.zshrc"
echo "zsh home is: $zsh_home"
echo "$b was chosen"
DIFF1=$(diff vim/.vimrc ~/.vimrc)
DIFF3=$(diff .tmux.conf ~/.tmux.conf)
if [ "$1" == '-z' ]
then DIFF4=$(diff zsh/.zshrc ~/.zshrc)
fi
DIFF5=$(diff .tmuxline.conf ~/.tmux.conf)

if [[ $b == "" ]];
then 
	echo "Help Menu"
	echo "Usage: ./gitcleanup.sh [options]"
	echo "[options]: zsh, bash, -f"
	exit
fi
if [[ "$b" == "bash" ]];
then
	echo "halp"
	if [ -f  "$bash_home" ];
	then
		DIFF2=$(diff bash/.bashrc ~/.bashrc)
		if [ "$DIFF2" != "" ];
		then	
			cp ~/.bashrc bash/.bashrc
			unlink bash/bashrc-link
		fi
	else 
		echo "Bashrc doesn't exist! Exiting now!"
		exit
	fi
fi


if [ "$DIFF1" != "" ]
then	
	cp ~/.vimrc vim/.vimrc
	unlink vim/vimrc-link
fi


if [[ "$b" == "zsh" ]];
then
	ls $zsh_home
	if [ -f "$zsh_home" ];
	then
		DIFF2=$(diff bash/.zshrc ~/.zshrc)
		if [ "$DIFF2" != "" ];
		then	
			cp ~/.zshrc bash/.zshrc
			unlink zsh/zshrc-link
		fi
	else 
		echo "Zshrc doesn't exist! Exiting now!"
		exit
	fi
fi

if [ "$DIFF3" != "" ]
then	
	cp ~/.tmux.conf ~/github/dev_lunchbox/Linux
	unlink tmux-link
fi

if [ "$DIFF5" != "" ]
then	
	cp ~/.tmuxline.conf $(pwd)
	unlink tmuxline-link
fi

if [ "$1" == '-f' ]
then
	unlink vim/vimrc-link
	unlink /bash/bashrc-link
	unlink tmux-link
	unlink tmuxline-link
	unlink zshrc/zshrc-link
fi
