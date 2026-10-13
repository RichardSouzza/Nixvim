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
        bigfile.enabled = true;
        image.enabled = true;
        indent.enabled = true;
        input.enabled = true;
        lazygit.enabled = true;
        notifier.enabled = true;
        notify.enable = true;
        picker = {
          enabled = true;
          actions = {
            confirm_and_reveal.__raw = ''
              function(picker)
                picker:action("confirm")
                vim.schedule(function()
                  vim.cmd("Neotree reveal action=show")
                end)
              end
            '';
          };
          win = {
            input.keys."<CR>" = { __unkeyed-1 = "confirm_and_reveal"; mode = [ "n" "i" ]; };
            list.keys."<CR>" = "confirm_and_reveal";
          };
        };
        scratch.enabled = true;
        words.enabled = true;
        zen.enabled = true;
      };
    };
  };
}
