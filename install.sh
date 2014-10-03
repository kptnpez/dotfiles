#!/bin/bash

# dotfiles installation script. 
# created by pez
# https://github.com/kptnpez/dotfiles

# Installing applications" 
# pacman -S vim weechat ranger"

dir=$(pwd)	# saving pwd in var 'dir'
cd			# change directory to home

# Searching config files"
if [ -f .vimrc ]
then 
	# .vimrc found, creating backup"
	mv .vimrc .vimrc.backup
fi

# Creating new .vimrc
cp $dir/.vimrc ~/.vimrc


if [ -f .weechat/weechat.conf ]
then 
	# weechat.conf found, creating backup"
	mv .weechat/weechat.conf .weechat/weechat.conf.backup
fi

# Creating new .weechat.conf
cp $dir/weechat/weechat.conf ~/.weechat/weechat.conf

# Copying Plugins 
cp $dir/weechat/plugins/buffers.pl ~/.weechat/perl/autoload/buffers.pl
cp $dir/weechat/plugins/iset.pl ~/.weechat/perl/autoload/iset.pl
cp $dir/weechat/plugins/highmon.pl ~/.weechat/perl/autoload/highmon.pl


