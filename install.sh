#!/bin/bash

# dotfiles installation script. 
# created by pez
# https://github.com/kptnpez/dotfiles

# installing applications" 
# pacman -s vim weechat ranger"

dir=$(pwd)	# saving pwd in var 'dir'
cd			# change directory to home
plugin_dir=$dir/weechat/plugins # saving plugin folder

install_vimconf() {

	# installing vundle for vim
	if [ ! -d ~/.vim/bundle/vundle.vim ]
	then
		echo "Installing Vundle"
		git clone https://github.com/gmarik/vundle.vim.git ~/.vim/bundle/vundle.vim
	else
		echo "Vundle already exists."
	fi

	# Checking Vimrc, creating symlink
	if [ -h .vimrc ]
	then
		echo ".vimrc is already a symlink!"
	elif [ -f .vimrc ]
	then 
		# .vimrc found, creating backup"
		mv .vimrc .vimrc.backup
	else
		# Creating new .vimrc
		echo "creating vim symlinks"
		ln -s $dir/.vimrc ~/.vimrc
	fi

	echo "-----------------------------------------"
	read -p  "vim configs copied, press any key to continue"
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

install_weechat() {
	if [ -h .weechat/weechat.conf ]
	then
		echo "weechcat.conf is already a symlink!"
	elif [ -f .weechat/weechat.conf ]
	then 
		# weechat.conf found, creating backup"
		mv .weechat/weechat.conf .weechat/weechat.conf.backup
	else
		# Creating new .weechat.conf
		if [ ! -h .weechat/weechat.conf ] && [ ! -f .weechat/weechat.conf ]
		then
			echo "creating symlink for weechat.conf"
			ln -s $dir/weechat/weechat.conf ~/.weechat/weechat.conf
		fi
	fi

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
	read -p "weechat configs copied, press any key to continue"
	
}

install_ranger() {
	echo "Ranger! wuhu :)" 
}

install_cmus() {
	echo "cmus, yeaaa"
}


# lets execute the functions yay! 'Ö' 
install_vimconf
install_weechat
start_vim
