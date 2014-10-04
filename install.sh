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
	ln -s $dir/.vimrc ~/.vimrc
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
	if [ -f .weechat/weechat.conf ]
	then 
		# weechat.conf found, creating backup"
		mv .weechat/weechat.conf .weechat/weechat.conf.backup
	fi

	# Creating new .weechat.conf
	ln -s $dir/weechat/weechat.conf ~/.weechat/weechat.conf

	# Copying Plugins 
	cp $dir/weechat/plugins/buffers.pl ~/.weechat/perl/autoload/buffers.pl
	cp $dir/weechat/plugins/iset.pl ~/.weechat/perl/autoload/iset.pl
	cp $dir/weechat/plugins/highmon.pl ~/.weechat/perl/autoload/highmon.pl
}

function ranger {
	echo "ranger!"
}

# lets execute the functions yay! 'Ö' 
install_vimconf
#start_vim
#install_weechat
