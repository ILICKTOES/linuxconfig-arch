#!/bin/bash

# main packages
sudo pacman -Sy && sudo pacman -Syyu && sudo pacman -S base-devel 
sudo pacman -Sy
sudo pacman -S kitty i3 sxiv nitrogen dmenu cpupower htop  
sudo pacman -Sy
sudo pacman -S pipewire pipewire-pulse pavucontrol
sudo pacman -Sy
sudo pacman -S steam discord gamemode gnome-boxes qutebrowser
sudo pacman -Sy
sudo pacman -S xclip xorg-server xorg-xinit xf86-input-libinput nvidia lib32-nvidia-utils
sudo pacman -Syy
# build & cleanup

mkdir ~/git

cd ~/git && git clone https://aur.archlinux.org/c-lolcat.git && cd ~/git/c-lolcat && makepkg -csi

cd ~/git && git clone https://aur.archlinux.org/ttf-brutalist-mono.git && cd ~/git/ttf-brutalist-mono && makepkg -csi

cd ~/git && git clone https://aur.archlinux.org/pfetch.git && cd ~/git/pfetch && makepkg -csi

cd ~/git && git clone https://aur.archlinux.org/libstrangle.git && cd ~/git/libstrangle && makepkg -csi

sudo mkdir /etc/default/grub
sudo mv ~/linuxconfig-arch/grub /etc/default/grub

rm -r ~/.config/fish/config.fish

mkdir ~/.config/fish/

touch ~/.config/fish/config.fish
echo -e 'set fish_greeting \nla -h | lolcat' >> ~/.config/fish/config.fish

#  custom .dotfiles
mkdir ~/.config/i3 && mkdir ~/.config/kitty
mv ~/linuxconfig-arch/pictures ~/git && mv ~/linuxconfig-arch/config ~/.config/i3/config && mv ~/linuxconfig-arch/kitty.conf ~/.config/kitty/kitty.conf 
touch ~/.xinitrc && echo -e 'bash -c "nitrogen --restore" \nexec i3' >> ~/.xinitrc
echo -e 'set -g -x fish_greeting '' \nla -h | lolcat' >> ~/.config/fish/config.fish
touch ~/cpupower.service && echo -e '[Unit] \nDescription=CPU performance \n[Service] \nType=oneshot \ExecStart=/usr/bin/cpupower -c all frequency-set -g performance \n[Install] \nWantedBy=multi-user.target' >> ~/cpupower.service 
sudo mv ~/cpupower.service /etc/systemd/system/cpupower.service
sudo systemctl daemon-reload
sudo systemctl enable cpupower.service
rm -r ~/linuxconfig-arch
sudo grub-mkconfig -o /boot/grub/grub.cfg 
cd ~/git && git clone https://github.com/oh-my-fish/oh-my-fish && cd ~/git/oh-my-fish && bin/install --offline
