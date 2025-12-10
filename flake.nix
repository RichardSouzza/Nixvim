{
  description = "Richard's Nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixvim, flake-utils }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = import ./overlays;
          config.allowUnfree = true;
        };

        nixvim' = nixvim.legacyPackages.${system};

        nixvimLib = nixvim.lib.${system};

        nixvimModule = {
          inherit pkgs;
          module = import ./config;
        };

        nvim = nixvim'.makeNixvimWithModule nixvimModule;

      in
      {
        checks = {
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        };

        packages.default = nvim;
        homeModules.nixvim = import ./wrappers/home-manager.nix;
      }
    );
}
