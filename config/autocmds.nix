{
  autoCmd = [
    # {
    #   desc = "Automatically close buffers in empty splits";
    #   event = "BufDelete";
    #   callback.__raw = ''
    #     function()
    #       local buf_id = args.buf
    #       -- Check if the buffer being deleted is currently open in any window
    #       for _, win in ipairs(vim.api.nvim_list_wins()) do
    #         if vim.api.nvim_win_get_buf(win) == buf_id then
    #           -- If it is, close the window.
    #           vim.api.nvim_win_close(win, true)
    #           return -- Only need to close one window showing it
    #         end
    #       end
    #     end
    #   '';
    # }
    {
      desc = "Check if it is necessary to reload the file when focusing";
      event = [ "FocusGained" "TermClose" "TermLeave" ];
      callback.__raw = ''
        function()
          if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
          end
        end
      '';
    }
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
      desc = "Close some filetypes with <q>";
      event = "FileType";
      pattern = [ "checkhealth" "gitsigns-blame" "help" "lspinfo" ];
      callback.__raw = ''
        function(event)
          vim.bo[event.buf].buflisted = false
          vim.schedule(function()
            vim.keymap.set("n", "q", function()
              vim.cmd("close")
              pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
            end, {
              buffer = event.buf,
              silent = true,
              desc = "Quit buffer",
            })
          end)
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
      desc = "Remove sqlcomplete pop-up";
      event = "FileType";
      pattern = [ "sql" ];
      callback.__raw = ''
        function()
          -- https://github.com/neovim/neovim/issues/26977
          vim.keymap.del("i", "<left>",  { buffer = true })
          vim.keymap.del("i", "<right>", { buffer = true })
        end
      '';
    }
    {
      desc = "Resize splits if window got resized";
      event = "VimResized";
      callback.__raw = ''
        function()
          local current_tab = vim.fn.tabpagenr()
          vim.cmd("tabdo wincmd =")
          vim.cmd("tabnext " .. current_tab)
        end
      '';
    }
    # {
    #   desc = "Set #region as fold marker in C# files";
    #   event = [ "FileType" ];
    #   pattern = [ "cs" ];
    #   callback.__raw = ''
    #     function()
    #       vim.opt_local.foldmethod = "marker"
    #       vim.opt_local.foldmarker = "#region,#endregion"
    #       vim.opt_local.foldlevel = 0
    #       vim.opt_local.foldlevelstart = 0
    #       vim.opt_local.foldtext = [[
    #         substitute(getline(v:foldstart), "^\s*", "", "")
    #       ]]
    #     end
    #   '';
    # }
    {
      desc = "Set markdown specific keymaps";
      event = [ "FileType" ];
      pattern = [ "markdown" ];
      callback.__raw = builtins.readFile ./scripts/markdown_keymaps.lua;
    }
  ];
}
