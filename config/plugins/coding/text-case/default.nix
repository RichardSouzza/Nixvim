{ lib, pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
{
  imports = [
    ./keymaps.nix
  ];

  extraConfigLua = ''
    require("textcase").setup({
      prefix = "ç"
    })
  '';

  extraPlugins = [
    (buildVimPlugin {
      pname = "text-case.nvim";
      version = "1.2.0";
      src = fetchFromGitHub {
        owner = "johmsalas";
        repo = "text-case.nvim";
        rev = "v1.2.0";
        hash = "sha256-gmyuRjX7V+Z2KFkl1tBiqpfrKrDoAoJlwSa3TYwnJ5Y=";
      };
      nvimSkipModule = [
        "textcase.plugin.range"
      ];
      meta = {
        homepage = "https://github.com/johmsalas/text-case.nvim";
        license = lib.licenses.unlicense;
      };
    })
  ];
}
