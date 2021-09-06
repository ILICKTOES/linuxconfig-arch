#!/bin/bash
# yay install for vanilla arch
# 
# sudo pacman -S yay 
#
# main base install

sudo pacman -Sy && sudo pacman -S pipewire pipewire-pulse kitty fish i3 discord micro nitrogen dmenu cpupower htop pavucontrol && sudo systemctl enable cpupower

yay -S brave
yay -S lolcat 
yay -S ttf-brutalist-mono
yay -S pfetch

sudo pacman -Rn manjaro-zsh-config mnajaro-system zsh && sudo pacman -Rn tlp 
sudo pacman -S preload && sudo systemctl enable preload

#  custom .dotfiles
sudo rm -r /etc/pulse
rm ~/.zshrc
rm ~/.xinitrc
cd ~/ 
mkdir ~/.config/i3 && mkdir ~/.config/kitty
mv ~/linuxconfig/pictures ~/ && mv ~/linuxconfig/config ~/.config/i3/config && mv ~/linuxconfig/kitty.conf ~/.config/kitty/kitty.conf 
touch ~/.xinitrc && echo -e 'bash -c "nitrogen --restore" \nexec i3' >> ~/.xinitrc
rm -r ~/linuxconfig
echo -e 'set -g -x fish_greeting '' \nla -h | lolcat' >> ~/.config/fish/config.fish
cd ~/ && git clone https://github.com/oh-my-fish/oh-my-fish && cd ~/oh-my-fish && bin/install --offline

