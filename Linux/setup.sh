#!/bin/bash
MYSHELL=`echo $SHELL`
#Checks current shell
if [[ "$MYSHELL" == *"zsh"*	]]
then 
	echo "zsh found"
	echo "installing oh-my-zsh and additional configs and setup"
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	cp ~/github/dev_lunchbox/Linux/zsh/.zshrc	
	ln -sf  ~/.zshrc ~/github/dev_lunchbox/Linux/zshrc/zshrc-link
elif [ "$MYSHELL" == *"bash"*]
then 
	echo "Bash found"
	echo "Downloading Bash configs and setup"
	cp ~/github/dev_lunchbox/Linux/bash/.bashrc ~/.bashrc
	ln -sf  ~/.bashrc ~/github/dev_lunchbox/Linux/bash/bashrc-link
	source ~/.bashrc
else
	echo "unknown shell type"
fi

# Symlink important dot files to their concrete versions in the repo
cp ~/github/dev_lunchbox/Linux/vim/.vimrc ~/.vimrc
cp ~/github/dev_lunchbox/Linux/tmux.conf ~/.tmux.conf
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

#install bash-IDE support
cp bash-support.zip ~/.vim/
cd ~/.vim/
unzip bash-support.zip

#copy templates over
cp ~/github/dev_lunchbox/Linux/bash/vim/templates.zip ~/.vim/
cd ~/.vim/
unzip templates.zip
mv templates temp

#installs ALL LaTeX packages for Vim plugin compatibility
arch=$(uname -m)
kernel=$(uname -r)
if [ -f /etc/lsb-release ]; then
	os=$(lsb_release -s -d)
elif [ -f /etc/debian_version ]; then
	os="Debian $(cat /etc/debian_version)"
	sudo apt-get install texlive-full
	sudo apt-get install latexmk
elif [ -f /etc/redhat-release ]; then
	os=`cat /etc/redhat-release`
	sudo dnf install texlive-scheme-full
	sudo dnf install latexmk
else
	os="$(uname -s) $(uname -r)"
fi

