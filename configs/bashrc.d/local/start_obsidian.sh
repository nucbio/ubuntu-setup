#!/bin/bash

## --- Obsidian
start_obsidian() {
  # Check Obsidian Vault path
  if [ -z "$OBSIDIAN_VAULT_DIR" ]; then
    echo "❌ OBSIDIAN_VAULT_DIR environment variable is not set."
    return 1
  fi
  
  # Check if Obsidian Vault exists
  if [ ! -d "$OBSIDIAN_VAULT_DIR" ]; then
    echo "📝 Obsidian vault not found at: $OBSIDIAN_VAULT_DIR"
    return 1
  fi
  
  if [ -n "$TMUX" ]; then
    tmux rename-window " Obsidian"
  fi
  
  # Check Dashboard.md
  if [ ! -f "${OBSIDIAN_VAULT_DIR}/notes/Dashboard.md" ]; then
    echo "📄 Dashboard.md not found."
    nvim \
      "$OBSIDIAN_VAULT_DIR" \
        -c "cd $OBSIDIAN_VAULT_DIR"
  else
    nvim \
      "${OBSIDIAN_VAULT_DIR}/notes/Dashboard.md" \
        -c "cd ${OBSIDIAN_VAULT_DIR}/notes"
  fi
}
