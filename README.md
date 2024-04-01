# dotfiles

## Install

Create symbolic links to the dotfiles in this repo.

```bash
cd ~
git clone https://github.com/neet/dotfiles.git
cd dotfiles
make init
```

Install Nix and Home Manager.

```
sh <(curl -L https://nixos.org/nix/install) --daemon
cd ~/.config/home-manager
nix run home-manager/release-23.05 -- switch
```

Install Homebrew packages

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
cd ~/
brew bundle install
```

## Update

```bash
brew bundle dump -f --file ./files/Brewfile --formula --cask --tap --mas
```
