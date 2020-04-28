#!/bin/bash

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
THEME_NAME=2020-sp1-project-group23-cp3402
THEME_LOCATION="./public/wp-content/themes/$THEME_NAME"
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
