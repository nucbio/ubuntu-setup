#!/bin/bash

BASH_SETUP_DIR=${UBUNTU_SETUP_DIR}/configs/bashrc.d
BASH_LOCAL_DIR=$HOME/.bashrc.d

# Create the directory
mkdir -p "$BASH_LOCAL_DIR"

# Copy files from common directory
cp -f "${BASH_SETUP_DIR}/common"/*.sh "$BASH_LOCAL_DIR/"

# Copy additional files for local pcs
if [[ "$INSTALL_OPT" == "Home" || "$INSTALL_OPT" == "Work-WS" ]]; then
  cp -f "${BASH_SETUP_DIR}/local"/*.sh "$BASH_LOCAL_DIR/"
fi

# Copy additional files for ws
if [[ "$INSTALL_OPT" == "Bio-WS" ]]; then
  cp -f "${BASH_SETUP_DIR}/ws"/*.sh "$BASH_LOCAL_DIR/"
fi

# Backup existing .bashrc and move new one from .bashrc.d
if [ -f "$HOME/.bashrc" ]; then
    cp -f "$HOME/.bashrc" "$HOME/.bashrc.backup.$(date +%Y%m%d_%H%M%S)"
    echo "Existing .bashrc backed up to ~/.bashrc.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Add custom .bashrc
mv "$BASH_SETUP_DIR/.bashrc" "$HOME/.bashrc"
mv "$BASH_SETUP_DIR/.profile" "$HOME/.profile"
mv "$BASH_SETUP_DIR/.inputrc" "$HOME/.inputrc"

