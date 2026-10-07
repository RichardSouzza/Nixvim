{ lib, pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
{
  extraPlugins = [
    (buildVimPlugin {
      pname = "visual-surround.nvim";
      version = "1.0.1";
      src = fetchFromGitHub {
        owner = "NStefan002";
        repo = "visual-surround.nvim";
        rev = "v1.0.1";
        hash = "sha256-R1IuhysQODTJtJYETsWk/23/EWud7hphVM5ufKVUowU=";
      };
      meta = {
        homepage = "https://github.com/NStefan002/visual-surround.nvim";
        license = lib.licenses.mit;
      };
    })
  ];

  extraConfigLua = builtins.readFile ./extra_config.lua;
}
