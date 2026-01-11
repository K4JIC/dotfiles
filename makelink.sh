#!/bin/bash

DOTFILES_DIR=~/dotfiles

echo "シンボリックリンクを作成します"

for file in "$DOTFILES_DIR"/*/.[^.]*; do
	if [[ $file == "$DOTFILES_DIR/." || $file == "$DOTFILES_DIR/.." ]]; then
		continue
	fi
	echo "$fileのリンクを作成します"
	link_name=~/${file#"$DOTFILES_DIR"/*/}
	ln -sfn "$file" "$link_name"
done
