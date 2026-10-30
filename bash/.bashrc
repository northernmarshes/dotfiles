#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias l='lazygit'
alias n='nvim'
alias maiko='/home/edna/data/bins/maiko'
alias uxn='/home/edna/data/bins/uxn11'
alias weight='/home/edna/data/code/scripts/weight'
alias film='/home/edna/data/code/scripts/film'
alias dualpush='/home/edna/data/code/scripts/dualpush'
alias applied='/home/edna/data/code/scripts/applied'

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

key >/dev/null 2>&1

# pacman
function pkg() {
  pacman -Slq | fzf --multi --preview "pacman -Sii {1}" \
    --preview-window "down:65%:wrap" \
    --bind "alt-p:toggle-preview" \
    --color "pointer:green,marker:green" |
    xargs -ro sudo pacman -S
}

# C

function crun() {
  NAME=${PWD##*/}
  gcc src/main.c -o bin/$NAME
  bin/$NAME
}

function cinit() {
  NAME=$1
  mkdir $NAME
  mkdir $NAME/bin $NAME/src
  touch $NAME/src/main.c $NAME/README.md
  touch $NAME/.gitignore
  cd $NAME
  echo "#$NAME" >README.md
  echo bin/ >>.gitignore
  git init >/dev/null 2>&1
  cd src

  # cat >> main.c<< EOF
  # some text line 1
  # some text line 2
  # some text line 3
  # EOF

  cd ..
  cd ..
}

. ~/export-esp.sh
export EDITOR=nvim
PATH=$PATH:
export DISPLAY=:0.0
