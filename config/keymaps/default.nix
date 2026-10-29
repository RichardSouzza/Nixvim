{
  imports = [
    ./insert.nix
    ./normal.nix
    ./visual.nix
  ];

  keymaps = [
    {
      mode = [ "v" "o" ];
      key = "<BS>";
      action = "k";
      options = {
        desc = "Go up";
        noremap = true;
      };
    }
    {
      mode = [ "n" "v" "i" ];
      key = "<Home>";
      action.__raw = ''
        function()
          local col = vim.fn.col('.')
          local first_non_blank = vim.fn.indent('.')
          if col - 1 == first_non_blank then
            vim.cmd('normal! 0')
          else
            vim.cmd('normal! ^')
          end
        end
      '';
      options = {
        desc = "Switches the cursor position between ^ and 0";
      };
    }
  {
      mode = [ "n" "i" "v" ];
      key = "<C-s>";
      options.desc = "Save file (saveas if unnamed)";
      action.__raw = # lua
      ''
        function()
          vim.cmd.stopinsert()

          if vim.bo.buftype ~= "" then
            return
          end

          if vim.api.nvim_buf_get_name(0) ~= "" then
            vim.cmd.write()
            return
          end

          Snacks.input({
            prompt = "Save as: ",
            default = vim.fn.getcwd() .. "/",
            completion = "file",
          }, function(name)
            if not name or name == "" then
              return
            end

            vim.fn.mkdir(vim.fn.fnamemodify(name, ":h"), "p")

            local ok, err = pcall(vim.cmd.saveas, vim.fn.fnameescape(name))
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end)
        end
      '';
    }
    {
      mode = ["n" "t" "i"];
      key = "<C-A-Up>";
      action.__raw = ''
        function()
          vim.cmd("wincmd k")
          vim.cmd.stopinsert()
        end
      '';
      options = {
        desc = "Go to the up window";
      };
    }
    {
      mode = ["n" "t" "i"];
      key = "<C-A-Down>";
      action.__raw = ''
        function()
          vim.cmd("wincmd j")
          vim.cmd.stopinsert()
        end
      '';
      options = {
        desc = "Go to the down window";
      };
    }
    {
      mode = ["n" "t" "i"];
      key = "<C-A-Left>";
      action.__raw = ''
        function()
          vim.cmd("wincmd h")
          vim.cmd.stopinsert()
        end
      '';
      options = {
        desc = "Go to the left window";
      };
    }
    {
      mode = ["n" "t" "i"];
      key = "<C-A-Right>";
      action.__raw = ''
        function()
          vim.cmd("wincmd l")
          vim.cmd.stopinsert()
        end
      '';
      options = {
        desc = "Go to the right window";
      };
    }
    {
      mode = [ "n" "v" "i" ];
      key = "<S-Up>";
      action = "<C-u>";
      options = {
        desc = "Smooth scroll";
        remap = true;
      };
    }
    {
      mode = [ "n" "v" "i" ];
      key = "<S-Down>";
      action = "<C-d>";
      options = {
        desc = "Smooth scroll";
        remap = true;
      };
    }
  ];
}
