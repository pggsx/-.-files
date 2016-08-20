#!/bin/bash
# Git Clean up script to ensure symlinks are removed before commit
#
#
function genericconf() {
	echo "inside of genericcon"
	DIFF1=$(diff vim/.vimrc ~/.vimrc)
	DIFF3=$(diff .tmux.conf ~/.tmux.conf)
	DIFF5=$(diff .tmuxline.conf ~/.tmux.conf)
	if [ "$DIFF1" != "" ]
	then	
		cp ~/.vimrc vim/.vimrc
	fi
	if [ "$DIFF3" != "" ]
	then	
		cp ~/.tmux.conf . 
	fi

	if [ "$DIFF5" != "" ]
	then	
		cp ~/.tmuxline.conf .
	fi
	unlink vim/vimrc-link
	unlink tmux-link
	unlink tmuxline-link
}

function main(){
	b=$1


	if [ $b == "" ] || [ $b != "bash" ] || [$b !="zsh" || $b != "-f"	];
	then 
		echo "Help Menu"
		echo "Usage: ./gitcleanup.sh [options]"
		echo "[options]: zsh, bash, -f"
		exit
	fi

	if [[ "$b" == "bash" ]];
	then
		if [ -f  ~/.bashrc ];
			DIFF2=$(diff bash/.bashrc ~/.bashrc)
		then
			if [ "$DIFF2" != "" ];
			then	
				cp ~/.bashrc bash/.bashrc
				unlink bash/bashrc-link
			fi
			genericconf	
		else 
			echo "Bashrc doesn't exist! Exiting now!"
			exit
		fi
	fi



	if [[ "$b" == "zsh" ]];
	then
		if [ -f ~/.zshrc ];
		then
			DIFF4=$(diff zsh/.zshrc ~/.zshrc)
			if [ "$DIFF4" != "" ];
			then	
				cp ~/.zshrc zsh/.zshrc
				unlink zsh/zshrc-link
			fi
			genericconf 
		else
			echo "Zshrc doesn't exist! Exiting now!"
			exit
		fi
	fi

	if [ "$1" == '-f' ]
	then
		unlink vim/vimrc-link
		unlink bash/bashrc-link
		unlink tmux-link
		unlink tmuxline-link
		unlink zsh/zshrc-link
	fi
	echo "Removed Symlinks"

}
main $@
