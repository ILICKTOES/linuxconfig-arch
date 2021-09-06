# i3 arch install
# notes

sudo micro ~/.xinitrc >>>
bash -c "nitrogen --restore"
exec i3

micro ~/.config/fish/config.fish>>>>>
la -h | lolcat
set -g -x fish_greeting ''

font=brutalist mono
Terminal=kitty
WM=i3
Web Browser=vivaldi
RUN=dmenu
GAMES=steam/Lutris
WallpaperCH=nitrogen
FETCH=pfetch
Tasks=htop
