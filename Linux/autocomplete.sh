#!/bin/bash
#enters repo
cd ~/.vim/bundle/YouCompleteMe

#update YouCompleteMe Repo
git submodule update --init --recursive

#install with all language features
if [ "$1" == "-a" ]
then
	./install.py --clang-completer --omnisharp-completer --gocode-completer --tern-completer
fi
# no C# for me lol xD
./install.py --clang-completer --gocode-completer --tern-completer
