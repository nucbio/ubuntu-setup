#!/bin/bash

# Check if the Cargo environment file exists
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
else
    echo "Error: Cargo environment file not found at $HOME/.cargo/env" >&2
    exit 1
fi

## TMUX
sudo snap install tmux  --classic
# Tmux configuration
cp $HOME/.local/share/ubuntu-setup/configs/tmux/.tmux.conf $HOME/

## Yazi - Terminal File Manager
sudo snap install yazi --classic
cp $HOME/.local/share/ubuntu-setup/configs/yazi/yazi.toml $HOME/.config/yazi/yazi.toml

sudo apt install kitty
mkdir -p "$HOME/.config/kitty"
cp "$HOME/.local/share/ubuntu-setup/configs/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
cp "$HOME/.local/share/ubuntu-setup/configs/kitty/kitty-light.png" "$HOME/.config/kitty/kitty-light.png"
sudo sed -i "s|^Icon=.*|Icon=$HOME/.config/kitty/kitty-light.png|" /usr/share/applications/kitty.desktop

# Btop
sudo snap install btop

# CLI PDF-viewer
sudo apt install zathura zathura-pdf-poppler -y
# If does not work add repos:
# sudo apt-add-repository universe
# sudo apt-add-repository multiverse
# sudo apt update

## Install fzf - fuzzy search (https://github.com/junegunn/fzf)
mkdir -p $HOME/tools

git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/tools/fzf
"$HOME/tools/fzf/install" \
  --key-bindings \
  --completion \
  --no-update-rc # no bashrc update

## eza - modern cd
EZA_RELEASE_TAG="${EZA_RELEASE_TAG:-v0.23.4}"
# Install eza
cargo install \
  --git https://github.com/eza-community/eza.git \
  --tag "$EZA_RELEASE_TAG" \
  --locked

## fdfind - modern cd
FDFIND_RELEASE_TAG="${FDFIND_RELEASE_TAG:-v10.3.0}"
# Install fdfind
cargo install \
  --git https://github.com/sharkdp/fd.git \
  --tag "$FDFIND_RELEASE_TAG" \
  --locked

## ripgrep - modern grep
RIPGREP_RELEASE_TAG="${RIPGREP_RELEASE_TAG:-15.1.0}"
# Install ripgrep
cargo install \
  --git https://github.com/BurntSushi/ripgrep.git ripgrep\
  --tag "$RIPGREP_RELEASE_TAG" \
  --locked

## zoxide - modern cd
ZOXIDE_RELEASE_TAG="${ZOXIDE_RELEASE_TAG:-v0.9.7}"
# Install ripgrep
cargo install \
  --git https://github.com/ajeetdsouza/zoxide.git \
  --tag "$ZOXIDE_RELEASE_TAG" \
  --locked

## bat - modern cat
BAT_RELEASE_TAG="${BAT_RELEASE_TAG:-v0.26.1}"
# Install ripgrep
cargo install \
  --git https://github.com/sharkdp/bat.git \
  --tag "$BAT_RELEASE_TAG" \
  --locked


