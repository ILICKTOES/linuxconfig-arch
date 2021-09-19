#!/bin/bash

# main packages
sudo pacman -Sy && sudo pacman -Syyu && sudo pacman -S base-devel 
sudo pacman -S kitty i3 sxiv nitrogen dmenu cpupower qutebrowser htop 
sudo pacman -S pipewire pipewire-pulse pavucontrol
sudo pacman -S steam discord gamemode
sudo pacman -S gnome-boxes
sudo pacman -S xclip xorg-server xorg-xinit xf86-input-libinput nvidia lib32-nvidia-utils
sudo pacman -Syy
# build & cleanup

cd ~/ && git clone https://aur.archlinux.org/c-lolcat.git && cd ~/c-lolcat && makepkg -csi

cd ~/ && git clone https://aur.archlinux.org/ttf-brutalist-mono.git && cd ~/ttf-brutalist-mono && makepkg -csi

cd ~/ && git clone https://aur.archlinux.org/pfetch.git && cd ~/pfetch && makepkg -csi

cd ~/ && git clone https://aur.archlinux.org/libstrangle.git && cd ~/libstrangle && makepkg -csi

sudo mkdir /etc/default/grub
sudo mv ~/linuxconfig-arch/grub /etc/default/grub

#  custom .dotfiles
rm ~/.xinitrc
cd ~/ 
mkdir ~/.config/i3 && mkdir ~/.config/kitty
mv ~/linuxconfig-arch/pictures ~/ && mv ~/linuxconfig-arch/config ~/.config/i3/config && mv ~/linuxconfig-arch/kitty.conf ~/.config/kitty/kitty.conf 
touch ~/.xinitrc && echo -e 'bash -c "nitrogen --restore" \nexec i3' >> ~/.xinitrc
rm -r ~/linuxconfig-arch
echo -e 'set -g -x fish_greeting '' \nla -h | lolcat' >> ~/.config/fish/config.fish
touch ~/cpupower.service && echo -e '[Unit] \nDescription=CPU performance \n[Service] \nType=oneshot \ExecStart=/usr/bin/cpupower -c all frequency-set -g performance \n[Install] \nWantedBy=multi-user.target' >> ~/cpupower.service 
sudo mv ~/cpupower.service /etc/systemd/system/cpupower.service
sudo systemctl daemon-reload
sudo systemctl enable cpupower.service
sudo mkdir ~/.steam/
sudo mkdir ~/.steam/root/
sudo mkdir ~/.steam/root/compatibilitytools.d
sudo grub-mkconfig -o /boot/grub/grub.cfg 
cd ~/ && git clone https://github.com/oh-my-fish/oh-my-fish && cd ~/oh-my-fish && bin/install --offline
