{ pkgs, ... }:

{
  imports = [
    ./keymaps.nix
  ];

  plugins = {
    snacks = {
      enable = true;

      package = pkgs.vimPlugins.snacks-nvim.overrideAttrs (old: {
        postInstall = (old.postInstall or "") + ''
          mkdir $out/after
          mv $out/{queries,after/queries}
        '';
      });

      settings = {
        image.enabled = true;
        indent.enabled = true;
        input.enabled = true;
        lazygit.enabled = true;
        notifier.enabled = true;
        notify.enable = true;
        picker.enabled = true;
        scratch.enabled = true;
        words.enabled = true;
        zen.enabled = true;
      };
    };
  };

}
