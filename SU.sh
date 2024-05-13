#!/bin/bash

# main packages
sudo pacman -Sy
sudo pacman -Syyu 

sudo pacman -S kitty i3 sxiv nitrogen dmenu htop thunar 


sudo pacman -S pipewire pipewire-pulse wireplumber pavucontrol


sudo pacman -S steam-runtime discord lutris gamemode lib32-gamemode wine wine-staging


sudo pacman -S xclip xorg-server xorg-xinit xf86-input-libinput nvidia lib32-nvidia-utils nvidia-settings

# build & cleanup

mkdir ~/git

cd ~/git && git clone https://aur.archlinux.org/ttf-brutalist-mono.git && cd ~/git/ttf-brutalist-mono && makepkg -csi

sudo mkdir /etc/default/grub
sudo mv ~/linuxconfig-arch/grub /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo pacman -Rns ninja python-beaker meson python-mako

#  custom .dotfiles
mkdir ~/.config/i3 && mkdir ~/.config/kitty 
mv ~/linuxconfig-arch/pictures ~/git && mv ~/linuxconfig-arch/config ~/.config/i3/config && mv ~/linuxconfig-arch/kitty.conf ~/.config/kitty/kitty.conf 
touch ~/.xinitrc && echo -e '/usr/bin/pipewire & \n/usr/bin/pipewire-pulse & \nexec i3' >> ~/.xinitrc
rm -r ~/linuxconfig-arch
sudo grub-mkconfig -o /boot/grub/grub.cfg 
cd ~/git && git clone https://github.com/oh-my-fish/oh-my-fish && cd ~/git/oh-my-fish && bin/install --offline
