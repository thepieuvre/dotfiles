#!/bin/bash

###
# Create/overwride ~/.dotfiles symlink to the current directory
# Overwride .bash_profile (which will load every other dotfile)
###
DOT_FILES_DIR=".dotfiles"

cd "$(dirname "$0")"
git pull
function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
				--exclude "README.md" --exclude "brew.sh" --exclude "LICENSE-MIT.txt" --exclude ".gitignore" --exclude ".gitaatributes" \
				-avh --no-perms . ~;
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
		doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
unset DOT_FILES_DIR
