# Enable the required Windows features
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Restart the computer to apply changes
Write-Host "Restarting the system to complete WSL2 feature installation..." -ForegroundColor Yellow
Restart-Computer

#After restarting, run the following part in PowerShell (Admin) again:

# Install the latest WSL kernel update
wsl --update

# Set WSL2 as the default version
wsl --set-default-version 2

# Install your preferred Linux distro (e.g., Ubuntu)
wsl --install -d Ubuntu

# Optional: List available distros
# wsl --list --online

# Optional: Set default Linux user (after first run)
# Replace "your_username" with your actual Linux username
# ubuntu config --default-user your_username

# Confirm everything is working
wsl --status

# Once the distro launches (e.g., Ubuntu), set it up:
# Update packages
sudo apt update && sudo apt upgrade -y

# Install basic utilities
sudo apt install git curl wget zip unzip build-essential -y

# (Optional) Install Zsh, Oh My Zsh, etc.



#If wsl --install doesn't work, use:
wsl --set-default-version 2
wsl --install -d Ubuntu
