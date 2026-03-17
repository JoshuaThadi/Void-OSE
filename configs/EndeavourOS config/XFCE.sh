#!/bin/bash

# EndeavourOS XFCE Setup Script

echo "Updating system..."
sudo pacman -Syu --noconfirm

echo "Installing XFCE desktop environment and essentials..."
sudo pacman -S --noconfirm \
  xfce4 xfce4-goodies \
  lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings \
  network-manager-applet gvfs gvfs-smb \
  thunar-archive-plugin file-roller pavucontrol \
  xdg-user-dirs xdg-utils \
  xfce4-whiskermenu-plugin \
  noto-fonts ttf-jetbrains-mono ttf-fira-code \
  neofetch kitty mousepad

echo "Enabling LightDM (display manager)..."
sudo systemctl enable lightdm.service

echo "Creating user config directories..."
mkdir -p ~/.config/xfce4/xfconf/xfce-perchannel-xml
mkdir -p ~/Pictures/Wallpapers

echo "Setting up wallpaper (placeholder path)..."
WALLPAPER_PATH="$HOME/Pictures/Wallpapers/my_wallpaper.jpg"
if [ ! -f "$WALLPAPER_PATH" ]; then
  echo "Please place your wallpaper at: $WALLPAPER_PATH"
fi

echo "Creating .xinitrc to launch XFCE..."
cat <<EOF > ~/.xinitrc
exec startxfce4
EOF

echo "Creating some default XFCE configs..."
cat <<EOF > ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml
<?xml version="1.0" encoding="UTF-8"?>
<channel name="xfce4-desktop" version="1.0">
  <property name="backdrop" type="empty">
    <property name="screen0" type="empty">
      <property name="monitor0" type="empty">
        <property name="image-path" type="string" value="$WALLPAPER_PATH"/>
        <property name="image-style" type="int" value="3"/>
        <property name="image-show" type="bool" value="true"/>
      </property>
    </property>
  </property>
</channel>
EOF

echo "XFCE setup complete!"
echo "You can reboot and XFCE will start automatically using LightDM."
echo "Or, to start manually: run startx (if you disable LightDM)."
