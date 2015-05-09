#!/bin/bash
#This script embelishes the Grub prompt with a theme I've modified from the net. I can't find the theme anymore, but if anyone recognizies it, please let me know so I can add atribution. I assume you are running grub2.
sudo mkdir /boot/grub/themes
sudo cp -r ./Resources/BeccaLinux /boot/grub/themes/
echo "If you have spcific grub settings, you can find the original file in the copy created in /etc/defult/grub.old."
sudo cp /etc/default/grub /etc/default/grub.old
sudo cp -i ./dotfiles/grub /etc/default/grub
sudo update-grub
