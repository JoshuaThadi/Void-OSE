# 🌀 Hyprland Setup Guide for Kali Linux

This guide helps you install and configure the Hyprland Wayland compositor on Kali Linux, including necessary dependencies, configuration structure, and aesthetic customization.

---

## 📁 Folder Structure

```bash
~/.config/
├── hypr/               # Main Hyprland config
│   ├── hyprland.conf
│   └── ...
├── waybar/             # Status bar config
│   ├── config
│   └── style.css
├── wlogout/            # Logout menu
│   └── layout
├── rofi/               # App launcher
│   └── config.rasi
├── wallpapers/         # Your wallpapers
└── scripts/            # Custom scripts (e.g., for screenshot, lock, etc.)
```

---

## ⚙️ System Preparation

### 1. Update your system

```bash
sudo apt update && sudo apt full-upgrade -y
```

---

## 📦 Install Required Dependencies

### 2. Install base build tools and dependencies

```bash
sudo apt install -y \
  build-essential \
  cmake \
  git \
  libwayland-dev \
  libx11-dev \
  libxcb-composite0-dev \
  libxcb-xinput-dev \
  libxkbcommon-dev \
  libpixman-1-dev \
  libxrender-dev \
  ninja-build \
  libinput-dev \
  libxcb1-dev \
  libxcb-ewmh-dev \
  libxcb-icccm4-dev \
  libxcb-image0-dev \
  libxcb-keysyms1-dev \
  libxcb-randr0-dev \
  libxcb-util0-dev \
  libxcb-xinerama0-dev \
  libxcb-xkb-dev \
  meson \
  wayland-protocols \
  wayland-utils \
  xdg-desktop-portal-wlr \
  unzip
```

---

## 🚀 Install Hyprland

### 3. Clone & Build from Source

```bash
cd ~
git clone https://github.com/hyprwm/Hyprland
cd Hyprland
make all
sudo make install
```

> Tip: You can also use hyprland-git AUR or package it via hyprland-debian, but this is the pure build-from-source method.

---

## 🧩 Install Additional Components

### 4. Waybar (Status Bar)

```bash
sudo apt install waybar
```

### 5. Rofi (Launcher)

```bash
sudo apt install rofi
```

### 6. wlogout (Logout menu)

```bash
sudo apt install wlogout
```

### 7. Notification Daemon (e.g., Dunst)

```bash
sudo apt install dunst
```

### 8. Wallpaper Utility

```bash
sudo apt install swww
```

### 9. Terminal (Recommended: Kitty or Alacritty)

```bash
sudo apt install kitty
# or
sudo apt install alacritty
```

---

## 🖼️ Themes and Fonts

```bash
sudo apt install lxappearance papirus-icon-theme fonts-jetbrains-mono fonts-firacode
```

---

## 🧠 Create Config Directory

### 10. Create the config directory and add default configs

```bash
mkdir -p ~/.config/{hypr,waybar,wlogout,rofi,wallpapers,scripts}
```

Create `~/.config/hypr/hyprland.conf` with:

```ini
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
```

> Add more keybindings and modules as needed.

---

## 💻 Launching Hyprland

### 11. Create a .xinitrc (if using startx)

```bash
echo 'exec Hyprland' > ~/.xinitrc
startx
```

Or log in from a Wayland-compatible display manager like GDM or SDDM. Make sure it detects Hyprland as a session.

---

## 🦺 Verify Everything

```bash
Hyprland
```

Or reboot and choose Hyprland from your login manager session.

---

## 📦 Optional: Autostart Apps with systemd

Create a script in `~/.config/scripts/autostart.sh`:

```bash
#!/bin/bash
swww init && swww img ~/wallpapers/your_wallpaper.jpg &
dunst &
waybar &
```

Make it executable:

```bash
chmod +x ~/.config/scripts/autostart.sh
```

Then in `hyprland.conf`:

```ini
exec-once = ~/.config/scripts/autostart.sh
```

---

## 📸 Screenshot Tool

Install grim and slurp:

```bash
sudo apt install grim slurp
```

Bind to a key in `hyprland.conf`:

```ini
bind = $mod, S, exec, grim -g "$(slurp)" ~/Pictures/screenshot_$(date +%s).png
```

---

## ✅ Final Tips

- Use `lxappearance` to change GTK theme/icons.
- Wallpapers go in `~/.config/wallpapers`.
- Customize Waybar using `~/.config/waybar/config` and `style.css`.
- Lock screen tool: swaylock or betterlockscreen.
