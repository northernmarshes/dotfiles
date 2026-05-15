if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Created by `pipx` on 2025-11-11 09:48:32
set PATH $PATH /home/edna/.local/bin

set -x EDITOR /usr/bin/nvim
set -x VISUAL /usr/bin/nvim

# yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# pacman
function pkg
    pacman -Slq | fzf --multi --preview "pacman -Sii {1}" \
        --preview-window "down:65%:wrap" \
        --bind "alt-p:toggle-preview" \
        --color "pointer:green,marker:green" \
        | xargs -ro sudo pacman -S
end

# AUR
function aur
    yay -Slqa | fzf --multi --preview "yay -Sii {1}" \
        --preview-window "down:65%:wrap" \
        --bind "alt-p:toggle-preview" \
        --color "pointer:red,marker:red" \
        | xargs -ro yay -S
end
. ~/export-esp.sh
