#!/bin/bash

# Symlink important dot files to their concrete versions in the repo
 
cp ~/github/dev_lunchbox/Linux/bash/.bashrc ~/.bashrc
cp ~/github/dev_lunchbox/Linux/vim/.vimrc ~/.vimrc
cp ~/github/dev_lunchbox/Linux/tmux.conf ~/.tmux.conf
ln -sf  ~/.bashrc ~/github/dev_lunchbox/Linux/bash/bashrc-link
ln -sf  ~/.vimrc ~/github/dev_lunchbox/Linux/vim/vimrc-link
ln -sf  ~/.tmux.conf ~/github/dev_lunchbox/Linux/tmux-link
#if [ $( uname ) == 'Darwin' ]; then
#    ln -s ~/dev_lunchbox/osx/profile ~/.profile
#fi

# Install vim and friends
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall +qall
fi

# Source the bashrc we just pulled down
#source ~/.bashrc
