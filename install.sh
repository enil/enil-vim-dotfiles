#!/bin/sh

set -e

DIR=$(cd "$(dirname $0)"; pwd); cd $DIR
FILES=".vimrc .vim"

if which git &> /dev/null; then
	git submodule init && git submodule update
else
	echo "git not found, not installing submodules" 1>&2
fi

for file in $FILES; do
	 ln -siFn $DIR/$file $HOME/$file || true
done

