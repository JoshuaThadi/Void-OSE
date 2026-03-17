# Run this as Administrator

# 1. Install Chocolatey (package manager)
Write-Host "🔧 Installing Chocolatey..." -ForegroundColor Cyan
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = 'Tls12'
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Refresh session
refreshenv

# 2. Install ricing utilities
Write-Host "Installing ricing tools..." -ForegroundColor Cyan
choco install -y `
  rainmeter `
  roundedtb `
  translucenttb `
  7zip `
  vscode `
  powertoys `
  neofetch `
  nerd-fonts-jetbrainsmono

# 3. Install optional aesthetic fonts
Write-Host "Installing aesthetic fonts..." -ForegroundColor Cyan
choco install -y `
  font-inter `
  font-hacknerd `
  font-firacode `
  font-iosevkanerd

# 4. Download Rainmeter Skins (optional)
Write-Host "Downloading sample Rainmeter skins..." -ForegroundColor Cyan
$rainSkins = "https://github.com/vednoc/dotfiles/raw/main/Windows/Rainmeter/Mond.rmskin"
Invoke-WebRequest $rainSkins -OutFile "$env:USERPROFILE\Downloads\Mond.rmskin"

# 5. Launch key apps
Start-Process "C:\Program Files\Rainmeter\Rainmeter.exe"
Start-Process "C:\Program Files\RoundedTB\RoundedTB.exe"
Start-Process "C:\Program Files\TranslucentTB\TranslucentTB.exe"

Write-Host "`All ricing tools installed!" -ForegroundColor Green
Write-Host "Import 'Mond.rmskin' from Downloads into Rainmeter."
Write-Host "Customize your setup with Wallpapers, Icons, and Fonts."
