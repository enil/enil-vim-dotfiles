#!/bin/sh

DIR=$(cd "$(dirname $0)"; pwd)
FILES=".vimrc .vim"
for file in $FILES; do
	 ln -siFh $DIR/$file $HOME/$file
done

