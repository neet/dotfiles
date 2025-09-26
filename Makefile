NIX_PATH = ~/.config/nix
NVIM_PATH = ~/.config/nvim
HOME_MANAGER_PATH = ~/.config/home-manager

init:
	@echo "Initializing Nix configuration..."

	@mkdir -p $(NIX_PATH)
	@mkdir -p $(HOME_MANAGER_PATH)
	@mkdir -p $(NVIM_PATH)

	@rm -f $(NIX_PATH)/nix.conf
	@rm -f $(NVIM_PATH)/init.lua
	@rm -rf $(NVIM_PATH)/lua
	@rm -f $(HOME_MANAGER_PATH)/flake.nix
	@rm -f $(HOME_MANAGER_PATH)/home.nix
	@rm -f $(HOME_MANAGER_PATH)/files
	@rm -f $(HOME_MANAGER_PATH)/zsh

	@ln -s $(PWD)/nix.conf $(NIX_PATH)/nix.conf
	@ln -s $(PWD)/nvim/init.lua $(NVIM_PATH)/init.lua
	@ln -s $(PWD)/nvim/lua $(NVIM_PATH)/lua
	@ln -s $(PWD)/flake.nix $(HOME_MANAGER_PATH)/flake.nix
	@ln -s $(PWD)/home.nix $(HOME_MANAGER_PATH)/home.nix
	@ln -s $(PWD)/zsh $(HOME_MANAGER_PATH)/zsh
	@ln -s $(PWD)/files $(HOME_MANAGER_PATH)/files

	@echo "Done!"
