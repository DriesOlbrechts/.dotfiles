#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

#fzf
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# Source all cfgs
BASH_CFG="~/.config/bash"
for rc in ~/.config/bash/*; do
    if [ -f "$rc" ]; then
        . "$rc"
    fi
done

# forgit
. ~/.forgit/forgit.plugin.zsh

. "$HOME/.cargo/env"

eval "$(starship init bash)"
