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


#ALIAS
alias ls='ls --color=auto'
alias pacinstall='pacman -Slq | fzf --multi --preview "pacman -Si {1}" | xargs -ro sudo pacman -S'
alias cat='bat -p'
alias exa='exa --color=auto --color-scale --group-directories-first'    #'ls --color=auto --group-directories-first'    # Add --icons once it is supported
alias ls='exa'
alias l='ls -Fl'    #'ls -lFh'                    #size,show type,human readable
alias la='ls -Fla'    #'ls -lAFh'                #long list,show almost all,show type,human readable
alias lr='ls -RFrs modified'    #'ls -tRFh'        #sorted by date,recursive,show type,human readable
alias lt='ls -lrFs modified'    #'ls -ltFhi'    #long list,sorted by date,show type,human readable
alias ll='ls -lg'    #'ls -l'                    #long list
alias lsdot='ls -d .*'    #'ls -d .*'
alias ldot='ls -ld .*'    #'ls -ld .*'
alias lS='ls -1FrSs size'    #'ls -1FSsh'
alias lart='ls -1aFt modified -s modified'    #'ls -1Fcaert'
alias lrt='ls -1Ft modified -s modified'    #'ls -1Fcrt'
alias gcd='cd "$(git rev-parse --show-toplevel)"'

PROJECTS=~/Documents/projects
# alias pp='cd $PROJECTS/$(
#     ls -D $PROJECTS -t modified --sort newest |
#     fzf --preview "
#         onefetch $PROJECTS/{} 2>/dev/null;
#         exa -al $PROJECTS/{};
#         bat --color always $PROJECTS/{}/README.md 2>/dev/null
#     "
# )
# '  
alias pp='cd $(
    find $PROJECTS -type d -execdir test -d {}/.git \; -print -prune | sort -n |
    fzf --preview "
        onefetch {} 2>/dev/null;
        exa -al {};
        bat --color always {}/README.md 2>/dev/null
    "
)
'  

. "$HOME/.cargo/env"
