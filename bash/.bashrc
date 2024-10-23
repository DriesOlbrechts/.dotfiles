#
# ~/.bashrc
#
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '


#fzf
# source /usr/share/fzf/key-bindings.bash
# source /usr/share/fzf/completion.bash

# Source all cfgs
BASH_CFG=~/.config/bash/*
for rc in $BASH_CFG; do
    if [ -f "$rc" ]; then
        . "$rc"
    fi
done

PATH=$PATH:$HOME/.local/share/bob/nvim-bin:/usr/local/bin

cowgreet tux


eval "$(starship init bash)"

AFTER_CFG=~/.config/bash/after/* 
for f in $AFTER_CFG; do
	if [ -f "$f" ]; then
		. "$f"
	fi
done
export PATH=$PATH:/home/dries/.spicetify

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
