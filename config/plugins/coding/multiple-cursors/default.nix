{ lib, pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
{
  imports = [
    ./keymaps.nix
  ];

  extraPlugins = [
    (buildVimPlugin {
      pname = "multiple-cursors.nvim";
      version = "0.15-unstable-2026-05-10";
      src = fetchFromGitHub {
        owner = "brenton-leighton";
        repo = "multiple-cursors.nvim";
        rev = "eae76d4c5f7ede2d45746dc2affb5e7a139e4aa8";
        hash = "sha256-iLQT+M0wL/Bh0zzgLSozSRjsELzKochMlM6djUwg/og=";
      };
      meta = {
        homepage = "https://github.com/brenton-leighton/multiple-cursors.nvim";
        license = lib.licenses.mit;
      };
    })
  ];

  extraConfigLua = builtins.readFile ./extra_config.lua;
}
