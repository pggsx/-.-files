#!/bin/bash
MYSHELL=`echo $SHELL`
#Checks current shell
if [[ "$MYSHELL" == *"zsh"*	]]
then 
	echo "zsh found"
	echo "installing oh-my-zsh and additional configs and setup"
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	cp zsh/.zshrc	
	ln -sf $(pwd)zsh/zshrc-link
elif [[ "$MYSHELL" == *"bash"* ]]
then 
	echo "Bash found"
	echo "Downloading Bash configs and setup"
	cp bash/.bashrc ~/.bashrc
	cp bash/.bash.aliases ~/.bash.aliases
	ln -sf ~/.bashrc $(pwd)/bash/bashrc-link
	ln -sf ~/.bash.aliases $(pwd)/bash/bash-aliases-link
	source ~/.bashrc
else
	echo "unknown shell type"
fi

# Symlink important dot files to their concrete versions in the repo
cp vim/.vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf
cp .tmuxline.conf ~/.tmuxline.conf
ln -sf ~/.vimrc $(pwd)/vim/vimrc-link
ln -sf ~/.tmux.conf $(pwd)/tmux-link
ln -sf ~/.tmuxline.conf $(pwd)/tmuxline-link

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
cp $(pwd)bash/bash-support.zip ~/.vim/
cd ~/.vim/
unzip bash-support.zip

#copy templates over
cd -
cp $(pwd)/vim/templates.zip ~/.vim/
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

