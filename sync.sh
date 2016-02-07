#!/bin/bash

###
# Synchronize ~/.dotfiles symlink to the current directory
###
DOT_FILES_DIR=".dotfiles"

cd "$(dirname "$0")"
git pull

FILE4SYNC=(".vim" ".vimrc" ".zshrc" "bin" "init")

for file in $FILE4SYNC
do
				if [ "$file" -ot "~/$file" ]; then
								cp -f "~/$file" .
				fi
done

unset DOT_FILES_DIR
