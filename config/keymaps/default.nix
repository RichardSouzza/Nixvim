{ config, lib, ... }:

{
  options.keymapsMulti = lib.mkOption {
    type = lib.types.listOf lib.types.attrs;
    default = [ ];
    description = "Keymaps that let `key` be a list of keys.";
  };

  config.keymaps = lib.concatMap (
    km: map (key: km // { inherit key; }) (lib.toList km.key)
  ) config.keymapsMulti;

  imports = [
    ./editing.nix
    ./files.nix
    ./navigation.nix
    ./selection.nix
    ./session.nix
    ./windows.nix
  ];
}
