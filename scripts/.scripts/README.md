# Simple script launcher with fuzzy search

Creates a shell function for each directory in the set location. Each file in the path should be an executable. The scripts just shows those files with fuzzy search when the function executes.

## Dependencies

- [fzf](https://github.com/junegunn/fzf)
- [bat](https://github.com/sharkdp/bat)

## Setup

Add the following to your shell's rc file

```bash
SCRIPT_ROOT_DIR="$HOME/.scripts" # Assuming the scripts are in ~/.scripts directory
__FUNCTION_PREFIX="_" # Can be anything. I added '_' just to prevent any conflicts
source "$SCRIPT_ROOT_DIR/init.sh"
```
