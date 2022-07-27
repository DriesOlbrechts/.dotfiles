#
# ~/.bashrc
#

#Run the motd client
/home/dries/.cargo/bin/client

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add ~/.ssh/github
fi

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#fzf
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# Load Angular CLI autocompletion.
source <(ng completion script)
export PATH=$PATH:/home/dries/.spicetify

# Source all cfgs
BASH_CFG="~/.config/bash"
for rc in ~/.config/bash/*; do
    if [ -f "$rc" ]; then
        . "$rc"
    fi
done

. "$HOME/.cargo/env"
