echo "\n\n => Instalando o tema, icones, cursores e fontes \n\n"
unzip -o $HOME/Downloads/gnome-extensions.zip -d $HOME/.local/share/gnome-shell/
mkdir -p $HOME/.themes
unzip -o $HOME/Downloads/GTK-Themes.zip -d $HOME/.themes
ln -sf $HOME/.themes/Orchis-Dark/gtk-4.0/{assets,gtk.css,gtk-dark.css} $HOME/.config/gtk-4.0/
mkdir -p $HOME/.local/share/icons
unzip -o $HOME/Downloads/icons-themes.zip -d $HOME/.local/share/icons
mkdir $HOME/.icons
unzip -o $HOME/Downloads/cursors-theme.zip -d $HOME/.icons
unzip -o $HOME/Downloads/fonts.zip -d $HOME/.local/share/
sudo unzip -o ~/Downloads/Wallpapers.zip -d /usr/share/backgrounds/

echo "\n\n => Instalando conky widgets, cava e neofetch \n\n"
sudo apt install conky-all jq curl playerctl -y
unzip -o ~/Downloads/conky-config.zip -d $HOME/.config
sudo apt install cava -y
unzip -o $HOME/Downloads/cava-config.zip -d $HOME/.config/
sudo apt install neofetch -y 
unzip -o $HOME/Downloads/neofetch-config.zip -d $HOME/.config/

echo "\n\n => Instalando fish e oh-my-posh \n\n"
sudo apt install fish -y
chsh -s /usr/bin/fish
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
unzip -o $HOME/Downloads/fishomp-config.zip -d $HOME
chmod u+rw ~/.poshthemes/*.json

echo "\n\n => Instalando flatpak \n\n"
sudo apt install gnome-software gnome-software-plugin-flatpak flatpak libfuse2 -y 
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub io.bassi.Amberol -y
flatpak install flathub net.agalwood.Motrix -y
flatpak install flathub com.rafaelmardojai.Blanket -y
flatpak install falthub com.github.KRTirtho.Spotube -y 
faltpak install flathub com.mattjakeman.ExtensionManager -y
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.local/share/icons
sudo flatpak override --filesystem=xdg-config/gtk-4.0

echo "\n\n => Instalando gnome softwares e plymouth\n\n"
sudo apt install gnome-weather gnome-maps gnome-audio gnome-calendar gnome-clocks gnome-connections gnome-console gnome-contacts gnome-music vlc gnome-shell-pomodoro -y
sudo apt install plymouth -y
sudo unzip -o $HOME/Downloads/plymouth-theme.zip -d /usr/share/plymouth/themes
sudo update-alternatives --install \ /usr/share/plymouth/themes/default.plymouth default.plymouth \ /usr/share/pymouth/themes/hexagon_dots/hexagon_dots.plymouth 100
sudo apt update-alternatives --config default.plymouth
sudo update-initramsfs -u 

echo "\n\n => Aplicando mudanças \n\n"
unzip $HOME/Downoads/ubuntu-desktop-settings.zip -d $HOME/Downloads/
dconf load / < $HOME/Downloads/ubuntu-desktop-settings.conf