#!/usr/bin/env bash

set -o pipefail

BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

DOTFILES_DIR="$HOME/.dotfiles"
REPO_URL="https://github.com/yovko/dotfiles.git"

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[OK]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

if [[ "$(uname)" == "Darwin" ]]; then
    if ! xcode-select -p &>/dev/null; then
        log_info "Installing Xcode Command Line Tools..."
        xcode-select --install
        log_warn "Please complete the Xcode installation dialog and run this script again."
        exit 0
    else
        log_success "Xcode Command Line Tools already installed."
    fi
fi

if [ ! -d "$DOTFILES_DIR" ]; then
    log_info "Cloning dotfiles repository to $DOTFILES_DIR..."
    if git clone "$REPO_URL" "$DOTFILES_DIR"; then
        log_success "Repository cloned."
    else
        log_error "Failed to clone repository."
        exit 1
    fi
else
    log_info "Dotfiles directory already exists. Pulling latest changes..."
    (cd "$DOTFILES_DIR" && git pull)
    log_success "Dotfiles updated."
fi


if [[ "$(uname)" == "Darwin" ]]; then
    log_info "Configuring macOS environment..."

    # Homebrew Installation
    if ! command -v brew &>/dev/null; then
        log_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        if [[ -f /opt/homebrew/bin/brew ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        elif [[ -f /usr/local/bin/brew ]]; then
            eval "$(/usr/local/bin/brew shellenv)"
        fi
    else
        log_success "Homebrew is already installed."
    fi

    if [ -f "$DOTFILES_DIR/Brewfile" ]; then
        log_info "Running brew bundle from $DOTFILES_DIR/Brewfile..."
        brew analytics off
        brew bundle --file="$DOTFILES_DIR/Brewfile"
        log_success "Brew bundle complete."
    else
        log_warn "No Brewfile found in $DOTFILES_DIR. Skipping brew bundle."
    fi

    # log_info "Disabling font smoothing..."
    # defaults -currentHost write -g AppleFontSmoothing -int 0
fi

if [ ! -f "$HOME/.hushlogin" ]; then
    touch "$HOME/.hushlogin"
    log_success "Created .hushlogin"
fi

log_success "Installation complete! Please restart your terminal."
