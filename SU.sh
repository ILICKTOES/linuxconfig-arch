#!/bin/bash
# yay install for vanilla arch
# 
# sudo pacman -S yay 
#
# main base install

sudo pacman -Syyu & sudo pacman -S pipewire pipewire-pulse kitty fish i3 discord micro nitrogen dmenu cpupower htop pavucontrol && sudo systemctl enable cpupower

yay -S brave && ttf-brutalist-mono
yay -S lolcat && yay -S pfetch

sudo pacman -Rn manjaro-zsh-config mnajaro-system  & sudo pacman -Rn tlp 
sudo pacman -S preload && sudo systemctl enable preload

cd ~/ && git clone https://github.com/oh-my-fish/oh-my-fish && cd ~/oh-my-fish && bin/install --offline


#  custom .dotfiles
cd ~/ && git clone https://github.com/ILICKTOES/linuxconfig.git
mv ~/linuxconfig/pictures ~/ && mv ~/linuxconfig/config ~/.config/i3/config && mv ~/linuxconfig/kitty.conf ~/.config/kitty/kitty.conf 
touch ~/.xinitrc & echo -e 'bash -c "nitrogen --restore" \nexec i3 >> ~/.xinitrc'

rm -r ~/linuxconfig
 echo -e 'done.'
