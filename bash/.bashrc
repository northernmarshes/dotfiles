#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias l='lazygit'
alias n='nvim'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"
cd /home/edna/data/code

# greetme
function greetme() {
  echo "Hello Edna!"
}

# yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
  command rm -f -- "$tmp"
}

# key
function key() {
  eval "$(keychain --eval github_key)"
}

# pacman
function pkg() {
  pacman -Slq | fzf --multi --preview "pacman -Sii {1}" \
    --preview-window "down:65%:wrap" \
    --bind "alt-p:toggle-preview" \
    --color "pointer:green,marker:green" |
    xargs -ro sudo pacman -S
}

# AUR
function aur() {
  yay -Slqa | fzf --multi --preview "yay -Sii {1}" \
    --preview-window "down:65%:wrap" \
    --bind "alt-p:toggle-preview" \
    --color "pointer:red,marker:red" |
    xargs -ro yay -S
}

# function r() {
#   cd /home/edna/data/code/ratadot/
#   cargo run --release
# }
#
. ~/export-esp.sh
export EDITOR=nvim
PATH=$PATH:
export DISPLAY=:0.0
