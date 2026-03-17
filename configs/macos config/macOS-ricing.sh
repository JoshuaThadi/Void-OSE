#!/bin/bash

set -e

echo "Starting macOS ricing setup..."

# 1. Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
  echo "🔧 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing apps and utilities..."

# 2. Install macOS ricing tools
brew install --cask \
  iterm2 \
  amethyst \
  hiddenbar \
  stats \
  alt-tab \
  rectangle \
  raycast

# 3. Install terminal tools
brew install \
  zsh \
  starship \
  neovim \
  gh \
  bat \
  exa

# 4. Install fonts
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font

# 5. Set up Starship prompt
mkdir -p ~/.config
cat <<EOF > ~/.config/starship.toml
add_newline = false

[character]
symbol = "➜"
style = "bold green"
EOF

# 6. Update ~/.zshrc
if ! grep -q "starship" ~/.zshrc; then
  echo 'eval "$(starship init zsh)"' >> ~/.zshrc
fi

# 7. iTerm2 profile setup tip
echo "Please manually set JetBrains Mono Nerd Font in iTerm2 > Preferences > Profiles > Text."

# 8. Clean dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock static-only -bool true
killall Dock

# 9. Final message
echo "macOS ricing tools installed!"
echo "Now set iTerm2 font and customize Raycast, HiddenBar, and Amethyst to your liking."
