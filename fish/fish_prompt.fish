function fish_prompt
    set -l green (set_color green)
    set -l blue (set_color blue)
    set -l white (set_color white)
    set -l normal (set_color normal)

    echo -n -s $green (whoami) $white "@" $blue (hostname -s) " "
    echo -n -s $white (prompt_pwd) "> " $normal
end

