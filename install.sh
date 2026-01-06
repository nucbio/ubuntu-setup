#!/usr/bin/bash

set -e

trap 'echo "Ubuntu-setup failed! You can retry by running: source ~/.local/share/ubuntu-setup/install.sh"' ERR

# Run installers in order

source ${UBUNTU_SETUP_DIR}/install/00_versions.sh
source ${UBUNTU_SETUP_DIR}/apps/required/app_gum.sh >/dev/null
source ${UBUNTU_SETUP_DIR}/install/set_choise.sh

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0
echo "Installing terminal and desktop tools..."

# Install installers 
source ${UBUNTU_SETUP_DIR}/install/installers.sh

# Install terminal tools
source ${UBUNTU_SETUP_DIR}/install/install_apps.sh

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

echo "Setup complete. Please reboot."
