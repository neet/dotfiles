# dotfiles

## Install

Create symbolic links to the dotfiles in this repo.

```bash
make init
```

Install Nix and Home Manager.

```
sh <(curl -L https://nixos.org/nix/install) --daemon
nix run home-manager/release-23.05 -- switch
```

Install Homebrew packages

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle install
```

## Update

```bash
brew bundle dump -f --file ./files/Brewfile --formula --cask --tap --mas
```
