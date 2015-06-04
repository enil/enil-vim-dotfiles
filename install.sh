#!/bin/sh

DIR=$(cd "$(dirname $0)"; pwd)
FILES=".vimrc .vim"
for file in $FILES; do
	 ln -siFn $DIR/$file $HOME/$file
done

