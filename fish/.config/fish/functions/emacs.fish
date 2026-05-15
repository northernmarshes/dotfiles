function emacs
    command emacs --init-directory ~/.config/emacs $argv
end

# function update
#     echo "==> Updating system..."
#
#     echo "==> Pacman..."
#     sudo pacman -Syu
#     or begin
#         echo "==> Pacman error!"
#         return 1
#     end
#
#     echo "==> AUR (yay)..."
#     yay -Syu --aur
#     or begin
#         echo "==> AUR error!"
#         return 1
#     end
#
#     echo "==> Ready!"
# end
