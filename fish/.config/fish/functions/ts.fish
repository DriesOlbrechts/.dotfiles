function ts
    if [ -z $argv[1] ] ;
        tmux switch-client -l
    else
        if [ -z "$TMUX" ];
            tmux new -As $argv[1]
        else
            if ! tmux has-session -t $argv[1] 2>/dev/null;
                set TMUX (tmux new-session -ds $argv[1])
            end
            tmux switch-client -t $argv[1]
        end
    end
    if ! tmux has-session -t $argv[1] 2>/dev/null;
        set TMUX (tmux new-session -ds $argv[1])
    end
    tmux switch-client -t $argv[1]
end
