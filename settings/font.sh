#!/bin/bash

# Download and setup Nerd font
#
echo "Download and setup fonts"

mkdir -p ~/.local/share/fonts/NerdFonts
wget "$FONT_REPO" -O /tmp/font.zip
unzip -q /tmp/font.zip -d ~/.local/share/fonts/NerdFonts/
rm /tmp/font.zip

# update font cache
fc-cache -fv

