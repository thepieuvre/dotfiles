#!/bin/bash

###
# Synchronize ~/.dotfiles symlink to the current directory
###
DOT_FILES_DIR=".dotfiles"

cd "$(dirname "$0")"
git pull

FILE4SYNC=(".atom" ".vim" ".vimrc" ".zshrc" "bin" "init" ".gitattributes" ".gitconfig")

for file in ${FILE4SYNC[*]}
do
				echo "Cheking $file with ~/$file"
				if [ ~/$file -nt $file ]; then
								echo "Local $file is newer than dotfiles version"
								cp -f ~/$file .
				fi
done

	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
					--exclude "README.md" --exclude "brew.sh" --exclude "LICENSE-MIT.txt" --exclude ".gitignore" --exclude ".gitaatributes" \
					-avh --no-perms . ~;

unset DOT_FILES_DIR
