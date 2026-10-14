{ lib, pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
{
  extraPlugins = [
    (buildVimPlugin {
      pname = "tail.nvim";
      version = "0.9.2";
      src = fetchFromGitHub {
        owner = "thgrass";
        repo = "tail.nvim";
        rev = "v0.9.2";
        hash = "sha256-+Hg9oL3PJQO39VtTsVIgDHD6Ze05n/eIO2IY8QolhD8=";
      };
      meta = {
        homepage = "https://github.com/thgrass/tail.nvim";
        license = lib.licenses.mit;
      };
    })
  ];

  extraConfigLua = builtins.readFile ./extra_config.lua;
}
