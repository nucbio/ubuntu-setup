#!/bin/bash

# Mount disks
if [[ "$INSTALL_OPT" == "Bio-WS" || "$INSTALL_OPT" == "Work-WS" ]]; then
  ### restore existing array
  sudo mdadm --assemble --scan
  ### mount point data1
  sudo mkdir /mnt/data1
  sudo chmod 777 /mnt/data1
  ### mount array
  sudo mount /dev/md/0 /mnt/data1
  ### mount array permanently
  echo '/dev/md/0 /mnt/data1	ext4	defaults	0	0' | sudo tee -a /etc/fstab
  echo "file:///mnt/data1 WS" | tee -a ~/.config/gtk-3.0/bookmarks

  ### mount point nanopore
  sudo mkdir /mnt/ssd_drive
  sudo chmod 777 /mnt/ssd_drive
  sudo mount /dev/sda /mnt/ssd_drive
  echo '/dev/sda /mnt/ssd_drive	ext4	defaults	0	0' | sudo tee -a /etc/fstab
  echo "file:///mnt/ssd_drive ssd_drive" | tee -a ~/.config/gtk-3.0/bookmarks
fi

