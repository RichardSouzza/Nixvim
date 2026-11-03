{
  extraConfigLuaPre = ''
    package.preload['config.keymaps.editing'] = function()
      ${builtins.readFile ./lua/editing.lua}
    end
  '';

  keymapsMulti = [
    {
      mode = "n";
      key = "<Insert>";
      action = "a";
      options.desc = "Append as default insertion mode";
    }
    {
      mode = "n";
      key = "<leader><CR>";
      action = "a<CR>";
      options.desc = "Break line";
    }
    {
      mode = "n";
      key = "<C-Space>";
      action = "a <Esc>";
      options.desc = "Add space in normal mode";
    }
    {
      mode = [ "n" "i" ];
      key = "<A-[>";
      action = "<Esc>O";
      options.desc = "Open line above";
    }
    {
      mode = [ "n" "i" ];
      key = "<A-]>";
      action = "<Esc>o";
      options.desc = "Open line below";
    }
    {
      mode = [ "n" "i" "v" ];
      key = "<A-Up>";
      action = "<CMD>silent! m .-2<CR>";
      options.desc = "Move line up";
    }
    {
      mode = [ "n" "i" "v" ];
      key = "<A-Down>";
      action = "<CMD>silent! m .+1<CR>";
      options.desc = "Move line down";
    }
    {
      mode = [ "n" "i" ];
      key = "<A-S-Up>";
      action = "<CMD>t. -1<CR>";
      options.desc = "Duplicate line up";
    }
    {
      mode = [ "n" "i" ];
      key = "<A-S-Down>";
      action = "<CMD>t.<CR>";
      options.desc = "Duplicate line down";
    }
    {
      mode = "i";
      key = [ "<C-BS>" "<C-h>" ];
      action = "<C-w>";
      options.desc = "Delete word behind the cursor";
    }
    {
      mode = "i";
      key = [ "<C-Delete>" "<C-kDel>" ];
      action.__raw = "function() require('config.keymaps.editing').delete_word_ahead() end";
      options.desc = "Delete word ahead of the cursor";
    }
    {
      mode = "i";
      key = "<C-/>";
      action = "<Esc>gcci";
      options.desc = "Comment line";
    }
  ];
}
