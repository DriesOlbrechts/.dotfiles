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
    find $PROJECTS -maxdepth 2 -type d -execdir test -d {}/.git \; -print -prune | sort -n |
    fzf --preview "
        onefetch {} 2>/dev/null;
        exa -al {};
        bat --color always {}/README.md 2>/dev/null
    "
)
'  