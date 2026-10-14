{ lib, pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
{
  extraPlugins = [
    (buildVimPlugin {
      pname = "outline.nvim";
      version = "1.2.0-unstable-2026-10-10";
      src = fetchFromGitHub {
        owner = "hedyhli";
        repo = "outline.nvim";
        rev = "d8e48fe265fa9c33364809bf9cf32a1f032a8ac1";
        hash = "sha256-BKK5VR9QV53DD47zRNZCUQLJvWguVp3KszpDzYowfEU=";
      };
      nvimSkipModule = [
        "outline.providers.norg"
      ];
      meta = {
        homepage = "https://github.com/hedyhli/outline.nvim";
        license = lib.licenses.mit;
      };
    })
  ];

  extraConfigLua = builtins.readFile ./extra_config.lua;
}
