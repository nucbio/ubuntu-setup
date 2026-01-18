#!/bin/bash

setup_gits() {
    # If arguments are passed, use them; otherwise, use the global REPOS array
    if [ $# -gt 0 ]; then
        local INPUT_LIST=("$@")
    else
        local INPUT_LIST=("${REPOS[@]}")
    fi
  
    local GITS_DIR="$HOME/gits"
    
    local SELECTED_REPOS=$(gum choose \
        --no-limit \
        --height 14 \
        --header "Select repositories (Space to select, Enter to confirm)" \
        --selected "$(IFS=,; echo "${INPUT_LIST[*]}")" \
        "${INPUT_LIST[@]}"
)

  # Create GITS_DIR if it doesn't exist
  if [ ! -d "$GITS_DIR" ]; then
      echo "Creating directory: $GITS_DIR"
      mkdir -p "$GITS_DIR"
  fi

  cd "$GITS_DIR" || exit 1

  for REPO in $SELECTED_REPOS; do
      
      echo "----------------------------------------"
      echo "Processing: $REPO"
      
      HOST="${REPO%%:*}"
      USER_REPO="${REPO#*:}"
      USER_NAME="${USER_REPO%/*}"
      REPO_NAME="${USER_REPO#*/}"
      REPO_PATH="$GITS_DIR/$REPO_NAME"

      if [ -d "$REPO_PATH" ]; then
          echo "Repository $REPO already exists. Skipping."
          continue
      else
          cd "$GITS_DIR" || exit 1
          if git clone "https://$HOST/$USER_REPO.git"; then
              cd "$REPO_PATH" || exit
              git remote set-url origin "git@$HOST:$USER_REPO.git"
              git remote -v
          else
              echo "Failed to clone $REPO"
          fi
      fi
  done

    echo "Done! All repositories processed."
}
