#!/bin/bash

# EndeavourOS Hyprland Setup Script

echo "Updating system..."
sudo pacman -Syu --noconfirm

echo "Installing Hyprland and essential packages..."
sudo pacman -S --noconfirm \
  hyprland \
  waybar \
  rofi \
  wlogout \
  dunst \
  swww \
  kitty \
  lxappearance \
  papirus-icon-theme \
  ttf-jetbrains-mono \
  ttf-fira-code \
  grim \
  slurp \
  xdg-desktop-portal-hyprland \
  xdg-desktop-portal \
  qt5-wayland \
  qt6-wayland \
  pipewire pipewire-pulse wireplumber \
  polkit-gnome \
  neofetch \
  git \
  unzip \
  base-devel

echo "Creating config directories..."
mkdir -p ~/.config/{hypr,waybar,wlogout,rofi,wallpapers,scripts}

echo "Creating hyprland.conf..."
cat <<EOF > ~/.config/hypr/hyprland.conf
exec-once = waybar &
exec-once = dunst &
exec-once = swww init &
exec-once = swww img ~/wallpapers/your_wallpaper.jpg

input {
  kb_layout = us
}

general {
  gaps_in = 5
  gaps_out = 10
  border_size = 2
  col.active_border = rgba(ffb86cff)
  col.inactive_border = rgba(44475a99)
}

decoration {
  rounding = 10
}

monitor=,preferred,auto,1
EOF

echo "Writing .xinitrc..."
echo "exec Hyprland" > ~/.xinitrc

echo "Setting Polkit agent autostart..."
mkdir -p ~/.config/autostart
cat <<EOF > ~/.config/autostart/polkit-gnome-authentication-agent-1.desktop
[Desktop Entry]
Type=Application
Exec=/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
Hidden=false
X-GNOME-Autostart-enabled=true
Name=Polkit Agent
EOF

echo "Hyprland setup complete!"
echo "Reboot your system and run 'startx' to launch Hyprland."
