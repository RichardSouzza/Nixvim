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
    lsof         # OpenCode
    ripgrep      # Blink and Snacks.picker
    ruff         # Conform
    typescript   # typescript-tools
    wakatime-cli # Wakatime
    yamlfmt      # Conform
  ];
}
