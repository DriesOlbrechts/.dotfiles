function pp
    set PROJECTS ~/Documents/projects
    begin
        set -l IFS

        set FOLDERS (
        find $PROJECTS -maxdepth 2 -type d,l -execdir test -d {}/.git \; \
        -printf "%T+\t%p\n" | sort -r | awk '{gsub("'"$PROJECTS"'", ""); print $2}'
        )
    end
    set FOLDER (
    echo $FOLDERS | fzf --preview "
    onefetch '$PROJECTS{}' 2>/dev/null;
    exa -l '$PROJECTS{}' 2>/dev/null;
    bat --color always '$PROJECTS{}/README.md' 2>/dev/null
    " 
    )
    cd "$PROJECTS/$FOLDER"
end
