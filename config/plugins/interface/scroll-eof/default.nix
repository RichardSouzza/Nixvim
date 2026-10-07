{ lib, pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
{
  extraPlugins = [
    (buildVimPlugin {
      pname = "scrollEOF.nvim";
      version = "0-unstable-2025-09-14";
      src = fetchFromGitHub {
        owner = "Aasim-A";
        repo = "scrollEOF.nvim";
        rev = "e462b9a07b8166c3e8011f1dcbc6bf68b67cd8d7";
        hash = "sha256-y7yOCRSGTtQcFyWVkGe3xQqstHZMQKayxtqkOVlZ4PM=";
      };
      meta = {
        homepage = "https://github.com/Aasim-A/scrollEOF.nvim";
        license = lib.licenses.mit;
      };
    })
  ];

  extraConfigLua = builtins.readFile ./extra_config.lua;
}
