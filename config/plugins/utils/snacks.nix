{ pkgs, ... }:

{
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
        health.enabled = true;
        indent.enabled = true;
        input.enabled = true;
        lazygit.enabled = true;
        notifier.enabled = true;
        notify.enable = true;
        picker.enabled = true;
        scratch.enabled = true;
      };
    };
  };

  keymaps = [
    {
      action = "<CMD>lua Snacks.picker.lines({ layout = { preset = 'vertical' } })<CR>";
      key = "/";
      mode = "n";
      options = {
        desc = "Search line";
      };
    }
    {
      action = "<CMD>lua Snacks.picker.grep({ regex = false })<CR>";
      key = "gb";
      mode = "n";
      options = {
        desc = "Search code";
      };
    }
    {
      action = "<CMD>lua Snacks.picker.files({ hidden = true })<CR>";
      key = "gf";
      mode = "n";
      options = {
        desc = "Search file";
      };
    }
    {
      action = "<CMD>lua Snacks.lazygit.open()<CR>";
      key = "gg";
      mode = "n";
      options = {
        desc = "Open Lazygit";
      };
    }
    {
      action = "<CMD>lua Snacks.picker.git_log_file()<CR>";
      key = "gH";
      mode = "n";
      options = {
        desc = "Open git history";
      };
    }
    {
      action = "<CMD>lua Snacks.picker.colorschemes({ layout = { preset = 'dropdown' } })<CR>";
      key = "gkt";
      mode = "n";
      options = {
        desc = "Search colorschemes";
      };
    }
  ];
}
