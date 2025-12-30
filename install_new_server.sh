#!/usr/bin/env bash

DOTFILES_DIR="$HOME/.dotfiles"
REPO_URL="https://github.com/yovko/dotfiles.git"

echo "Installing Debian/Ubuntu packages..."

# Update & Install Basic Tools (APT)
sudo apt update && sudo apt upgrade -y
sudo apt install -y \
    wget curl git build-essential \
    readline-common \
    stow \
    gpg

if [ ! -d "$DOTFILES_DIR" ]; then
    git clone "$REPO_URL" "$DOTFILES_DIR"
else
    (cd "$DOTFILES_DIR" && git pull)
fi

# Oh My Posh 
if ! command -v oh-my-posh &> /dev/null; then
    sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
    sudo chmod +x /usr/local/bin/oh-my-posh
fi

# Stow dotfiles packages
echo "Stowing dotfiles..."
cd $DOTFILES_DIR || exit
stow -t ~ git omp vim zsh

echo "Debian/Ubuntu server setup complete!"
