#!/bin/bash

# dotfiles installation script. 
# created by pez
# https://github.com/kptnpez/dotfiles

# installing applications" 
# pacman -s vim weechat ranger cmus i3 rxvt-unicode artwiz-fonts "

dir=$(pwd)	# saving pwd in var 'dir'
cd			# change directory to home
plugin_dir=$dir/.weechat/plugins # saving plugin folder

create() {
	# Checking for file, creating symlink
	if [ -h $1 ] # is file symlink?
	then
		echo "$1 is already a symlink!"
	else 
		if [ -f $1 ] # does file exist?
		then 
			mv $1 $1.backup # create a backup
		fi
		echo "creating symlinks for $1"
		ln -s $dir/$1 $2 
	fi
	echo "$1 done."
}

start_vim() {
	# Starting vim and give instructions so vundle can install the plugins
	echo "--------------------------------------------"
	echo "Starting Vim, ignore any Errors and type in"
	echo ":PluginInstall"
	echo "then exit vim."
	echo "Press any key to continue"
	read -p  "--------------------------------------------"
	vim
}

install_vimconf() {

	# installing vundle for vim
	if [ ! -d ~/.vim/bundle/Vundle.vim ]
	then
		echo "Installing Vundle"
		git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	else
		echo "Vundle already exists."
	fi

	create .vimrc ~/.vimrc

	echo "--------------------------------------------"
	read -p  "vim configs completly copied, press any key to continue"
	start_vim
}

install_weechat() {

	create .weechat/weechat.conf ~/.weechat/weechat.conf

	i=0	
	cd $plugin_dir #switching to plugin dir

	for f in *.pl; do # adding perl plugins to array
		plugins[i]=$f
		((i++))
	done

	for f in ${plugins[*]}; do	# copying files 
		if [ ! -f ~/.weechat/perl/autoload/$f ]
		then
			cp $f ~/.weechat/perl/autoload/
		else
			echo "$f exists"
		fi
	done
	
	echo "-----------------------------------------"
	read -p "weechat plugins copied, press any key to continue"
	
}

install_i3() {
	create .i3/config ~/.i3/config
	create .i3status.conf ~/.i3status.conf
}

install_xdefaults() {
	create .Xdefaults ~/.Xdefaults
}

install_weechat
#install_xdefaults
install_i3
#install_vimconf
