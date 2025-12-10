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
        overlays = [
          (final: prev: {
            vimUtils = prev.vimUtils // {
              buildVimPlugin = args:
                let plugin = prev.vimUtils.buildVimPlugin args;
                in plugin.overrideAttrs (old: {
                  postInstall = (old.postInstall or "") + ''
                    find $out/doc -type f -name "*.md" -delete || true
                    find $out/doc -type f -name "*.txt" -delete || true
                    rm -f $out/doc/tags || true
                  '';
                });
            };
          })
        ];

        pkgs = import nixpkgs {
          inherit system;
          overlays = overlays;
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
