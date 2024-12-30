{
  description = "Home Manager configuration of johanhanses on ubuntu 24.10";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, catppuccin, home-manager, ... }:
    let
      system = "aarch64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."johanhanses" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix
          catppuccin.homeManagerModules.catppuccin
        ];

        extraSpecialArgs = {
          # Add extra arguments to home.nix
          # catppuccin.homeManagerModules.catppuccin.enable = true;
        };
      };
    };
}
