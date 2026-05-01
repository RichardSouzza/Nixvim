{
  plugins = {
    opencode = {
      enable = true;
    };

    windsurf-nvim = {
      enable = true;
      settings = {
        enable_chat = true;
        enable_cmp_source = true;
        workspace_root = {
          use_lsp = true;
        };
        # key_bindings = {
        #   next = "<Tab>";
        #   prev = "<C-[>";
        # };
      };
    };
  };

  env = {
    DEBUG_CODEIUM = "info";
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>at";
      action.__raw = ''function() require("opencode").toggle() end'';
      options = {
        desc = "Toggle opencode";
      };
    }
    {
      mode = [ "n" "x" ];
      key = "<leader>as";
      action.__raw = ''function() require("opencode").select() end'';
      options = {
        desc = "Execute opencode action";
      };
    }
    {
      mode = "n";
      key = "<leader>al";
      action.__raw = ''function() return require("opencode").operator("@this ") .. "_" end'';
      options = {
        desc = "Add line to opencode";
      };
    }
    {
      mode = [ "n" "x" ];
      key = "<leader>ar";
      action.__raw = ''function() return require("opencode").operator("@this ") end'';
      options = {
        desc = "Add range to opencode";
      };
    }
    {
      mode = "n";
      key = "<leader>ak";
      action.__raw = ''function() require("opencode").command("session.half.page.up") end'';
      options = {
        desc = "Scroll opencode up";
      };
    }
    {
      mode = "n";
      key = "<leader>aj";
      action.__raw = ''function() require("opencode").command("session.half.page.down") end'';
      options = {
        desc = "Scroll opencode down";
      };
    }
  ];
}
