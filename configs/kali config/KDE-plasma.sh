#!/bin/bash

set -e

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing KDE Plasma desktop..."
sudo apt install -y kali-desktop-kde

read -p "Do you want to remove XFCE and LightDM? [y/N]: " remove_old
if [[ "$remove_old" =~ ^[Yy]$ ]]; then
  echo "Removing XFCE and LightDM..."
  sudo apt purge -y xfce4 xfce4-* lightdm lightdm-*
  sudo apt autoremove --purge -y
fi

echo "Installing fonts..."
mkdir -p ~/.local/share/fonts
cp -r fonts/* ~/.local/share/fonts/
fc-cache -fv

echo "Installing icon themes..."
mkdir -p ~/.local/share/icons
cp -r icons/* ~/.local/share/icons/

echo "Installing Plasma themes..."
mkdir -p ~/.local/share/plasma/desktoptheme
cp -r themes/* ~/.local/share/plasma/desktoptheme/

echo "Copying KDE config files..."
mkdir -p ~/.config
cp -r configs/kdeglobals ~/.config/ 2>/dev/null || true
cp -r configs/plasmarc ~/.config/ 2>/dev/null || true
cp -r configs/kwinrc ~/.config/ 2>/dev/null || true

echo "Setting up autostart..."
mkdir -p ~/.config/autostart
cp -r configs/autostart/* ~/.config/autostart/ 2>/dev/null || true

echo "Copying wallpapers..."
mkdir -p ~/Pictures/Wallpapers
cp -r wallpapers/* ~/Pictures/Wallpapers/

echo "Installing additional KDE tools..."
sudo apt install -y latte-dock kdeconnect

echo "KDE Plasma setup complete!"
echo "Please reboot or log out and choose 'Plasma' from the session menu."

Make it executable:
chmod +x kde-plasma-setup.sh

Run it:
./kde-plasma-setup.sh
