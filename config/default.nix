{ pkgs, ... }:

{
  imports = [
    ./keymaps
    ./plugins
    ./autocmds.nix
    ./settings.nix
  ];

  extraPackages = with pkgs; [
  # Dependecy    # Required by
    fzf          # Blink
    gcc          # TreeSitter
    krabby       # Snacks.dashboard
    ripgrep      # Blink and Snacks.picker
    typescript   # typescript-tools
    wakatime-cli # Wakatime
  ];
}
