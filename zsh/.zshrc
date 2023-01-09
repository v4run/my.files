autoload -Uz compinit
compinit

# Exports
export EDITOR=nvim
export VISUAL=nvim
export OPENER=open
export TERMINAL=kitty
export BROWSER=chromium

export PATH=$HOME/.cargo/bin:$HOME/.local/bin:$HOME/go/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH="$PATH:$HOME/.config/rofi/bin"
export WORDCHARS=''

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt pushdsilent
setopt autocd
setopt complete_in_word
# disable XON/XOFF flow control
unsetopt flowcontrol
bindkey -e
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[3~" delete-char

fpath=($HOME/.zsh_completions $fpath)

source $HOME/.zsh_aliases

# Go to directory and copy git diff and comeback
cpdiff() {
	if [ -z "$1" ]; then
		return
	fi
	pushd "$1" && git diff | copy && popd
}

# Reset pywal color
# PYWAL_SEQ_FILE="$HOME/.cache/wal/sequences"; [ -f "$PYWAL_SEQ_FILE" ] && (cat "$PYWAL_SEQ_FILE" &)
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
