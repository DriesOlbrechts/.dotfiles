#
# ~/.bashrc
#

#Run the motd client
~/.cargo/bin/client

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"

#fzf
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# Load Angular CLI autocompletion.
source <(ng completion script)
export PATH=$PATH:~/.spicetify

# Source all cfgs
BASH_CFG="~/.config/bash"
for rc in ~/.config/bash/*; do
    if [ -f "$rc" ]; then
        . "$rc"
    fi
done

. "$HOME/.cargo/env"
