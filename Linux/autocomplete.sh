#!/bin/bash
#enters repo
cd ~/.vim/bundle/YouCompleteMe

#clone repo into vim
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle

#update YouCompleteMe Repo
git submodule update --init --recursive

#install with all language features
#./install.py --clang-completer --omnisharp-completer --gocode-completer --tern-completer

# no C# for me lol xD
./install.py --clang-completer --gocode-completer --tern-completer
