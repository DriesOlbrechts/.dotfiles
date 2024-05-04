function pps
	if not test -n "$argv[1]"
  		set DEPTH 2
	else
	set DEPTH $argv[1]
	end
    pp $DEPTH
    set SESSION_NAME (basename $PWD)
    ts $SESSION_NAME
end
