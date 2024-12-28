{
  description = "Home Manager configuration of nucx";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }: {
    homeConfigurations."neet" = home-manager.lib.homeManagerConfiguration {
      inherit (nixpkgs.legacyPackages.aarch64-darwin) pkgs;
      modules = [ ./home.nix ];
    };
  };
}
