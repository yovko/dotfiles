#!/usr/bin/env bash
set -e

DOTFILES_DIR="$HOME/.dotfiles"
REPO_URL="https://github.com/yovko/dotfiles.git"

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

if [ ! -d "$DOTFILES_DIR" ]; then
    git clone "$REPO_URL" "$DOTFILES_DIR"
else
    (cd "$DOTFILES_DIR" && git pull)
fi

# Install packages from list
yay -S --needed --noconfirm - < "$DOTFILES_DIR/pkglist.txt"

# Install MesloLGS NF (Nerd) font
oh-my-posh font install meslo

# Stow dotfiles packages
echo "Stowing dotfiles..."
cd $DOTFILES_DIR || exit
stow -t ~ git kitty omp vim zsh

echo "Arch setup complete!"
