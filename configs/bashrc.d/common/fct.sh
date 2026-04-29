#!/bin/bash

# fct — File-Change-Tree

# Shows files modified since a given time (default: 03:00 today) rendered
# as a nice ASCII tree, starting from the current directory and recursing
# into all nested subdirectories.
# Created to monitor changes in big projects where some directories are not 
# in git but changes need to be monitor for synchronization
#
# OPTIONS:
#   -t HH:MM   Use "today HH:MM" as reference time.
#   -g        Use the last git commit timestamp as reference time.
#              (Must be run inside a git repository.)
#   -L LEVEL   Max display depth of the directory tree (forwarded to tree -L).
#
# USAGE:
#   fct                  # Files changed since 03:00 today (default)
#   fct -t 08:00         # Files changed since 08:00 today
#   fct -t 14:30         # Files changed since 14:30 today
#   fct -g               # Since last git commit
#   fct -t 08:00 -L 2    # Prune tree to depth 2
#
# DEFAULTS:
#   - Time: 03:00  (nightly reset point; anything newer counts as "today")
#   - Scope: current working directory, recursive
#   - Excludes: .git/
#
# REQUIREMENTS:
#   - GNU find
#   - tree (optional)
#   - git (optional)

fct() {
  local time="03:00"
  local level=""
  
  while [[ $# -gt 0 ]]; do
    case "$1" in
      -t)
        time="$2"
        shift 2
        ;;
      -g)
        if ! git rev-parse --is-inside-work-tree &>/dev/null; then
          echo "ERROR: not inside a git repository"
          return 1
        fi
        ref_time=$(git log -1 --format=%ai 2>/dev/null)
        if [[ -z "$ref_time" ]]; then
          echo "ERROR: no commits found in this repository"
          return 1
        fi
        local commit_hash
        commit_hash=$(git log -1 --format=%h)
        label="last commit ($commit_hash @ $ref_time)"
        shift
        ;;
      -L)
        if [[ -z "$2" || ! "$2" =~ ^[0-9]+$ ]]; then
          echo "ERROR: -L requires a positive integer argument"
          return 1
        fi
        level="$2"
        shift 2
        ;;
      *)
        echo "Usage: fct [-t HH:MM] [-g] [-L LEVEL]"
        return 1
        ;;
    esac
  done
    
  local files
  files=$(find . -type f -newermt "today $time" \
    -not -path '*/\.git/*' \
    -printf '%P\n' 2>/dev/null | sort)
  
  if [[ -z "$files" ]]; then
    echo "(no files changed since today $time)"
    return
  fi
  
  if command -v tree &>/dev/null; then
    local tree_args=(--fromfile --noreport)
    if [[ -n "$level" ]]; then
      tree_args+=(-L "$level")
    fi
    echo "$files" | tree "${tree_args[@]}" .
  else
    echo "MESSAGE: tree is not installed. result is shown as is."
    echo "$files"
  fi
}

