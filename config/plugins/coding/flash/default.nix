{ pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
{
  plugins = {
    flash = {
      enable = true;

      package = buildVimPlugin {
        pname = "flash.nvim";
        version = "2.1.0-unstable-2026-10-31";
        src = fetchFromGitHub {
          owner = "brunobmello25";
          repo = "flash.nvim";
          rev = "7a4aa407fd7b18f2494900a2e708b0f5673423bd";
          hash = "sha256-AOVVbjdeZ04agqrEiiOumGWhZptYhA5fQUcSfb5r3ls=";
        };
        nvimSkipModule = [
          "flash.docs"
        ];
        meta = {
          homepage = "https://github.com/brunobmello25/flash.nvim";
          license = "apsl20";
        };
      };

      settings = {
        label = {
          uppercase = false;
        };
        modes = {
          char = {
            enabled = true;
            highlight = {
              backdrop = false;
            };
            multi_line = false;
          };
        };
      };
    };
  };
}
