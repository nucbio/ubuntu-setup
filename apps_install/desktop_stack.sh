#!/bin/bash

  printf "\n\nINSTALL PROGRAMS\n"

  sudo apt install -y openssh-server
  sudo apt install -y gedit-plugin-draw-spaces
  sudo apt install -y pandoc
  sudo apt install -y nemo
  sudo apt install -y caffeine
  sudo apt install -y goldendict
  sudo apt install -y texstudio
  sudo apt install -y pdfarranger
  sudo apt install -y 7zip
  sudo apt install -y gparted
  sudo apt install -y ripgrep
  sudo apt install -y alacarte
  sudo apt install -y xclip
  sudo apt install -y libreoffice
  sudo snap install gimp
  sudo snap install inkscape
  sudo snap install vlc
  # Clipboard for Wayland for Nvim (test: cat logs.txt | wl-copy)
  sudo apt install wl-clipboard

  sudo snap install code  --classic # Visual Studio Code
  sudo snap install cmake --classic

if [[ "$INSTALL_OPT" != "Home" ]]; then
  sudo apt install -y mdadm
  sudo apt install -y ncftp	## for GEO FTP Transfer
fi

if [[ "$INSTALL_OPT" == "Home" ]]; then
  sudo apt install -y gramps
  sudo apt install -y calibre
  sudo apt install -y pychess
  sudo apt install -y anki
  
  sudo snap install gnome-chess
  sudo snap install kigo # go game
  sudo snap install newsflash
  sudo snap install audacity

  # zmk - map keyboard
  curl -LsSf https://astral.sh/uv/install.sh | sh
  source $HOME/.local/bin/env
  uv tool install zmk
fi

if [[ "$INSTALL_OPT" != "Bio-WS" ]]; then
  sudo snap install zoom-client
  sudo snap install zotero-snap
  sudo snap install obsidian --classic
  sudo snap install telegram-desktop
fi

if [[ "$INSTALL_OPT" == "Bio-WS" || "$INSTALL_OPT" == "Work-WS" ]]; then
  sudo apt install -y mdadm
fi
