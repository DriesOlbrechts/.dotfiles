export EDITOR=nvim
export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
export PATH="$PATH:$HOME/.cargo/bin:$HOME/.local/share/bob/nvim-bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin"
