#ALIAS
alias ls='ls --color=auto'
alias pacinstall='yay -Slq | fzf --multi --preview "yay -Si {1}" | xargs -ro yay -S'
alias cat='bat -p'
alias exa='eza --color=auto --color-scale --group-directories-first'    #'ls --color=auto --group-directories-first'    # Add --icons once it is supported
alias ls='eza'
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
alias school='cd ~/Documents/Application-development/jaar3'
alias dotfiles='cd ~/.dotfiles'



# Kill a process with fzf
fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [ "x$pid" != "x" ]; then
        echo $pid | xargs kill -${1:-9}
    fi
}

cowgreet() {
    TIME=$(date +"%k")
    USER=$(whoami | sed -e "s/\b\(.\)/\u\1/g")

    if ((TIME >= 12 && TIME < 18)); then
        MSG="Good afternoon, $USER"
    elif ((TIME >= 18)); then
        MSG="Good evening, $USER"
    elif ((TIME < 6)); then
        MSG="Go to sleep, $USER"
    else
        MSG="Good morning, $USER"
    fi

    cowsay -f "$1" "$MSG" | lolcat
}
