#!/bin/bash

# main packages
sudo pacman -Sy && sudo pacman -Syyu 
sudo pacman -Sy

sudo pacman -S kitty i3 sxiv nitrogen vim dmenu htop thunar vifm qutebrowser  
sudo pacman -Sy

sudo pacman -S pipewire pipewire-pulse wireplumber pavucontrol
sudo pacman -Sy

sudo pacman -S steam discord lutris
sudo pacman -Sy

sudo pacman -S xclip xorg-server xorg-xinit xf86-input-libinput nvidia lib32-nvidia-utils nvidia-settings
sudo pacman -Sy

sudo pacman -Syyu

# build & cleanup

mkdir ~/git

sudo mkdir /mnt/media
sudo mkdir /mnt/media2
sudo mkdir /mnt/media3

cd ~/git && git clone https://aur.archlinux.org/qt5-webengine-widevine.git && cd ~/git/qt5-webengine-widevine && makepkg -csi

cd ~/git && git clone https://aur.archlinux.org/c-lolcat.git && cd ~/git/c-lolcat && makepkg -csi

cd ~/git && git clone https://aur.archlinux.org/ttf-brutalist-mono.git && cd ~/git/ttf-brutalist-mono && makepkg -csi

cd ~/git && git clone --recurse-submodules https://github.com/flightlessmango/MangoHud.git  && cd ~/git/MangoHud && ./build.sh install && ./build.sh build

sudo mkdir /etc/default/grub
sudo mv ~/linuxconfig-arch/grub /etc/default/grub
sudo pacman -Rns ninja python-beaker meson python-mako

#  custom .dotfiles
mkdir ~/.config/i3 && mkdir ~/.config/kitty 
mv ~/linuxconfig-arch/pictures ~/git && mv ~/linuxconfig-arch/config ~/.config/i3/config && mv ~/linuxconfig-arch/kitty.conf ~/.config/kitty/kitty.conf 
touch ~/.xinitrc && echo -e '/usr/bin/pipewire & \n/usr/bin/pipewire-pulse & \nexec i3' >> ~/.xinitrc
echo -e 'set -g -x fish_greeting \nls -lah | lolcat' >> ~/.config/fish/config.fish
sudo dinitctl enable cpupower
rm -r ~/linuxconfig-arch
sudo grub-mkconfig -o /boot/grub/grub.cfg 
cd ~/git && git clone https://github.com/oh-my-fish/oh-my-fish && cd ~/git/oh-my-fish && bin/install --offline
