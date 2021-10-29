#!/bin/bash

# main packages
sudo pacman -Sy && sudo pacman -Syyu && sudo pacman -S base-devel 
sudo pacman -Sy

sudo pacman -S kitty i3 sxiv nitrogen vim dmenu cpupower htop vifm qutebrowser  
sudo pacman -Sy

sudo pacman -S pipewire pipewire-pulse pavucontrol
sudo pacman -Sy

sudo pacman -S steam discord gamemode gnome-boxes chromium lutris
sudo pacman -Sy

sudo pacman -S xclip xorg-server xorg-xinit xf86-input-libinput nvidia lib32-nvidia-utils
sudo pacman -Sy

sudo pacman -Syyu

# build & cleanup
mkdir ~/git

cd ~/git && git clone https://aur.archlinux.org/c-lolcat.git && cd ~/git/c-lolcat && makepkg -csi

cd ~/git && git clone https://aur.archlinux.org/ttf-brutalist-mono.git && cd ~/git/ttf-brutalist-mono && makepkg -csi

cd ~/git && git clone https://aur.archlinux.org/mesen.git && cd ~/git/mesen && makepkg -csi

cd ~/git && git clone https://aur.archlinux.org/m64py.git && cd ~/git/m64py && makepkg -csi

cd ~/git && git clone https://aur.archlinux.org/dolphin-emu-git.git && cd ~/git/dolphin-emu-git && makepkg -csi

cd ~/git && git clone https://aur.archlinux.org/epsxe.git && cd ~/git/epsxe && makepkg -csi

cd ~/git && git clone https://aur.archlinux.org/bsnes-hd.git && cd ~/git/bsnes-hd && makepkg -csi



cd ~/git && git clone --recurse-submodules https://github.com/flightlessmango/MangoHud.git  && cd ~/git/MangoHud && ./build.sh install && ./build.sh build

sudo mkdir /etc/default/grub
sudo mv ~/linuxconfig-arch/grub /etc/default/grub
sudo pacman -Rns ninja python-beaker meson python-mako

#  custom .dotfiles
mkdir ~/.config/i3 && mkdir ~/.config/kitty 
mv ~/linuxconfig-arch/pictures ~/git && mv ~/linuxconfig-arch/config ~/.config/i3/config && mv ~/linuxconfig-arch/kitty.conf ~/.config/kitty/kitty.conf 
touch ~/.xinitrc && echo -e 'bash -c "nitrogen --restore" \nexec i3' >> ~/.xinitrc
echo -e 'set -g -x fish_greeting \nls -lah | lolcat' >> ~/.config/fish/config.fish
touch ~/cpupower.service && echo -e '[Unit] \nDescription=CPU performance \n[Service] \nType=oneshot \ExecStart=/usr/bin/cpupower -c all frequency-set -g performance \n[Install] \nWantedBy=multi-user.target' >> ~/cpupower.service 
sudo mv ~/cpupower.service /etc/systemd/system/cpupower.service
sudo systemctl daemon-reload
sudo systemctl enable cpupower.service
rm -r ~/linuxconfig-arch
sudo grub-mkconfig -o /boot/grub/grub.cfg 
cd ~/git && git clone https://github.com/oh-my-fish/oh-my-fish && cd ~/git/oh-my-fish && bin/install --offline
