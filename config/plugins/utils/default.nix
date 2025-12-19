{ pkgs, ... }:

let
  inherit
    (pkgs) fetchFromGitHub;
  inherit
    (pkgs.vimUtils) buildVimPlugin;

in
{
  imports = [
    ./snacks.nix
  ];

  plugins = {
    # No yank on delete
    cutlass-nvim = {
      enable = true;
      settings = {
        override_del = true;
        exclude = [ "nx" "nX" "nxx" "nX" "vx" "vX" "xx" "xX" ];
      };
    };

    lazy.enable = true;

    no-neck-pain.enable = true;

    wakatime.enable = true;

    which-key = {
      enable = true;
      settings = {
        preset = "modern";
      };
    };
  };

  extraConfigLua = ''
    require("scrollEOF").setup({
      insert_mode = false
    })
  '';

  extraPlugins = [
    (buildVimPlugin {
      # cursor always in the middle
      pname = "scrollEOF";
      version = "2025-09-14";
      src = fetchFromGitHub {
        owner = "Aasim-A";
        repo = "scrollEOF.nvim";
        rev = "master";
        hash = "sha256-y7yOCRSGTtQcFyWVkGe3xQqstHZMQKayxtqkOVlZ4PM=";
      };
    })
    (buildVimPlugin {
      # noh on move after search
      pname = "vim-cool";
      version = "2025-02-19";
      src = fetchFromGitHub {
        owner = "romainl";
        repo = "vim-cool";
        rev = "master";
        hash = "sha256-mKlQkFH1665b290clIpx0BylrmOOmey/FX9XbSfC41s=";
      };
    })
  ];
}
