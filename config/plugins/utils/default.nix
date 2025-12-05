{ lib, pkgs, ... }:

with lib;

let
  inherit
    (pkgs) fetchFromGitHub;
  inherit
    (pkgs.vimUtils) buildVimPlugin;

  isWakatimeInstalled = pkgs.wakatime-cli != null;

in
{
  imports = [
    ./floating-help
    ./snacks.nix
  ];

  plugins = {
    lazy.enable = true;

    markdown-preview.enable = true;

    no-neck-pain.enable = true;

    refactoring = {
      enable = true;
    };

    wakatime.enable = true;

    which-key = {
      enable = true;
      settings = {
        preset = "modern";
      };
    };
  };

  extraPlugins = [
    (buildVimPlugin {
      name = "vim-cool";
      src = fetchFromGitHub {
        owner = "romainl";
        repo = "vim-cool";
        rev = "master";
        hash = "sha256-mKlQkFH1665b290clIpx0BylrmOOmey/FX9XbSfC41s=";
      };
    })
  ];

  # xdg.homeFile.".wakatime/wakatime-cli".source =
  #   (mkIf isWakatimeInstalled "${pkgs.wakatime}/bin/wakatime-cli");
}
