#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ -o interactive ]] || return

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

autoload -Uz compinit bashcompinit
# Rebuild the dump file only once a day, otherwise trust the cached one.
_zcompdump=(${ZDOTDIR:-$HOME}/.zcompdump(N.mh-24))
if (( $#_zcompdump )); then
    compinit -C
else
    compinit
fi
unset _zcompdump
bashcompinit

ZSH_CFG=(~/.config/zsh/*(N))
for rc in $ZSH_CFG; do
    if [ -f "$rc" ]; then
        . "$rc"
    fi
done

