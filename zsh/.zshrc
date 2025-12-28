# My custom .zshrc file
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/myposh.toml)"
fi

# Configure zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
#zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
#zinit snippet OMZP::kubectl
#zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
#zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Disable underlining for valid paths
ZSH_HIGHLIGHT_STYLES[path]='none'
# Disable underlining for valid paths with brackets/globbing
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
# Disable underlining for precommands like sudo, make it bold insread
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold'

# Aliases
alias c='clear'
alias ls='ls --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lah'
alias history='history 1'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias cdd='cd ~/Documents'
alias dev='cd ~/Developer'
alias ghost='cd /opt/ghost/'
alias bl='brew list'
alias bu='brew update && brew upgrade && brew cleanup && brew doctor'
alias bi='brew install'
alias dspa='docker system prune --all'
alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"'
alias s='kitten ssh'
alias gsu='git submodule update --init --recursive'
#alias kubectx='kubectl-ctx'
#alias kubens='kubectl-ns'
#alias lse='eza --color=always --long --git --icons=always'
#alias product-start='python3 <(docker run --rm cf.common.repositories.cloud.sap/product-cf-hcp:develop-master /usr/bin/env startup)'

# define VSCode as the default text editor
# export EDITOR="code -w"

# add Rust binaries to the PATH
# export PATH="$PATH:$HOME/.cargo/bin"

# add Go binaries to the PATH
# export PATH="$PATH:$HOME/go/bin"

# Python cli
export PATH="$PATH:$HOME/.venv/bin"

# Keybindings
# Use emacs bindings [Ctrl+F, Ctrl+B/F, Ctrl+A/E, Ctrl+P/N]
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
# navigate words using Ctrl + arrow keys
# >>> Ctrl + right arrow | Ctrl + left arrow
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# macosx override
if [[ "$OSTYPE" == "darwin"* ]]; then 
  # >>> Option + right arrow | Option + left arrow
  bindkey "^[^[[C" forward-word
  bindkey "^[^[[D" backward-word
fi

# History settings
HISTFILE=$HOME/.zsh_history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# enable comments "#" expressions in the prompt shell
setopt INTERACTIVE_COMMENTS

# Load some API keys or similar (if any)
[ -f "$HOME/.secrets.keys" ] && source "$HOME/.secrets.keys"

# Shell integrations
# Ctrl+R - fzf on reverse search
eval "$(fzf --zsh)"
#eval "$(zoxide init --cmd cd zsh)"

# Added by Antigravity
export PATH="/Users/yovko/.antigravity/antigravity/bin:$PATH"
