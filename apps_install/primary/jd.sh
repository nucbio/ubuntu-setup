#!/bin/bash

## JDownloader
if [[ "$INSTALL_OPT" == "Home" ]]; then
    # Skip installation if already installed
    if find "$HOME" -maxdepth 3 -type d -iname "jd2" | grep -q .; then
        echo "JDownloader already installed. Skipping."
    else
        mkdir -p ~/tmp
        cd ~/tmp || exit 1

        wget -O JD2Setup_x64.sh \
            http://installer.jdownloader.org/JD2Setup_x64.sh

        chmod +x JD2Setup_x64.sh
        ./JD2Setup_x64.sh
    fi
fi
