{ lib, pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
{
  extraPlugins = [
    (buildVimPlugin {
      pname = "nvim-scrollbar";
      version = "0-unstable-2025-11-07";
      src = fetchFromGitHub {
        owner = "petertriho";
        repo = "nvim-scrollbar";
        rev = "f8e87b96cd6362ef8579be456afee3b38fd7e2a8";
        hash = "sha256-g+gJp7noNdLKfvp+QbnTFE++PI3FcJG7reDenkg15k0=";
      };
      meta = {
        homepage = "https://github.com/petertriho/nvim-scrollbar";
        license = lib.licenses.mit;
      };
    })
  ];

  extraConfigLua = builtins.readFile ./extra_config.lua;
}
