#!/bin/bash

# ----------------------------------------------------------------
# Kali Linux GNOME Full Setup Script
# Author: YourName
# Description: Automates GNOME install, extension tools, themes,
#              tweaks, wallpaper setup, and basic configurations.
# ----------------------------------------------------------------

set -e

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing GNOME Desktop..."
sudo apt install kali-desktop-gnome -y

echo "Installing GNOME extensions support..."
sudo apt install gnome-shell-extensions chrome-gnome-shell gnome-tweaks -y

echo "Installing themes and icons..."
sudo apt install gnome-themes-extra papirus-icon-theme -y

# Create config folders
echo "Creating configuration folders..."
mkdir -p ~/.themes ~/.icons ~/Pictures/Wallpapers ~/Downloads/gnome-setup/configs/extensions

# Copy wallpaper if available
if [ -f "wallpapers/your_wallpaper.png" ]; then
  echo "Setting wallpaper..."
  cp wallpapers/your_wallpaper.png ~/Pictures/Wallpapers/
  gsettings set org.gnome.desktop.background picture-uri "file://$HOME/Pictures/Wallpapers/your_wallpaper.png"
fi

# Import terminal profile if available
if [ -f "configs/gnome-terminal-profiles.dconf" ]; then
  echo "Importing GNOME terminal profile..."
  dconf load /org/gnome/terminal/legacy/profiles:/ < configs/gnome-terminal-profiles.dconf
fi

# Set basic keybindings
echo "Setting custom keybindings..."
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"

echo "Enabling recommended extensions (if already installed)..."
gnome-extensions enable dash-to-dock@micxgx.gmail.com || echo "Dash to Dock not found"
gnome-extensions enable blur-my-shell@aunetx || echo "Blur My Shell not found"

echo "GNOME setup complete! Please reboot or log out and log back in to apply changes."

# Make it executable:
chmod +x setup-gnome-kali.sh

# Run it
./setup-gnome-kali.sh
