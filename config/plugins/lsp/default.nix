{ lib, pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
{
  imports = [
    ./keymaps.nix
    ./linters.nix
    ./servers.nix
  ];

  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
      onAttach = "require('workspace-diagnostics').populate_workspace_diagnostics(client, bufnr)";
    };

    lsp-format = {
      enable = true;
      settings = {
        markdown = {
          sync = true;
        };
      };
    };

    lsp-lines.enable = true;

    lspsaga = {
      enable = true;
      settings = {
        codeAction = {
          keys = {
            exec = "<CR>";
            quit = [ "<Esc>" "q" ];
          };
        };
        implement.enable = false;
        lightbulb.enable = false;
        symbol_in_winbar.enable = false; # Breadcrumbs
      };
    };

    refactoring = {
      enable = true;
      package = pkgs.vimPlugins.refactoring-nvim.overrideAttrs (old: {
        postInstall = (old.postInstall or "") + ''
          mkdir $out/after
          mv $out/{queries,after/queries}
        '';
      });
    };
  };

  extraPlugins = [
    (buildVimPlugin {
      pname = "workspace-diagnostics.nvim";
      version = "0-unstable-2025-03-25";
      src = fetchFromGitHub {
        owner = "artemave";
        repo = "workspace-diagnostics.nvim";
        rev = "60f9175b2501ae3f8b1aba9719c0df8827610c8e";
        hash = "sha256-jSpKaKnGyip/nzqU52ypWLgoCtvccYN+qb5jzlwAnd4=";
      };
      meta = {
        homepage = "https://github.com/artemave/workspace-diagnostics.nvim";
        license = lib.licenses.mit;
      };
    })
  ];
}
