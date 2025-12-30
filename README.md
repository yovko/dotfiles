# dotfiles

My personal system configuration.

**Note:** These dotfiles are highly customized to my personal workflow. Please only open pull requests that fix bugs or add improvements without breaking changes. If you have different tastes, I recommend forking this repository or copying specific parts into your own setup. I may reject PRs that significantly alter the behavior.

## Installation

The installation is automated via a Makefile that detects your OS (macOS, Arch Linux, or Ubuntu) and runs the appropriate script.

### On a new machine

```bash
git clone [https://github.com/yovko/dotfiles.git](https://github.com/yovko/dotfiles.git) ~/.dotfiles
cd ~/.dotfiles
make
```

### Manual Install

If you prefer to run the scripts manually:

    * macOS Workstation: ./install_new_mac.sh
	* Arch Linux Workstation: ./install_new_arch.sh
    * Ubuntu/Debian Server: ./install_new_server.sh
