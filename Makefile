NIX_PATH = ~/.config/nix
HOME_MANAGER_PATH = ~/.config/home-manager

init:
	@echo "Initializing NixOS configuration..."
	@mkdir -p $(NIX_PATH)
	@mkdir -p $(HOME_MANAGER_PATH)
	@ln -s $(PWD)/nix.conf $(NIX_PATH)/nix.conf
	@ln -s $(PWD)/flake.nix $(HOME_MANAGER_PATH)/flake.nix
	@ln -s $(PWD)/home.nix $(HOME_MANAGER_PATH)/home.nix
	@ln -s $(PWD)/zsh $(HOME_MANAGER_PATH)/zsh
	@ln -s $(PWD)/files $(HOME_MANAGER_PATH)/files
	@echo "Done!"
