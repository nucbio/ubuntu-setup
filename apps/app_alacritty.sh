#!/bin/bash

# Make alacritty default terminal emulator
sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty

# Alacritty configuration
mkdir -p ~/.local/share/alacritty/
cp ~/.local/share/ubuntu_setup/configs/alacritty/alacritty.toml ~/.local/share/alacritty/

# Make alacritty default terminal emulator
sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty
