#!/bin/bash

# Script to change the FirefoxDeveloperTheme Colors

# The colors
lime="#9fbc00"
darklime="#82a900"
tabBackgroundColor="#5f7000" # --tab-selection-background-color  AND --identify-box-chrome-color
statubarColor="#2f2f2f"		# --chrome-secondary-background-color
tabHighlightStripColor="#cbed0c"	# --tab-selection-box-shadow: 0 2px 0 tabHighlightStripColor inset, 0 8px 3px -5px #2b82bf inset, 0 -1px 0 rgba(0,0,0,.2) inset;

dir=$(pwd)	# saving pwd in var 'dir'

setPaths() {

	if [ -f $dir/browser/omni.ja ]
	then
		echo "found Omni.ja - saving Path"
		omni_dir=$dir/browser/ #saving the folder with the omni.ja
		omniHash=
	fi

	echo "dir: $dir"
	echo "omni_dir $omni_dir"
}

createWorkingDir() {
	mkdir tmp
	cp $omni_dir/omni.ja $omni_dir/omni.ja_backup	
	mv $omni_dir/omni.ja tmp/
	cd tmp
	tmpDir=$(pwd)
	unzip omni.ja
	rm omni.ja

}

patchingFile() {
	if [ -f chrome/browser/skin/classic/browser/devedition.css ]
	then
		echo "Devedition.css found, changing dir"
		cd chrome/browser/skin/classic/browser/
		echo ':root[devtoolstheme="dark"] { ' >> devedition.css
		echo "--tab-selection-background-color: $tabBackgroundColor ;" >> devedition.css 
		echo "--identify-box-chrome-color: $tabBackgroundColor ;" >> devedition.css 
		echo "--chrome-secondary-background-color: $statubarColor ;" >> devedition.css
		echo "--tab-selection-box-shadow: 0 2px 0 $tabHighlightStripColor inset, 0 8px 3px -5px #2b82bf inset, 0 -1px 0 rgba(0,0,0,.2) inset; " >> devedition.css
		echo '}' >> devedition.css 
		cd 
	fi

	cd $tmpDir
	echo $tmpDir
}

cleanUP(){
	if [ -d tmp ]
	then 
		echo "DELETING TMP DIRECTORY!"
		rm -rf tmp/
	fi
}

packingFile() {
	echo "Packing Files"
	zip -r omni.ja *	
	echo "Moving Omni.ja back to place"
	mv omni.ja $omni_dir/omni.ja
	cd $dir
}

setPaths
cleanUP
createWorkingDir
patchingFile
packingFile
cleanUP
echo "All done."
