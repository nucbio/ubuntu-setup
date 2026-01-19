#!/bin/bash

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias c='clear'

# n -> nvim
#n() { if [ "$#" -eq 1 ]; then nvim; else nvim "$@"; fi; }

# File system
alias ll='eza -lah --group-directories-first --icons=auto'
#alias lt='eza -a --tree --level=2 --long --icons --git'

alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias fd='~/.cargo/bin'

alias lzg='lazygit'

# Git
alias g='git'
alias gcm='git commit -m'
alias gcam='git add -A && git commit -m'
alias gpom='git push -u origin main'
alias glom='git pull origin main'
alias grom='git pull --rebase origin main'
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

# Copy current directory (functionality is replaced by cpf)
cpwd() {
    if command -v xclip >/dev/null 2>&1; then
        dir="$(pwd)"
        echo "$dir" | xclip -selection clipboard
        echo "Copied to clipboard: $dir"
    else
        echo "xclip is not installed. Install it with:"
        echo "  sudo apt install xclip"
    fi
}

# eza + adjusted tree output
lt() {
    local max_lines=$(($(tput lines) - 2))
    local output n_lines level optimal_level=1
    
    # Find the optimal level by testing from 4 down to 1
    for level in 4 3 2 1; do
        output="$(eza -a --tree --level="$level" --long --icons --git "$@" 2>/dev/null)"
        n_lines=$(printf "%s" "$output" | wc -l)
        
        if [ "$n_lines" -le "$max_lines" ]; then
            optimal_level="$level"
            break
        fi
    done
    
    # Run eza with the optimal level (preserves colors and icons)
    eza -a --tree --level="$optimal_level" --long --icons --git "$@"
}
