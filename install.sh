#!/bin/sh

DIR=$(cd "$(dirname $0)"; pwd); cd $DIR
FILES=".vimrc .vim"
PLUGINS=$(grep '^Bundle ' .vimrc | sed -E "s/^Bundle '([^']+)'\s*/\1/" | grep -v '/vundle$')

if which git &> /dev/null; then 
	git submodule init && git submodule update || exit $?

	for plugin in $PLUGINS; do
		plugin_dir=$(echo $plugin | awk -F '/' '{ print $2 }')
		if [ ! -e ".vim/bundle/$plugin_dir" ]; then
			(cd .vim/bundle && git clone "https://github.com/$plugin.git" $plugin_dir)
		fi
	done
else
	echo "git not found, not installing plugins" 1>&2
fi

for file in $FILES; do
	 ln -siFn $DIR/$file $HOME/$file
done

