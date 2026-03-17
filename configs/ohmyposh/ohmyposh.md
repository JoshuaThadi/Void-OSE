/* --------------------- windows ------------------------- */

# Install Oh My Posh
winget install JanDeDobbeleer.OhMyPosh -s winget

# Optional: Install Nerd Font (required for icons and glyphs)
winget install --id=Delugia.Nerd.Font -e

# Set up PowerShell profile
if (!(Test-Path -Path $PROFILE)) {
  New-Item -ItemType File -Path $PROFILE -Force
}

# Add this to your PowerShell profile (~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1)
Add-Content -Path $PROFILE -Value @'
oh-my-posh init pwsh --config "$(oh-my-posh get shell-path pwsh)" | Invoke-Expression
Set-PoshPrompt -Theme jandedobbeleer
'@

# Reload profile to apply changes
. $PROFILE


/* --------------------- macOS ------------------------- */
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Oh My Posh via Homebrew
brew install oh-my-posh

# Optional: Install a Nerd Font (e.g., Meslo)
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

# Ensure profile exists
if (!(Test-Path -Path $PROFILE)) {
  New-Item -ItemType File -Path $PROFILE -Force
}

# Add this to your PowerShell profile (~/.config/powershell/Microsoft.PowerShell_profile.ps1)
Add-Content -Path $PROFILE -Value @'
oh-my-posh init pwsh --config "$(brew --prefix)/etc/oh-my-posh/themes/jandedobbeleer.omp.json" | Invoke-Expression
Set-PoshPrompt -Theme jandedobbeleer
'@

# Reload profile
. $PROFILE


/* --------------------- linux ------------------------- */
# Download Oh My Posh binary
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O oh-my-posh
chmod +x oh-my-posh
sudo mv oh-my-posh /usr/local/bin

# Optional: Install a Nerd Font manually or via package manager

# Create themes directory and download a theme
mkdir -p ~/.poshthemes
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json -O ~/.poshthemes/jandedobbeleer.omp.json
chmod u+rw ~/.poshthemes/jandedobbeleer.omp.json

# Ensure profile exists
if (!(Test-Path -Path $PROFILE)) {
  New-Item -ItemType File -Path $PROFILE -Force
}

# Add this to your PowerShell profile (~/.config/powershell/Microsoft.PowerShell_profile.ps1)
Add-Content -Path $PROFILE -Value @'
oh-my-posh init pwsh --config ~/.poshthemes/jandedobbeleer.omp.json | Invoke-Expression
Set-PoshPrompt -Theme jandedobbeleer
'@

# Reload profile
. $PROFILE