{ pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
{
  imports = [
    ./snacks.nix
  ];

  plugins = {
    # codesnap = {
    #   enable = true;
    #   settings = {
    #     save_path = "~/.local/share/nvim/codesnap";
    #   };
    # };

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

  extraPlugins = [
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
