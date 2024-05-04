function pp
	if not test -n "$argv[1]"
  		set DEPTH 2
	else
	set DEPTH $argv[1]
	end

	set -q DEPTH $argv[1] or set DEPTH 2
    set PROJECTS ~/Documents/projects
    begin
        set -l IFS

        set FOLDERS (
        find $PROJECTS -maxdepth $DEPTH -type d,l -execdir test -d {}/.git \; \
        -printf "%T+\t%p\n" | sort -r | awk '{gsub("'"$PROJECTS"'", ""); print $2}'
        )
    end
    set FOLDER (
    echo $FOLDERS | fzf --preview "
    onefetch '$PROJECTS{}' 2>/dev/null;
    eza -l '$PROJECTS{}' 2>/dev/null;
    bat --color always '$PROJECTS{}/README.md' 2>/dev/null
    " 
    )
    cd "$PROJECTS/$FOLDER"
end
