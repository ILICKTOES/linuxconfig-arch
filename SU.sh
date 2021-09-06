#!/bin/bash
sudo systemctl enable NetworkManager
# main base install

sudo pacman -Sy && sudo pacman -Syyu && sudo pacman -S archlinux-keyring pipewire pipewire-pulse kitty fish i3 discord micro nitrogen dmenu cpupower htop pavucontrol xclip xorg 

# build deps
sudo pacman -S gn ninja clang lld gperf nodejs jre-openjdk-headless 

sudo pacman -S xdg-utils ttf-liberation libva ffmpeg minizip re2
cd ~/ && git clone https://github.com/ungoogled-software/ungoogled-chromium-archlinux && cd ~/ungoogled-chromium-archlinux && makepkg
cd ~/ && git clone https://aur.archlinux.org/c-lolcat.git && cd ~/c-lolcat && makepkg

cd ~/ && git clone https://aur.archlinux.org/ttf-brutalist-mono.git && ~/ttf-brutalist-mono && makepkg

cd ~/ && git clone https://aur.archlinux.org/pfetch.git && cd ~/pfetch && makepkg

sudo pacman -Rn gn ninja clang lld gperf nodejs jre-openjdk-headless 

sudo pacman -Rn manjaro-zsh-config mnajaro-system zsh && sudo pacman -Rn tlp nano vi

sudo pacman -S preload && sudo systemctl enable preload

sudo mv ~/linuxconfig-arch/grub /etc/default/grub

#  custom .dotfiles
sudo rm -r /etc/pulse
rm ~/.zshrc
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

cd ~/ && git clone https://github.com/oh-my-fish/oh-my-fish && cd ~/oh-my-fish && bin/install --offline

