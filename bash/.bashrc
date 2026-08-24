#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(starship init bash)"

BASH_CFG=~/.config/bash/*
for rc in $BASH_CFG; do
    if [ -f "$rc" ]; then
        . "$rc"
    fi
done

PS1='[\u@\h \W]\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
export PATH="$PATH:/home/dries/.local/share/bob/nvim-bin"

