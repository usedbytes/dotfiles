#!/bin/sh
# http://stackoverflow.com/a/12694189
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]
then
	DIR="$PWD"
fi

echo "Installing vim settings..."
VIMPLUGIN="$HOME/.vim/plugin"
ln -s $DIR/vim/vimrc ~/.vimrc
for i in `find $DIR/vim/plugin -name "*.vim"`; do
	if [ ! -d "$VIMPLUGIN" ]; then
		mkdir -p $VIMPLUGIN
	fi
	ln -s $i `echo $i | sed "s;.*/vim/plugin;$VIMPLUGIN;g"`
done
mkdir -p $HOME/.vim/custom
ln -s $DIR/vim/custom/cscope_maps.vim $HOME/.vim/custom/cscope_maps.vim
ln -s $DIR/vim/custom/fzf_maps.vim $HOME/.vim/custom/fzf_maps.vim

echo "Install junegunn/vim-plug"
echo "Remember to run :PlugInstall"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Install OpenSCAD highlight"
git clone https://github.com/sirtaj/vim-openscad.git /tmp/vim-openscad
cp -vr /tmp/vim-openscad/* $HOME/.vim/
rm -rf /tmp/vim-openscad

echo "Installing tmux settings..."
ln -s $DIR/tmux.conf ~/.tmux.conf

echo "Installing git settings..."
ln -s $DIR/gitignore_global $HOME/.gitignore_global
git config --global core.excludesFile $HOME/.gitignore_global

echo "Add 'source $DIR/bash/sourceme.bash' to bashrc"
