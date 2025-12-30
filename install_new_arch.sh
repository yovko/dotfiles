#!/usr/bin/env bash
set -e

echo "Starting Arch Linux setup..."

sudo pacman -Syu --noconfirm

sudo pacman -S --needed --noconfirm git base-devel

# 3. Install Yay (AUR helper)
if ! command -v yay &> /dev/null; then
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

DOTFILES_DIR="$HOME/.dotfiles"
if [ ! -d "$DOTFILES_DIR" ]; then
    git clone https://github.com/yovko/dotfiles.git "$DOTFILES_DIR"
else
    (cd "$DOTFILES_DIR" && git pull)
fi

# Install packages from list
yay -S --needed --noconfirm - < "$DOTFILES_DIR/pkglist.txt"

echo "Arch setup complete!"
