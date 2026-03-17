#!/bin/bash

# Arch Linux Hyprland Setup Script
# Tested on a minimal Arch install with systemd-boot or GRUB, and no existing DE/WM.

set -e

echo "Updating system..."
sudo pacman -Syu --noconfirm

echo "Installing essential packages..."
sudo pacman -S --noconfirm \
  base-devel git cmake ninja meson \
  wayland wayland-protocols wlroots \
  xorg-xwayland xdg-desktop-portal-wlr \
  libinput libxkbcommon pixman \
  waybar rofi wlogout dunst swww kitty \
  lxappearance papirus-icon-theme \
  ttf-jetbrains-mono ttf-fira-code \
  grim slurp unzip

echo "Installing yay AUR helper (if not already installed)..."
if ! command -v yay &>/dev/null; then
  cd ~
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
fi

echo "Installing Hyprland and deps via AUR..."
yay -S --noconfirm hyprland-git hyprpaper-git

echo "Creating config directories..."
mkdir -p ~/.config/{hypr,waybar,wlogout,rofi,wallpapers,scripts}

echo "Writing basic hyprland.conf..."
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

echo "Writing .xinitrc for startx launch..."
echo "exec Hyprland" > ~/.xinitrc

echo "Hyprland setup complete!"
echo "Reboot and run 'startx' to launch Hyprland, or use a display manager that supports Wayland sessions."
