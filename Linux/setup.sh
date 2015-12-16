#!/bin/bash

# Symlink important dot files to their concrete versions in the repo
ln -s ~/dev_lunchbox/bash/bashrc ~/.bashrc
ln -s ~/dev_lunchbox/vimrc ~/.vimrc
ln -s ~/dev_lunchbox/tmux.conf ~/.tmux.conf
if [ $( uname ) == 'Darwin' ]; then
    ln -s ~/dev_lunchbox/osx/profile ~/.profile
fi

# Install vim and friends
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall +qall
fi

# Source the bashrc we just pulled down
source ~/.bashrc
