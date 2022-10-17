function pacinstall --wraps='yay -Slq | fzf --multi --preview "yay -Si {1}" | xargs -ro yay -S' --description 'alias pacinstall=yay -Slq | fzf --multi --preview "yay -Si {1}" | xargs -ro yay -S'
  yay -Slq | fzf --multi --preview "yay -Si {1}" | xargs -ro yay -S $argv; 
end
