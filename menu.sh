#!/bin/bash
# menu script work in progress!
choice () {
	local choice=$1
	if [[ ${opts[choice]} ]] #toggle
	then
		opts[choice]=
	else
		opts[choice]=+
	fi
}

function menu_script {
PS3='Please select your choice: '
while :
do
	clear
	options=("vim ${opts[1]}" "weechat ${opts[2]}" "ranger ${opts[3]}" "install")
	select opt in "${options[@]}"
	do
		case $opt in
			"vim ${opts[1]}")
				choice 1
				break
				;;
			"weechat ${opts[2]}")
				choice 2
				break
				;;
			"ranger ${opts[3]}")
				choice 3
				break
				;;
			"install")
				break 2
				;;
			*) printf '%s\n' 'invalid option';;
		esac
	done
done	
}