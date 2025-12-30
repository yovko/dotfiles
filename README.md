# My personal dotfiles

> [!WARNING]
> This project is still rough around the edges and needs more testing, so proceed with caution.

> [!NOTE]
> These dotfiles are highly customized to my personal workflow based on macOS & Arch Linux worstations and Ubuntu/Debian Linux servers. Please don't open pull requests with breaking changes. If you have different tastes, I recommend forking this repository or copying specific parts into your own setup. I may reject PRs that significantly alter the behavior.

## Installation

The installation is automated via a Makefile that detects the OS (macOS, Arch Linux, or Ubuntu) and runs the appropriate script.

### On a new machine

```bash
git clone https://github.com/yovko/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
make
```

### Manual Install

If you prefer to run the scripts manually:

- **macOS Workstation**: ./set_new_mac.sh
- **Arch Linux Workstation**: ./set_new_arch.sh
- **Ubuntu/Debian Server**: ./set_new_server.sh
