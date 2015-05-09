#!/bin/bash
#This is a bash script that sets up a default Mint enviornment (might work on Ubuntu as well).
#Set the crash flag to ensure it is set as expected
#Doesn't seem to effect the script
#set -e

Update the fresh install
{
  sudo aptitude update && echo "Finished updating the repositories."
} || { #Failed to update the repos for some reason
  echo "Failed to update repositories. Try running an update manually."
} 
{
  sudo aptitude -y upgrade && echo "Finished upgrading the base system."
} || { #Failed to the system for some reason
  echo "Failed to upgrade installed repositories. Try running an upgrade manually."
}

#Install tools and dependencies for normal day-to-day work.
sudo aptitude -y install vim terminator git build-essential texlive \
latex-beamer latex-xcolor libalgorithm-merge-perl lmodern prosper \
python-keybinder ruby tex-gyre texlive-fonts-recommended-doc \
texlive-latex-base-doc texlive-latex-recommended-doc texlive-luatex \
tipa tk libalgorithm-diff-xs-perl ps2eps texlive-extra-utils \
texlive-font-utils texlive-pstricks-doc lyx dvipng elyxer \
fonts-lyx hevea imagemagick latex2html preview-latex-style psutils \
tex4ht texlive-generic-extra texlive-latex-extra texlive-science tth \
libmagickcore5-extra texlive-latex-extra-doc texlive-pictures-doc \
texlive-science-doc tth-common openconnect vpnc chromium-browser \
chromium-browser-l10n chromium-codecs-ffmpeg-extra texlive-publishers \
libcurl3 libsdl-ttf2.0-0 virtualbox-4.3 virtualbox-nonfree python-pip \
python-wheel gist ruby-json texlive-publishers-doc zsh luckybackup \
exfat-fuse exfat-utils curl

#Install the 3.17 Kernel. Only necessary until the 3.17 kernel is in the kernel list on mint
#To delete kernel -- sudo apt-get remove 'linux-headers-3.17.6*' 'linux-image-3.17.6*'
mkdir -p /tmp/kernelSource
if [ $? -eq 0 ]; then
  wget -O /tmp/kernelSource/linux-headers-3.17.6.deb \
  http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.17.6-vivid/linux-headers-3.17.6-031706_3.17.6-031706.201412071535_all.deb
  if [ $? -eq 0 ]; then
    kernel=1
    echo "Finished Downloading the linux headers."
  else
    echo "Failed to download the linux kernel headers (all)."
    kernel=0
  fi
fi
if [ $? -eq 0 ]; then
  wget -O /tmp/kernelSource/linux-headers-generic-3.17.6.deb \
  http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.17.6-vivid/linux-headers-3.17.6-031706-generic_3.17.6-031706.201412071535_amd64.deb 
  if [ $? -eq 0 ]; then
    kernel=1
    echo "Finished Downloading the linux headers."
  else 
    echo "Failed to download the linux kernel headers (specific)."
    kernel=0
  fi
fi
if [ $? -eq 0 ]; then 
  wget -O /tmp/kernelSource/linux-source-3.17.6.deb \
  http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.17.6-vivid/linux-image-3.17.6-031706-generic_3.17.6-031706.201412071535_amd64.deb
  if [ $? -eq 0 ]; then
    kernel=1
    echo "Finished Downloading the linux image."
  else
    echo "Failed to download the linux kernel source."
    kernel=0
  fi
fi

sudo dpkg -i /tmp/kernelSource/*.deb
echo "Reboot the machine for new kernel to be activated."
