{
  autoCmd = [
    {
      desc = "Clear jump list on startup";
      event = "VimEnter";
      callback.__raw = ''
        function()
          vim.cmd.clearjumps()
        end
      '';
    }
    {
      desc = "Enter insert mode when the current buffer changes to 'toggleterm'";
      event = [ "BufEnter" "BufWinEnter" ];
      pattern = [ "term://*" ];
      callback.__raw = ''
        function()
          if vim.bo.filetype == "toggleterm" then
            vim.schedule(function()
              vim.cmd("startinsert")
            end)
          end
        end
      '';
    }
    {
      desc = "Set #region as fold marker in C# files";
      event = [ "FileType" ];
      pattern = [ "cs" ];
      callback.__raw = ''
        function()
          vim.opt_local.foldmethod = "marker"
          vim.opt_local.foldmarker = "#region,#endregion"
          vim.opt_local.foldlevel = 0
          vim.opt_local.foldlevelstart = 0
          vim.opt_local.foldtext = [[
            substitute(getline(v:foldstart), "^\s*", "", "")
          ]]
        end
      '';
    }
    {
      desc = "Set markdown specific keymaps";
      event = [ "FileType" ];
      pattern = [ "markdown" ];
      callback.__raw = builtins.readFile ./scripts/markdown_keymaps.lua;
    }
  ];
}
