{ pkgs, ... }:

{
  imports = [
    ./keymaps
    ./plugins
    ./auto_cmds.nix
    ./settings.nix
  ];

  extraPackages = with pkgs; [
  # Dependecy    # Required by
    fzf          # Blink
    gcc          # TreeSitter
    krabby       # Snacks.dashboard
    ripgrep      # Blink and Snacks.picker
    wakatime-cli # Wakatime
  ];
}
