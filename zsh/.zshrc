# Exports
export EDITOR=nvim
export VISUAL=nvim
export OPENER=open
export ZSH="$HOME/.oh-my-zsh"
export PATH=$HOME/.cargo/bin:$HOME/.local/bin:$HOME/go/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH="$PATH:$HOME/.config/rofi/bin"

fpath=($HOME/.zsh_completions $fpath)

# Theme
ZSH_THEME="lambda"

# Plugins
plugins=(git)

# Sources
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_aliases

# Go to directory and copy git diff and comeback
cpdiff ()
{
	if [ -z "$1" ]; then
		return
	fi
	pushd "$1" && git diff | copy && popd;
}

# Reset pywal color
# PYWAL_SEQ_FILE="$HOME/.cache/wal/sequences"; [ -f "$PYWAL_SEQ_FILE" ] && (cat "$PYWAL_SEQ_FILE" &)
LF_ICONS_FILE="$HOME/.config/lf/icons"
[ -f "$LF_ICONS_FILE" ] && source "$LF_ICONS_FILE"

# Load script runner
SCRIPT_ROOT_DIR="$HOME/.scripts" # Assuming the scripts are in ~/.scripts directory
__FUNCTION_PREFIX="_"            # Can be anything. I added '_' just to prevent any conflicts
source "$SCRIPT_ROOT_DIR/init.sh"
source <(kubectl completion zsh)
