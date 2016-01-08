#!/bin/bash
# Git Clean up script to ensure symlinks are removed before commit
#
#
DIFF1=$(diff $(pwd)/vim/.vimrc ~/.vimrc)
DIFF2=$(diff $(pwd)/bash/.bashrc ~/.bashrc)
DIFF3=$(diff $(pwd)/tmux.conf ~/.tmux.conf)
if [ "$1" == '-z' ]
then DIFF4=$(diff $(pwd)/zsh/.zshrc ~/.zshrc)
fi
DIFF5=$(diff $(pwd)/tmuxline.conf ~/.tmux.conf)

if [ "$DIFF1" != "" ]
then	
	cp ~/.vimrc $(pwd)vim/.vimrc
	unlink $(pwd)vim/vimrc-link
fi

if [ "$DIFF2" != "" ]
then	
	cp ~/.bashrc $(pwd)bash/.bashrc
	unlink $(pwd)bash/bashrc-link
fi
if [ "$DIFF3" != "" ]
then	
	cp ~/.tmux.conf ~/github/dev_lunchbox/Linux
	unlink $(pwd)/tmux-link
fi

if [[ "$1" == '-z'  && "$DIFF4" != "" ]]
then	
	cp ~/.zshrc $(pwd)/zsh/.zshrc
	unlink $(pwd)/zsh/zshrc-link
fi

if [ "$DIFF5" != "" ]
then	
	cp ~/.tmuxline.conf $(pwd)
	unlink $(pwd)/tmuxline-link
fi

if [ "$1" == '-f' ]
then
	unlink $(pwd)/vim/vimrc-link
	unlink $(pwd)/bash/bashrc-link
	unlink $(pwd)/tmux-link
	unlink $(pwd)/tmuxline-link
	unlink $(pwd)/zshrc/zshrc-link
fi
