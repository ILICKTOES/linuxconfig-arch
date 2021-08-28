# linuxconfig
# i3 arch install
font=brutalist mono
Terminal=kitty
WM=i3
Web Browser=vivaldi
RUN=dmenu
GAMES=steam/Lutris
WallpaperCH=nitrogen
FETCH=pfetch
Tasks=htop

sudo micro ~/.xinitrc >>>
bash -c "nitrogen --restore"
exec i3

sudo pacman -S pipewire pipewire-pulse [Y]

# openbox debian install
debian 11 "Bullseye" 
Terminal=guake
WM=openbox
Web Browser=vivaldi
FETCH=screenfetch
# RASPBERRY PI
--ARM Twister OS
