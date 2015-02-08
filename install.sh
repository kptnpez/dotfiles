#!/bin/bash

# dotfiles installation script. 
# created by pez
# https://github.com/kptnpez/dotfiles

# installing applications" 
# pacman -s vim weechat ranger cmus i3 rxvt-unicode artwiz-fonts "

dir=$(pwd)	# saving pwd in var 'dir'
cd			# change directory to home
plugin_dir=$dir/weechat/plugins # saving plugin folder

install_vimconf() {

	# installing vundle for vim
	if [ ! -d ~/.vim/bundle/Vundle.vim ]
	then
		echo "Installing Vundle"
		git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	else
		echo "Vundle already exists."
	fi

	# Checking Vimrc, creating symlink
	if [ -h .vimrc ]
	then
		echo ".vimrc is already a symlink!"
	else 
		if [ -f .vimrc ]
		then 
			# .vimrc found, creating backup"
			mv .vimrc .vimrc.backup
		fi
		# Creating new .vimrc
		echo "creating vim symlinks"
		ln -s $dir/.vimrc ~/.vimrc
	fi

	echo "-----------------------------------------"
	read -p  "vim configs copied, press any key to continue"

	start_vim
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
	if [ -f .weechat/weechat.conf ]
	then 
		# weechat.conf found, creating backup"
		mv .weechat/weechat.conf .weechat/weechat.conf.backup
	fi
	# Creating new .weechat.conf

	if [ ! -h .weechat/weechat.conf ] 
	then
		echo "creating symlink for weechat.conf"
		ln -s $dir/weechat/weechat.conf ~/.weechat/weechat.conf
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

install_i3() {
	# Checking i3 config , creating symlink
	if [ -h .i3/config ]
	then
		echo "i3config is already a symlink!"
	else 
		if [ -f .i3/config ]
		then 
			# config found, creating backup"
			mv .i3/config .i3/config.backup
		fi
			# Creating new config
			echo "creating i3config symlinks"
			ln -s $dir/i3/config ~/.i3/config
	fi
	echo "i3 config done."

	# Checking i3status.conf, creating symlink
	if [ -h .i3status.conf ]
	then
		echo "i3status.conf is already a symlink!"
	else
		if [ -f .i3status.conf ]
		then 
			# config found, creating backup"
			mv .i3status.conf .i3status.conf.backup
		fi
		# Creating new config
		echo "creating i3status.conf symlinks"
		ln -s $dir/i3/.i3status.conf ~/.i3status.conf
	fi
	echo "i3status.conf done."
}

install_xdefaults() {

	# Checking Xdefaults, creating symlink
	if [ -h .Xdefaults ]
	then
		echo ".Xdefaults is already a symlink!"
	else
		if [ -f .Xdefaults ]
		then 
			# .Xdefaults found, creating backup"
			mv .Xdefaults .Xdefaults.backup
		fi
		# Creating new .Xdefaults
		echo "creating Xdefault symlinks"
		ln -s $dir/.Xdefaults ~/.Xdefaults
	fi
}

create() {
	# Checking for file, creating symlink
	if [ -h $1 ]
	then
		echo "$1 is already a symlink!"
	else 
		if [ -f $1 ]
		then 
			# config found, creating backup"
			mv $1 $1.backup
		fi
		# Creating new config
		echo "creating $1 symlinks"
		ln -s $dir/i3/.$1 ~/.i3status.conf
	fi
	echo "$1 done."
}

# lets execute the functions yay! 'Ö' 
#install_weechat
#install_xdefaults
#install_i3
#install_vimconf
