{ lib, pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
{
  imports = [
    ./keymaps.nix
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

    navbuddy = {
      enable = true;
      settings = {
        lsp.auto_attach = true;
        mappings = {
          "<Left>" = "parent";
          "<Right>" = "children";
        };
        source_buffer.highlight = true; # not working :(
      };
    };

    no-neck-pain.enable = true;

    showkeys = {
      enable = true;
      settings = {
        timeout = 1;
        maxkeys = 5;
      };
    };

    venv-selector.enable = true;

    wakatime.enable = true;

    which-key = {
      enable = true;
      settings = {
        preset = "modern";
        keys = {
          scroll_up = "<S-Up>";
          scroll_down = "<S-Down>";
        };
      };
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    plenary-nvim

    (buildVimPlugin {
      pname = "vim-cool";
      version = "0-unstable-2025-02-19";
      src = fetchFromGitHub {
        owner = "romainl";
        repo = "vim-cool";
        rev = "9ea940c0d537e55de0de4c0298c04b976960fb12";
        hash = "sha256-mKlQkFH1665b290clIpx0BylrmOOmey/FX9XbSfC41s=";
      };
      meta = {
        homepage = "https://github.com/romainl/vim-cool";
        license = lib.licenses.mit;
      };
    })
    (buildVimPlugin {
      pname = "vim-startuptime";
      version = "4.5.0-unstable-2025-02-18";
      src = fetchFromGitHub {
        owner = "dstein64";
        repo = "vim-startuptime";
        rev = "b6f0d93f6b8cf6eee0b4c94450198ba2d6a05ff6";
        hash = "sha256-0YLDkU1y89O5z7tgxaH5USQpJDfTuN0fsPJOAp6pa5Y=";
      };
      meta = {
        homepage = "https://github.com/dstein64/vim-startuptime";
        license = lib.licenses.mit;
      };
    })
  ];
}
