OS := $(shell uname)

.PHONY: all windows macos linux

all:
ifeq ($(OS),Linux)
	@$(MAKE) linux
else ifeq ($(OS),Darwin)
	@$(MAKE) macos
else
	@echo "Unsupported OS or please run Windows section manually in PowerShell."
endif

windows:
	@echo "Windows setup must be run manually in PowerShell."
	@echo "See instructions in windows-posh-setup.ps1"

macos:
	@echo "Installing Oh My Posh on macOS..."
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew install oh-my-posh
	brew tap homebrew/cask-fonts
	brew install --cask font-meslo-lg-nerd-font
	mkdir -p $$HOME/.config/powershell
	echo "oh-my-posh init pwsh --config \"`brew --prefix`/etc/oh-my-posh/themes/jandedobbeleer.omp.json\" | Invoke-Expression" >> $$HOME/.config/powershell/Microsoft.PowerShell_profile.ps1

linux:
	@echo "Installing Oh My Posh on Linux..."
	wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O oh-my-posh
	chmod +x oh-my-posh
	sudo mv oh-my-posh /usr/local/bin
	mkdir -p $$HOME/.poshthemes
	wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json -O $$HOME/.poshthemes/jandedobbeleer.omp.json
	chmod u+rw $$HOME/.poshthemes/jandedobbeleer.omp.json
	mkdir -p $$HOME/.config/powershell
	echo "oh-my-posh init pwsh --config $$HOME/.poshthemes/jandedobbeleer.omp.json | Invoke-Expression" >> $$HOME/.config/powershell/Microsoft.PowerShell_profile.ps1
