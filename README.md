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

## Managing dotfiles with GNU Stow

This repository is structured to work with [GNU Stow](https://www.gnu.org/software/stow/) from the top-level `~/.dotfiles` directory.

1. Install GNU stow if it is not already available.
2. Change into the dotfiles directory.
3. Use stow to symlink a package into your home directory. For example, to enable `git` and `zsh` dotfiles:

```bash
stow git zsh
```

4. To remove managed dotfiles, use:

```bash
stow -D git zsh
```

5. Verify symlinks and adjust packages as needed.

This keeps your home directory clean while still allowing the repo to manage configuration files.

## Adding a very new config file with GNU stow

If you want to add a new configuration file to a new package, create the package directory inside `~/.dotfiles`, move the file there, and then run `stow` for that package.

For example, to add a new `pi` package with a `models.json` and `settings.json` config files:

```bash
# Create a subdir for pi in ~/.dotfiles replicating the real structure of subfolders  
mkdir -p ~/.dotfiles/pi/.pi/agent

# Move the real config files to the newly created subdir
mv ~/.pi/agent/models.json ~/.dotfiles/pi/.pi/agent/
mv ~/.pi/agent/settings.json ~/.dotfiles/pi/.pi/agent/

# Test from the root of dotfiles repo
cd ~/.dotfiles
stow -nv pi

# If everything is OK make the real links
stow -v pi
```

This creates the symlinks from `~/.dotfiles/pi/...`, making the new config active without copying it manually.

```bash
LINK: .pi/agent/models.json => ../../.dotfiles/pi/.pi/agent/models.json
LINK: .pi/agent/settings.json => ../../.dotfiles/pi/.pi/agent/settings.json
```

And don't forget to update the remote repo:

```bash
git add pi
git commit -m "Add Pi agent configuration"
git push origin main
```
