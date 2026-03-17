#!/bin/bash

# Kali Linux XFCE Setup Script

echo "Updating system..."
sudo apt update && sudo apt full-upgrade -y

echo "Installing XFCE desktop environment and useful tools..."
sudo apt install -y \
  xfce4 xfce4-goodies lightdm lightdm-gtk-greeter \
  network-manager-gnome gvfs gvfs-backends thunar-archive-plugin \
  pavucontrol xarchiver firefox-esr \
  fonts-firacode fonts-jetbrains-mono papirus-icon-theme

echo "Enabling LightDM display manager..."
sudo systemctl enable lightdm

echo "Creating config directories..."
mkdir -p ~/.config/xfce4/xfconf/xfce-perchannel-xml
mkdir -p ~/Pictures ~/Downloads ~/Documents ~/wallpapers

echo "Setting XFCE appearance (icon theme and font)..."
xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus"
xfconf-query -c xsettings -p /Gtk/FontName -s "Fira Code 11"

echo "Setting up wallpaper (example)..."
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s ~/wallpapers/your_wallpaper.jpg

echo "XFCE setup complete! Reboot to start XFCE desktop."
