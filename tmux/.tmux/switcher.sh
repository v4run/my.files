#!/usr/bin/env bash
# Fuzzy session/window switcher for tmux with vim-like modes.
#
#   switcher.sh all       sessions + windows across sessions (prefix + w)
#   switcher.sh sessions  sessions only                      (prefix + s)
#
# Starts in "normal" mode (fzf filtering disabled) where single letters act:
#   j/k move   g/G first/last   C-d/C-u half page
#   x delete   r rename   enter switch   q / esc / C-c quit   / search   c clear
# In search mode typing filters; esc / C-c return to normal mode keeping the
# filter (shown after the prompt). Other keys are ignored in normal mode.
#
# Subcommands below (list/delete/rename) are re-invoked by fzf via reload()
# and execute(); they are not meant to be called by hand.
set -euo pipefail

self="$0"
cmd="${1:-all}"
scope="${2:-all}"

# Each line is "target  description"; target is "session" or "session:index",
# both accepted by switch-client/kill-*/rename-* -t.
list() {
  case "$1" in
    sessions)
      tmux list-sessions -F "#{session_name}  (#{session_windows} window#{?#{>:#{session_windows},1},s,})#{?session_attached, *,}"
      ;;
    all)
      # Current session (and its windows) sorted to the top.
      local cur
      cur="$(tmux display -p "#S")"
      {
        tmux list-sessions -F "#{session_name}  (session, #{session_windows} windows)#{?session_attached, *,}"
        tmux list-windows -a -F "#{session_name}:#{window_index}  #{window_name}#{?window_active, *,}"
      } | awk -v cur="$cur" '{ print ($1 == cur || index($1, cur ":") == 1 ? 0 : 1) "\t" $0 }' \
        | sort -s -k1,1 | cut -f2-
      ;;
  esac
}

# Both run inside the popup via execute(), so they own the tty and can
# prompt. Non-zero exits are swallowed by fzf; the list reloads either way.
delete() {
  [ -n "${1:-}" ] || return 0
  local target="$1" what yn
  case "$target" in
    *:*) what="window $target ($(tmux display -p -t "$target" "#W"))" ;;
    *)   what="session $target" ;;
  esac
  read -r -n1 -p "delete $what? [y/N] " yn
  [ "$yn" = y ] || [ "$yn" = Y ] || return 0
  case "$target" in
    *:*) tmux kill-window -t "$target" ;;
    *)   tmux kill-session -t "$target" ;;
  esac
}

# fzf with no items doubles as a line editor: --query pre-fills the current
# name, enter prints it (exit 1 since nothing matched), esc cancels (130).
rename() {
  [ -n "${1:-}" ] || return 0
  local target="$1" current new rc=0
  case "$target" in
    *:*) current="$(tmux display -p -t "$target" "#W")" ;;
    *)   current="$target" ;;
  esac
  new="$(fzf --print-query --query "$current" --prompt "rename to: " \
             --height=3 --reverse --info=hidden --color=16 </dev/null)" || rc=$?
  [ "$rc" -le 1 ] || return 0
  [ -z "$new" ] || [ "$new" = "$current" ] && return 0
  case "$target" in
    *:*) tmux rename-window -t "$target" -- "$new" ;;
    *)   tmux rename-session -t "$target" -- "$new" ;;
  esac
}

run() {
  local scope="$1" prompt
  case "$scope" in
    sessions) prompt="session > " ;;
    *)        prompt="switch > " ;;
  esac

  # Every printable key. In normal mode they are all bound to ignore (the
  # letters with a job are re-bound below, later --bind wins); / unbinds the
  # lot so they type again in search mode, and esc / C-c rebinds them.
  local keys="space" i k
  local -a ignore=(--bind "space:ignore")
  for i in $(seq 33 126); do
    k="$(printf "\\$(printf %o "$i")")"
    keys+=",$k"
    ignore+=(--bind "$k:ignore")
  done

  # Leaving search mode keeps the filter: with search disabled fzf holds the
  # last match set, and the query stays visible after the prompt. A reload
  # drops that match set, so re-apply the query afterwards.
  local reload="reload-sync($self list $scope)+transform-search:echo \"\$FZF_QUERY\""
  # unbind/rebind take the rest of the string as their key list, so they
  # must stay last in each chain.
  local to_search="enable-search+change-prompt(/ )+unbind:$keys"
  # Keys whose meaning depends on the mode: run $1 in search mode, $2 in
  # normal mode. The normal-mode return actions go via the environment since
  # the key list contains quotes.
  export SWITCHER_TO_NORMAL="disable-search+change-prompt($prompt)+rebind:$keys"
  in_search() { echo "transform:if [ \"\$FZF_PROMPT\" = '/ ' ]; then echo $1; else echo $2; fi"; }
  # esc / C-c: leave search mode if in it, otherwise quit.
  local back; back="$(in_search '"$SWITCHER_TO_NORMAL"' abort)"

  list "$scope" | fzf --disabled --no-sort --reverse --color=16 \
    --prompt="$prompt" \
    --header="j/k move  / search  c clear  x delete  r rename  enter switch  q quit" \
    --preview "tmux capture-pane -ep -t {1}" --preview-window "right:60%" \
    "${ignore[@]}" \
    --bind "j:down,k:up,g:first,G:last,ctrl-d:half-page-down,ctrl-u:half-page-up" \
    --bind "q:abort" \
    --bind "/:$to_search" \
    --bind "esc:$back" \
    --bind "ctrl-c:$back" \
    --bind "bspace:$(in_search backward-delete-char ignore)" \
    --bind "del:$(in_search delete-char ignore)" \
    --bind "ctrl-w:$(in_search unix-word-rubout ignore)" \
    --bind "c:clear-query+search()" \
    --bind "x:execute($self delete {1})+$reload" \
    --bind "r:execute($self rename {1})+$reload" \
    | cut -d" " -f1 \
    | xargs -r -I{} tmux switch-client -t "{}"
}

case "$cmd" in
  list)   list "$scope" ;;
  delete) delete "$scope" ;;
  rename) rename "$scope" ;;
  *)      run "$cmd" ;;
esac
