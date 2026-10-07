{
  plugins = {
    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
      };
    };
  };

  keymaps = [
    {
      action = ":Gitsigns blame<CR>";
      key = "ghb";
      mode = "n";
      options = {
        desc = "Show blame of the current buffer";
      };
    }
    {
      action = ":Gitsigns blame_line<CR>";
      key = "ghB";
      mode = "n";
      options = {
        desc = "Show blame of the current line";
      };
    }
    {
      action = ":Gitsigns diffthis<CR>";
      key = "ghd";
      mode = "n";
      options = {
        desc = "Show the diff of the current buffer";
      };
    }
    {
      action = ":Gitsigns preview_hunk<CR>";
      key = "ghp";
      mode = "n";
      options = {
        desc = "Preview hunk";
      };
    }
    {
      action = ":Gitsigns preview_hunk_inline<CR>";
      key = "ghi";
      mode = "n";
      options = {
        desc = "Preview hunk inline";
      };
    }
    {
      action = ":Gitsigns nav_hunk next<CR>";
      key = "ghn";
      mode = "n";
      options = {
        desc = "Go to next hunk";
      };
    }
    {
      action = ":Gitsigns nav_hunk prev<CR>";
      key = "ghN";
      mode = "n";
      options = {
        desc = "Go to previous hunk";
      };
    }
    {
      action = ":Gitsigns reset_hunk<CR>";
      key = "ghR";
      mode = "n";
      options = {
        desc = "Reset hunk";
      };
    }
    {
      action = ":Gitsigns stage_hunk<CR>";
      key = "ghs";
      mode = "n";
      options = {
        desc = "Stage/unstage hunk";
      };
    }
    {
      action = ":Gitsigns toggle_current_line_blame<CR>";
      key = "ghtb";
      mode = "n";
      options = {
        desc = "Toggle current line blame";
      };
    }
    {
      action = ":Gitsigns toggle_word_diff<CR>";
      key = "ghw";
      mode = "n";
      options = {
        desc = "Show intra-line word-diff";
      };
    }
  ];
}
