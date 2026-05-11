#!/bin/bash
sudo apt update -y
sudo apt install -y ubuntu-restricted-extras

sudo apt install -y ffmpeg

# Streaming plugins (for zoom)
sudo apt install -y \
  gstreamer1.0-libav \
  gstreamer1.0-tools \
  gstreamer1.0-plugins-base \
  gstreamer1.0-plugins-good \
  gstreamer1.0-plugins-bad \
  gstreamer1.0-plugins-ugly
