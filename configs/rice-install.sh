#!/bin/bash

# Exit on errors
set -e

echo "Starting Hyprland Rice Installation for Arch-based systems..."

# Update system
sudo pacman -Syu --noconfirm

# Required dependencies
echo "Installing essential packages..."
sudo pacman -S --noconfirm hyprland waybar wofi wlogout \
  kitty neofetch zsh grim slurp swappy \
  hyprpaper pipewire pipewire-pulse wireplumber \
  qt5-wayland qt6-wayland xdg-desktop-portal-hyprland \
  network-manager-applet pavucontrol lxappearance \
  ttf-jetbrains-mono-nerd ttf-font-awesome

# Optional extras
echo "Installing theming tools..."
sudo pacman -S --noconfirm papirus-icon-theme kvantum qt5ct qt6ct

# Create config folders
mkdir -p ~/.config/{hypr,waybar,wofi,kitty,swappy,hyprpaper}

# Hyprland config
echo "Setting up config files..."
cat <<EOF > ~/.config/hypr/hyprland.conf
# Basic Hyprland Config
exec-once = waybar &
exec-once = hyprpaper &
exec-once = nm-applet &
exec-once = wlogout
EOF

# Waybar config
cat <<EOF > ~/.config/waybar/config.jsonc
{
  "layer": "top",
  "modules-left": ["hyprland/workspaces"],
  "modules-center": ["clock"],
  "modules-right": ["network", "pulseaudio", "battery"]
}
EOF

# Hyprpaper wallpaper
mkdir -p ~/Pictures/wallpapers
cp /path/to/your/wallpaper.jpg ~/Pictures/wallpapers/
cat <<EOF > ~/.config/hyprpaper/hyprpaper.conf
preload = ~/Pictures/wallpapers/wallpaper.jpg
wallpaper = eDP-1,~/Pictures/wallpapers/wallpaper.jpg
EOF

# Set zsh as default shell
chsh -s $(which zsh)

# Neofetch config
mkdir -p ~/.config/neofetch
echo 'print_info() { info "OS" "$distro"; info "WM" "Hyprland"; }' > ~/.config/neofetch/config.conf

echo "Hyprland rice installation complete. Reboot and enjoy!"
