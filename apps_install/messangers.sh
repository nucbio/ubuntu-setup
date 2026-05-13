#!/bin/bash

# Elements Messanger
if [[ "$INSTALL_OPT" != "Bio-WS" ]]; then
  sudo apt install -y wget apt-transport-https
  sudo wget -O /usr/share/keyrings/element-io-archive-keyring.gpg https://packages.element.io/debian/element-io-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" | sudo tee /etc/apt/sources.list.d/element-io.list
  sudo apt update -y
  sudo apt install -y element-desktop

  mkdir -p ~/.config/autostart

  cat > ~/.config/autostart/element.desktop << 'EOF'
[Desktop Entry]
Name=Element
Exec=element-desktop --hidden
Terminal=false
Type=Application
Icon=element
X-GNOME-Autostart-enabled=true
EOF
  # Telegram Messanger
  sudo snap install telegram-desktop

  cat > ~/.config/autostart/telegram.desktop << 'EOF'
[Desktop Entry]
Name=Telegram
Exec=telegram-desktop -autostart -startintray
Terminal=false
Type=Application
Icon=telegram
X-GNOME-Autostart-enabled=true
EOF

fi

