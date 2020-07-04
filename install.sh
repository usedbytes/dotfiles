#!/bin/sh
CURDIR=$(pwd)

echo "Installing vim settings..."
VIMPLUGIN="$HOME/.vim/plugin"
ln -s $CURDIR/vim/vimrc ~/.vimrc
for i in `find $CURDIR/vim/plugin -name "*.vim"`; do
	if [ ! -d "$VIMPLUGIN" ]; then
		mkdir -p $VIMPLUGIN
	fi
	ln -s $i `echo $i | sed "s;.*/vim/plugin;$VIMPLUGIN;g"`
done

echo "Installing tmux settings..."
ln -s $CURDIR/clip ~/bin/clip
ln -s $CURDIR/tmux.conf ~/.tmux.conf

echo "Installing git settings..."
ln -s $CURDIR/gitignore_global ~/.gitignore_global

echo "Installing swapcaps..."
ln -s $CURDIR/swapcaps ~/bin/swapcaps
