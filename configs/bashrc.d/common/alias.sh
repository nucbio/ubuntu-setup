#!/bin/bash

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias c='clear'

### File system ll -> eza
alias ll='eza -lahg --group-directories-first --icons=auto'

# eza + adjusted tree output
# ll with file tree where depth is adjusted to fit the current window
lt() {
    local max_lines=$(($(tput lines) - 2))
    local output n_lines level optimal_level=1
    
    # Find the optimal level by testing from 4 down to 1
    for level in 4 3 2 1; do
        output="$(eza -ag --tree --level="$level" --long --icons --git "$@" 2>/dev/null)"
        n_lines=$(printf "%s" "$output" | wc -l)
        
        if [ "$n_lines" -le "$max_lines" ]; then
            optimal_level="$level"
            break
        fi
    done
    
    # Run eza with the optimal level (preserves colors and icons)
    eza -a --tree --level="$optimal_level" --long --icons --git "$@"
}

alias zat='zathura'       # pdf viewer cli
alias imv='imv-wayland'   # image viewer cli

# Git
alias lzg='lazygit'
alias gcm='git commit -m'
alias gcam='git add -A && git commit -m'
alias gpom='git push -u origin main'
alias glom='git pull origin main'
alias grom='git pull --rebase origin main'
alias gst='git status'

# Claude Code
alias cc='claude'
alias ccp='claude –print'
alias ccr='claude –resume'
alias ccc='claude –continue'

# Compression
tgz() { tar -czf "${1%/}.tar.gz" "${1%/}"; }

alias utgz="tar -xzf"

# mkdir -> cd
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Copy path of file or directory to clipboard
# usage: cpf my_dir    # copy directory path
#        cpf my_file   # copy file path
#        cpf           # copy current directory
cpf() {
  local path
  # If $1 is empty/unset, use PWD; otherwise, use realpath of the argument
  if [ -z "$1" ]; then
    path="$PWD"
  else
    path=$(realpath "$1")
  fi
  # Convert the path to base64 and wrap it in the OSC 52 escape sequence
  printf "\e]52;c;$(printf "%s" "$path" | base64 | tr -d '\n')\a"
  echo "Path copied to local clipboard: $path"
}

