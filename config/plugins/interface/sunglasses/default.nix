{ lib, pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
{
  extraPlugins = [
    (buildVimPlugin {
      pname = "sunglasses.nvim";
      version = "0-unstable-2025-01-13";
      src = fetchFromGitHub {
        owner = "miversen33";
        repo = "sunglasses.nvim";
        rev = "1e4c4ea4d6b46124090df1d35426a705cb3b99cf";
        hash = "sha256-opkdp6kGGQa2BY/zPhDgrnk0nVMDCJXk79U5Pi7Dnh8=";
      };
      meta = {
        homepage = "https://github.com/miversen33/sunglasses.nvim";
        license = lib.licenses.gpl3Only;
      };
    })
  ];

  extraConfigLua = builtins.readFile ./extra_config.lua;
}
