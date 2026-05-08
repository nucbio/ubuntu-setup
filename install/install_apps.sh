#!/bin/bash

# Install Apps

# Primary Install
for install_app in ${UBUNTU_SETUP_DIR}/apps_install/primary/*.sh
  do 
    source $install_app
  done

# The rest apps
for install_app in ${UBUNTU_SETUP_DIR}/apps_install/*.sh
  do 
    source $install_app
  done
