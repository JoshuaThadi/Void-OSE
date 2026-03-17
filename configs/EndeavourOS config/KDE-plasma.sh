#!/bin/bash

# EndeavourOS KDE Plasma Setup Script

echo "Updating system..."
sudo pacman -Syu --noconfirm

echo "Installing KDE Plasma and essential packages..."
sudo pacman -S --noconfirm \
  plasma-meta \
  kde-applications-meta \
  sddm \
  konsole \
  dolphin \
  ark \
  spectacle \
  firefox \
  neofetch \
  git \
  base-devel \
  nano \
  unzip \
  wget \
  curl \
  papirus-icon-theme \
  ttf-jetbrains-mono \
  ttf-fira-code

echo "Enabling display manager (SDDM)..."
sudo systemctl enable sddm.service

echo "Setting up user configuration directories..."
mkdir -p ~/.config/{autostart,scripts,wallpapers}

echo "Setting default icon theme to Papirus..."
mkdir -p ~/.config/kdeglobals
cat <<EOF > ~/.config/kdeglobals
[Icons]
Theme=Papirus
EOF

echo "Copying sample wallpaper..."
# You can replace this with your actual wallpaper path
wget -O ~/wallpapers/kde_wallpaper.jpg https://wallpapercave.com/wp/wp5128415.jpg

echo "Creating autostart script for setting wallpaper..."
cat <<EOF > ~/.config/autostart/wallpaper.desktop
[Desktop Entry]
Type=Application
Exec=plasma-apply-wallpaperimage ~/wallpapers/kde_wallpaper.jpg
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Set KDE Wallpaper
Comment=Sets a custom wallpaper at login
EOF

echo "Installing optional extras (Yay AUR helper)..."
if ! command -v yay &> /dev/null; then
  cd ~
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
fi

echo "Installing Latte Dock from AUR..."
yay -S --noconfirm latte-dock

echo "Creating custom KDE config snippet..."
mkdir -p ~/.config/autostart-scripts
cat <<EOF > ~/.config/autostart-scripts/startup.sh
#!/bin/bash
# Custom startup script
neofetch
EOF
chmod +x ~/.config/autostart-scripts/startup.sh

echo "Setup complete!"
echo "Reboot your system to launch into KDE Plasma."
