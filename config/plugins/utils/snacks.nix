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
        words.enabled = true;
      };
    };
  };

  keymaps = [
    {
      action = "<CMD>lua Snacks.picker.lines({ layout = { preset = 'vertical' } })<CR>";
      mode = "n";
      key = "/";
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
      action = "<CMD>lua Snacks.picker.diagnostics_buffer()<CR>";
      key = "gpd";
      mode = "n";
      options = {
        desc = "Show buffer diagnostics";
      };
    }
    {
      action = "<CMD>lua Snacks.picker.diagnostics()<CR>";
      key = "gpD";
      mode = "n";
      options = {
        desc = "Show diagnostics";
      };
    }
    {
      action = "<CMD>lua Snacks.picker.keymaps()<CR>";
      key = "gpk";
      mode = "n";
      options = {
        desc = "Show keymaps";
      };
    }
    {
      action = "<CMD>lua Snacks.picker.colorschemes({ layout = { preset = 'dropdown' } })<CR>";
      key = "gpt";
      mode = "n";
      options = {
        desc = "Show colorschemes";
      };
    }
    {
      action = "<CMD>lua Snacks.picker.undo()<CR>";
      key = "gpu";
      mode = "n";
      options = {
        desc = "Show undo history";
      };
    }
  ];
}
