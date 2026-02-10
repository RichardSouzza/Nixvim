{ lib, pkgs, ... }:

let
  inherit (lib) getExe;

in
{
  plugins = {
    # lint = {
    #   enable = true;
    #
    #   lintersByFt = {
    #     json = [ "spectral" ];
    #     yaml = [ "spectral" ];
    #   };
    #
    #   linters = {
    #     spectral = {
    #       cmd = getExe pkgs.spectral-language-server;
    #     };
    #   };
    # };

    none-ls = {
      enable = true;
      sources = {
        diagnostics = {
          markdownlint = {
            enable = true;
            settings.extra_args = [
              "-c" "~/.config/markdownlint/.markdownlint.yaml"
            ];
          };
        };
      };
    };
  };
}
