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
  ];
}
