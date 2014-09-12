#!/bin/sh
CURDIR=$(pwd)

echo "Installing vim settings..."
VIMPLUGIN="$HOME/.vim/plugin"
ln -s $CURDIR/vimrc ~/.vimrc
for i in `find $CURDIR/vimplugin -name "*.vim"`; do
	if [ ! -d "$VIMPLUGIN" ]; then
		mkdir -p $VIMPLUGIN
	fi
	ln -s $i `echo $i | sed "s;.*/vimplugin;$VIMPLUGIN;g"`
done

echo "Installing tmux settings..."
ln -s $CURDIR/clip ~/bin/clip
ln -s $CURDIR/tmux.conf ~/.tmux.conf

echo "Installing git settings..."
ln -s $CURDIR/gitignore_global ~/.gitignore_global
