#!/bin/bash
#Install the packages needed for Bumblebee on my W530
sudo aptitude -y install bumblebee-nvidia bbswitch-dkms primus
echo "Choose a recent NVIDIA driver from the driver-manager utility."
driver-manager
