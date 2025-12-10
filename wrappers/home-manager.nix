{ config, lib, ... }:

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
          };

          defaultEditor = mkOption {
            type = types.bool;
            default = false;
            description = "Whether to configure Noevim as the default editor using the EDITOR environment variable.";
          };
        }
      ];
    };
  };

  config = mkIf cfg.enable (
    mkMerge [
      {
        home.sessionVariables = mkIf cfg.defaultEditor { EDITOR = "nvim"; };
      }
    ]
  );
}
