function cowgreet 
    set TIME (date +"%H")
    set USER (whoami | sed 's/./\U&/')

    if test $TIME -ge 12 && test $TIME -lt 18;
        set MSG "Good afternoon, $USER"
    else if test $TIME -ge 18;
        set MSG "Good evening, $USER"
    else if test $TIME -lt 6;
        set MSG "Go to sleep, $USER"
    else;
        set MSG "Good morning, $USER"
    end

    cowsay -f $argv[1] $MSG | lolcat
end
