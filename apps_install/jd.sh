#!/bin/bash

## JDownloader
if [[ "$INSTALL_OPT" == "Home" ]]; then
  mkdir -p ~/tmp && cd ~/tmp
  wget http://installer.jdownloader.org/JD2Setup_x64.sh
  chmod +x JD2Setup_x64.sh
  ./JD2Setup_x64.sh
fi

