function cowgreet 
    set TIME (date +"%H")

    if [ TIME -ge 12 && TIME -lt 18 ];
        set MSG "Good afternoon, $(whoami)"
    else if [ TIME -ge 18 ];
        set MSG "Good evening, $(whoami)"
    else if [ TIME -lt 6 ];
        set MSG "Go to sleep, $(whoami)"
    else;
        set MSG "Good morning, $(whoami)"
    end

    cowsay -f tux $MSG
end
