#!/usr/bin/env bash

echo "Installing Debian/Ubuntu packages..."

# Update & Install Basic Tools (APT)
sudo apt update && sudo apt upgrade -y
sudo apt install -y \
    wget curl git build-essential \
    readline-common \
    stow \
    gpg

DOTFILES_DIR="$HOME/.dotfiles"
if [ ! -d "$DOTFILES_DIR" ]; then
    git clone https://github.com/yovko/dotfiles.git "$DOTFILES_DIR"
else
    (cd "$DOTFILES_DIR" && git pull)
fi

# Oh My Posh 
if ! command -v oh-my-posh &> /dev/null; then
    sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
    sudo chmod +x /usr/local/bin/oh-my-posh
fi

echo "Debian/Ubuntu server setup complete!"
