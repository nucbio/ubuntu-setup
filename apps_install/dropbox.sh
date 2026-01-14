#!/bin/bash

if [[ "$INSTALL_OPT" != "Bio-WS" ]]; then
  printf "\n\nINSTALLING DROPBOX\n"
  sudo apt install -y python3-gpg
  mkdir -p $HOME/tmp && cd $HOME/tmp
  wget "$APP_DROPBOX_REPO" -O dropbox_installer.deb
  sudo gdebi -n dropbox_installer.deb
  dropbox autostart y
fi

