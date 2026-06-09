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

    no-neck-pain.enable = true;

    oil = {
      enable = true;
      package = pkgs.vimPlugins.oil-nvim.overrideAttrs (old: {
        postInstall = (old.postInstall or "") + ''
          find $out -type f -name "recipes.md" -delete || true
        '';
      });
      settings = {
        default_file_explorer = false;
      };
    };

    persistence.enable = true;

    showkeys = {
      enable = true;
      settings = {
        timeout = 1;
        maxkeys = 5;
      };
    };

    trouble = {
      enable = true;
      settings = {
        auto_preview = false;
      };
    };

    venv-selector.enable = true;

    wakatime.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [
    plenary-nvim

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

    (buildVimPlugin {
      pname = "tail.nvim";
      version = "0-unstable-2026-06-01";
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

  extraConfigLua = builtins.readFile ./extra_config.lua;
}
