#!/bin/bash

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
THEME_NAME=2020-sp1-project-group23-cp3402
THEME_LOCATION="$SCRIPTPATH/public/wp-content/themes/$THEME_NAME"
printf "Getting Theme...\n"
if [[ ! -d "$THEME_LOCATION" ]]; then
	mkdir -p "$THEME_LOCATION"
	git clone https://github.com/cp3402-students/2020-sp1-project-group23-cp3402.git "$THEME_LOCATION"
	ln -s "$THEME_LOCATION" "$SCRIPTPATH/$THEME_NAME"
fi
clear
printf "Starting Vagrant Environment...\n"
vagrant up
clear
if [[ -f "$THEME_LOCATION/package.json" ]]; then 
	npm --version
	if [[ $? -eq 0 ]]; then
		cd $THEME_LOCATION
        printf "Installing Packages @ $THEME_LOCATION...\n"
        npm i gulp-cli -g
        npm i
        clear
        printf "Watching For Theme [$THEME_NAME] Changes!\n"
        gulp watch
	else
		printf "Install Node JS & NPM\n"
	fi
else
	printf "Theme Doesn't Require Watcher: $THEME_NAME\n"
fi
