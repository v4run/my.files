# Exports
export EDITOR=nvim
export ZSH="/home/varun/.oh-my-zsh"

# Theme
ZSH_THEME="lambda"

# Plugins
plugins=(git)

export PATH=$HOME/go/bin:$PATH

# Sources
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_aliases

export PATH=/usr/local/go/bin:$PATH

# Load script runner
SCRIPT_ROOT_DIR="$HOME/.scripts" # Assuming the scripts are in ~/.scripts directory
__FUNCTION_PREFIX="_" # Can be anything. I added '_' just to prevent any conflicts
source "$SCRIPT_ROOT_DIR/init.sh"
