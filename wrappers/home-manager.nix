{ lib, nvim }: { config, ... }:

let
  inherit (lib) mkEnableOption mkMerge mkOption mkIf types;
  cfg = config.programs.nixvim;

in
{
  options = {
    programs.nixvim = mkOption {
      default = { };
      type = types.submodule [
        {
          options = {
            enable = mkEnableOption "Whether to enable Neovim.";
            defaultEditor = mkEnableOption  "Whether to configure Noevim as the default editor using the EDITOR environment variable.";
          };
        }
      ];
    };
  };

  config = mkIf cfg.enable (
    mkMerge [
      {
        home.packages = [ nvim ];
      }
      {
        home.sessionVariables = mkIf cfg.defaultEditor {
          EDITOR = "nvim";
          VISUAL = "nvim";
        };
      }
      {
        home.file = {
          ".config/emmylua_ls/.emmyrc.json".source = ../config/plugins/lsp/configs/emmyrc.json;
          ".sqlfluff".source = ../config/plugins/formatting/rules/sqlfluff.toml;
          ".stylua.toml".source = ../config/plugins/formatting/rules/stylua.toml;
        };
      }
    ]
  );
}
