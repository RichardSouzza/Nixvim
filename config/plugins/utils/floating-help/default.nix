{ pkgs, ... }:

let
  inherit
    (pkgs) fetchFromGitHub;
  inherit
    (pkgs.vimUtils) buildVimPlugin;

in
{
  extraPlugins = [
    (buildVimPlugin {
      pname = "floating-help";
      version = "2025-10-06";
      src = fetchFromGitHub {
        owner = "Tyler-Barham";
        repo = "floating-help.nvim";
        rev = "main";
        hash = "sha256-zPcd88Zy3piP622NP9etnTspKABLbdmOSyui+wcGNuI=";
      };
    })
  ];

  extraConfigLua = builtins.readFile ./extra_config.lua;
}
