#!/bin/bash

sudo snap install nvim  --classic

# Nvim configuration
#Install from github
if [ -d "$HOME/.config/nvim/.git" ]; then
    git -C "$HOME/.config/nvim" pull
else
    git clone https://github.com/nucbio/nvim-config.git "$HOME/.config/nvim"
fi
#cp -r ~/.local/share/ubuntu-setup/configs/nvim ~/.config/
