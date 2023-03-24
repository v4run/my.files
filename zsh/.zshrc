# ZSH home
export ZSH=$HOME
source $ZSH/.zsh_aliases
source $ZSH/.zsh_functions

# {{ History
export HISTFILE=~/.cache/zsh/history
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
# }}

# {{ Completion
# Enable
zmodload zsh/complist
autoload -U compinit && compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' format $'%B- %{\e[0;33m%}%d%{\e[0m%}%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:warnings' format $'%{\e[0;33m%}Wow, such empty%{\e[0m%}'
zstyle ':completion:*' matcher-list \
    'm:{[:lower:]}={[:upper:]}' \
    '+r:|[._-]=* r:|=*' \
    '+l:|=*'
_comp_options+=(globdots) # include hidden files in completion
bindkey -M menuselect '^[[Z' reverse-menu-complete
fpath=($HOME/.zsh_completions $fpath)
# }}

# {{ Exports
export EDITOR=nvim
export VISUAL=nvim
export OPENER=open
export TERMINAL=kitty
export BROWSER=chromium
export PATH=$HOME/.cargo/bin:$HOME/.local/bin:$HOME/go/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH="$PATH:$HOME/.config/rofi/bin"
# }}

# {{ Auto pushd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt pushdsilent
setopt autocd
unsetopt flowcontrol
# }}

# {{ vi mode
bindkey -v
export KEYTIMEOUT=1
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
# }}

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

LF_ICONS_FILE="$HOME/.config/lf/icons"
[ -f "$LF_ICONS_FILE" ] && source "$LF_ICONS_FILE"

# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
# export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
# export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Load script runner
SCRIPT_ROOT_DIR="$HOME/.scripts" # Assuming the scripts are in ~/.scripts directory
__FUNCTION_PREFIX="_"            # Can be anything. I added '_' just to prevent any conflicts
source "$SCRIPT_ROOT_DIR/init.sh"
source <(kubectl completion zsh)
eval "$(starship init zsh)"
