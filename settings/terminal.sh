#!/bin/bash

# Alacritty configuration
cp $UBUNTU_SETUP_DIR/configs/alacritty/alacritty.toml ~/.local/share/alacritty/

# Tmux configuration
cp $UBUNTU_SETUP_DIR/configs/tmux/.tmux.conf ~/

# Nvim configuration
cp -r ${UBUNTU_SETUP_DIR}/configs/nvim ~/.config
