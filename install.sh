#!/bin/bash

# dotfiles installation script. 
# created by pez
# https://github.com/kptnpez/dotfiles

# Installing applications" 
# pacman -S vim weechat ranger"

dir=$(pwd)	# saving pwd in var 'dir'
cd			# change directory to home

# Using functions for more flexibility 

function install_vimconf {
	if [ -h .vimrc ]
	then
		echo ".vimrc is already a symlink!"
	elif [ -f .vimrc ]
	then 
		# .vimrc found, creating backup"
		mv .vimrc .vimrc.backup
	fi

	# Installing vundle for vim
	if [ -d ~/.vim/bundle/Vundle.vim ]
	then
		echo "---------------------------------------------------"
		echo "Vundle already exist. Skipping Vundle installation."
	else
		git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	fi
	# Creating new .vimrc
	if [ ! -h .vimrc ] && [ ! -f .vimrc ]
	then
		echo "creating vim symlinks"
		ln -s $dir/.vimrc ~/.vimrc
	fi

	echo "-----------------------------------------"
	read -p  "vim configs copied, press any key to continue"
}

function start_vim {
	# Starting Vim 
	echo "--------------------------------------------"
	echo "Starting Vim, ignore any Errors and type in"
	echo ":PluginInstall"
	echo "then exit vim."
	echo "Press any key to continue"
	echo "--------------------------------------------"
	read 
	vim
}

function install_weechat {
	if [ -h .weechat/weechat.conf ]
	then
		echo "weechcat.conf is already a symlink!"
	elif [ -f .weechat/weechat.conf ]
	then 
		# weechat.conf found, creating backup"
		mv .weechat/weechat.conf .weechat/weechat.conf.backup
	fi

	# Creating new .weechat.conf
	if [ ! -h .vimrc ] && [ ! -f .vimrc ]
	then
		echo "creating symlink for weechat.conf"
		ln -s $dir/weechat/weechat.conf ~/.weechat/weechat.conf
	fi

	# Copying Plugins 
	if [ ! -f .weechat/perl/autoload/buffers.pl ]
	then
		cp $dir/weechat/plugins/buffers.pl ~/.weechat/perl/autoload/buffers.pl
	fi

	if [ ! -f .weechat/perl/autoload/iset.pl ]
	then
		cp $dir/weechat/plugins/iset.pl ~/.weechat/perl/autoload/iset.pl
	fi
	
	if [ ! -f .weechat/perl/autoload/iset.pl ]
	then
		cp $dir/weechat/plugins/highmon.pl ~/.weechat/perl/autoload/highmon.pl
	fi

	echo "-----------------------------------------"
	read -p "weechat configs copied, press any key to continue"
	
}

function ranger {
	echo "ranger!"
}

# lets execute the functions yay! 'Ö' 
install_vimconf
install_weechat
start_vim
