#!/bin/bash

# Set-up Settings
for settings in ${UBUNTU_SETUP_DIR}/settings/*.sh
  do 
    source $settings
  done
