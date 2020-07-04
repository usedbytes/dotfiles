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
mkdir -p $HOME/.vim/custom
ln -s $CURDIR/vim/custom/cscope_maps.vim $HOME/.vim/custom/cscope_maps.vim
ln -s $CURDIR/vim/custom/fzf_maps.vim $HOME/.vim/custom/fzf_maps.vim

echo "Install junegunn/vim-plug"
echo "Remember to run :PlugInstall"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Install OpenSCAD highlight"
git clone https://github.com/sirtaj/vim-openscad.git /tmp/vim-openscad
cp -vr /tmp/vim-openscad/* $HOME/.vim/
rm -rf /tmp/vim-openscad

echo "Installing tmux settings..."
ln -s $CURDIR/clip ~/bin/clip
ln -s $CURDIR/tmux.conf ~/.tmux.conf

echo "Installing git settings..."
ln -s $CURDIR/gitignore_global $HOME/.gitignore_global
git config --global core.excludesFile $HOME/.gitignore_global

echo "Installing swapcaps..."
ln -s $CURDIR/swapcaps ~/bin/swapcaps
