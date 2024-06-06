#!/bin/bash

__SCRIPT_ROOT_DIR=$(dirname "$0")
__FUNCTION_PREFIX=${__FUNCTION_PREFIX:-}

# Find the files inside the module directory so that it can be searched using fzf
# NOTE: Make sure the files are executable
__find_and_execute_task() {
	task=$(find "$1" -maxdepth 1 -type f | sort | fzf \
		--query="$2" \
		--info=inline \
		--delimiter='/' \
		--with-nth=-1 \
		--preview-window wrap \
		--preview "bat --color=always --style=numbers --line-range :500 {}")
	# shellcheck source=/dev/null
	# The actual script that get executed is located at $__SCRIPT_ROOT_DIR/$1/$task
	[ -z "$task" ] || . "$task"
}

# Load all the currently available modules
__load_modules() {
	while IFS= read -r -d '' MODULE_DIR; do
		MODULE=$(basename "$MODULE_DIR")
		# Create the function such that it passes the MODULE_DIR and all the parameters used when calling the function to __find_and_execute_task
		eval "$__FUNCTION_PREFIX$MODULE() { __find_and_execute_task $MODULE_DIR "'"$@"'"; }"
	done < <(find "$__SCRIPT_ROOT_DIR/" -maxdepth 1 -mindepth 1 -not \( -path "$__SCRIPT_ROOT_DIR/.git" -prune \) -type d -print0)
}

# Load modules when script is initialized
__load_modules

# Add an alias to reload the modules manually
alias reload_modules=__load_modules
