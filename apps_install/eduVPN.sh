#!/bin/bash

## eduVPN - TUD connection
if [[ "$INSTALL_OPT" == "Home" ]]; then
  sudo apt update -y
  sudo apt install -y apt-transport-https wget
  wget -O- https://app.eduvpn.org/linux/v4/deb/app+linux@eduvpn.org.asc | gpg --dearmor | sudo tee /usr/share/keyrings/eduvpn-v4.gpg >/dev/null
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/eduvpn-v4.gpg] https://app.eduvpn.org/linux/v4/deb/ noble main" | sudo tee /etc/apt/sources.list.d/eduvpn-v4.list
  sudo apt update -y
  sudo apt install -y eduvpn-client
fi
