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
    # dap = {
    #   enable = true;
    # };
    # dap-python.enable = true;
    # dap-ui = {
    #   enable = true;
    # };
    overseer = {
      enable = true;
    };
  };

  # extraPlugins = [
  #   (buildVimPlugin {
  #     pname = "vimspector";
  #     version = "0-unstable-2026-01-11";
  #     src = fetchFromGitHub {
  #       owner = "puremourning";
  #       repo = "vimspector";
  #       rev = "409005fac4f014b271ed3526f3c0d08c4d42ed19";
  #       hash = "sha256-Kyx3YHOvZ7xagbU4xzumEAshU7oZOssacQBb7bIRu98=";
  #     };
  #     meta = {
  #       homepage = "https://github.com/puremourning/vimspector";
  #       license = lib.licenses.asl20;
  #     };
  #   })
  # ];
  #
  # extraConfigLua = ''
  #   vim.g.vimspector_base_dir = vim.env.HOME .. "/.config/nvim/vimspector-config"
  #   vim.g.vimspector_install_gadgets = { "CodeLLDB" }
  # '';
}
