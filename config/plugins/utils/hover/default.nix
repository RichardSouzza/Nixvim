{ lib, pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
{
  extraPlugins = [
    (buildVimPlugin {
      pname = "hover.nvim";
      version = "0-unstable-2026-06-01";
      src = fetchFromGitHub {
        owner = "RichardSouzza";
        repo = "hover.nvim";
        rev = "7655da598eefa6344a14d5733af39a242cfaa61a";
        hash = "sha256-LHayhGYuGm/CIdfQylo98xzdQyW0IUihlCqGb9aFrsw=";
      };
      meta = {
        homepage = "https://github.com/RichardSouzza/hover.nvim";
        license = lib.licenses.mit;
      };
    })
  ];

  extraConfigLua = builtins.readFile ./extra_config.lua;
}
