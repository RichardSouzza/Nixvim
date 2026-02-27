{ lib, pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
{
  extraPlugins = [
    (buildVimPlugin {
      pname = "duplicate.nvim";
      version = "1.1.0";
      src = fetchFromGitHub {
        owner = "hinell";
        repo = "duplicate.nvim";
        rev = "v1.1.0";
        hash = "sha256-k3Q7mk04dd2yql4NK5Lrm/AEy3lWp0xV2qvxqVly3lg=";
      };
      meta = {
        homepage = "https://github.com/hinell/duplicate.nvim";
        license = lib.licenses.fair;
      };
    })
  ];

  keymaps = [
    {
      mode = "v";
      key = "<S-A-up>";
      action = ":VisualDuplicate -1<CR>";
      options = {
        desc = "Duplicate selection up";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<S-A-down>";
      action = ":VisualDuplicate +1<CR>";
      options = {
        desc = "Duplicate selection down";
        silent = true;
      };
    }
  ];
}
