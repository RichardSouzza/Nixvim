{ lib, pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
{
  extraPlugins = [
    (buildVimPlugin {
      pname = "cinnamon.nvim";
      version = "0-unstable-2024-08-06";
      src = fetchFromGitHub {
        owner = "declancm";
        repo = "cinnamon.nvim";
        rev = "450cb3247765fed7871b41ef4ce5fa492d834215";
        hash = "sha256-kccQ4iFMSQ8kvE7hYz90hBrsDLo7VohFj/6lEZZiAO8=";
      };
      meta = {
        homepage = "https://github.com/declancm/cinnamon.nvim";
        license = lib.licenses.mit;
      };
    })
  ];

  extraConfigLua = builtins.readFile ./extra_config.lua;
}
