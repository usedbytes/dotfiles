DIR=$HOME/dotfiles/bash
source $DIR/ps1
export PATH=$HOME/bin:$HOME/local/bin:$HOME/dotfiles/bin:$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bind -x '"\C-p": vim $(fzf);'

#swapcaps 1
