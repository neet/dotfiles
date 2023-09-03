# dotfiles

Create symbolic links to the dotfiles in this repo.

```bash
make init
```

Install Nix and Home Manager.

```
sh <(curl -L https://nixos.org/nix/install) --daemon
nix run home-manager/release-23.05 -- switch
```
