#!/bin/bash

# main packages
# 
#

sudo pacman -Sy
sudo pacman -Syyu 

# Essentials
sudo pacman -S kitty i3 nitrogen dmenu htop thunar qutebrowser 

# Pipewire Install
sudo pacman -S pipewire pipewire-pulse pipewire-media-session pavucontrol

# Gaming & Wine
sudo pacman -S steam-runtime lutris gamemode lib32-gamemode wine wine-staging

# Xorg and Graphics drivers
sudo pacman -S xclip xorg-server xorg-xinit xf86-input-libinput nvidia lib32-nvidia-utils nvidia-settings

# Pipewire Enable
sudo systemctl --global pipewire pipewire-pulse pipewire-media-session

# build & cleanup
#
#

# Git directory
mkdir ~/git

# font
cd ~/git && git clone https://aur.archlinux.org/ttf-brutalist-mono.git && cd ~/git/ttf-brutalist-mono && makepkg -csi

#Web browser
cd ~/git && git clone https://aur.archlinux.org/brave-bin.git && cd ~/git/brave-bin && makepkg -csi

#Grub
sudo mkdir /etc/default/grub
sudo mv ~/linuxconfig-arch/grub /etc/default/grub 
sudo grub-mkconfig -o /boot/grub/grub.cfg

#  custom .dotfiles
#
#

# WM&Terminal dir
mkdir ~/.config/i3 && mkdir ~/.config/kitty 

# config files
mv ~/linuxconfig-arch/pictures ~/git && mv ~/linuxconfig-arch/config ~/.config/i3/config && mv ~/linuxconfig-arch/kitty.conf ~/.config/kitty/kitty.conf 
touch ~/.xinitrc && echo -e '/usr/bin/pipewire & \n/usr/bin/pipewire-pulse & \nexec i3' >> ~/.xinitrc

# Cleanup & Shell
rm -r ~/linuxconfig-arch
sudo grub-mkconfig -o /boot/grub/grub.cfg 
cd ~/git && git clone https://github.com/oh-my-fish/oh-my-fish && cd ~/git/oh-my-fish && bin/install --offline
