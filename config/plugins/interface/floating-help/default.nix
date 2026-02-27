{ lib, pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
{
  extraPlugins = [
    (buildVimPlugin {
      pname = "floating-help.nvim";
      version = "0-unstable-2025-10-06";
      src = fetchFromGitHub {
        owner = "Tyler-Barham";
        repo = "floating-help.nvim";
        rev = "00a0de9df33c25ad31188241a7408cd17b652541";
        hash = "sha256-zPcd88Zy3piP622NP9etnTspKABLbdmOSyui+wcGNuI=";
      };
      meta = {
        homepage = "https://github.com/Tyler-Barham/floating-help.nvim";
        license = lib.licenses.apsl20;
      };
    })
  ];

  extraConfigLua = builtins.readFile ./extra_config.lua;
}
