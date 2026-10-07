-- Open arrow buffers on init

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.schedule(function()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local ft = vim.api.nvim_buf_get_option(buf, 'filetype')

        if ft == 'snacks_dashboard' then return end
      end

      local arrow_files = vim.g.arrow_filenames or {}
      local cwd = vim.loop.cwd()

      for _, filename in ipairs(arrow_files) do
        local fullpath = cwd .. '/' .. filename

        if vim.fn.filereadable(fullpath) == 1 then
          vim.cmd('badd ' .. fullpath)
        end
      end

      if #arrow_files > 0 then
        vim.cmd('edit ' .. cwd .. '/' .. arrow_files[1])

        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_get_name(buf) == '' then
            vim.cmd('bwipeout ' .. buf)
          end
        end
      end
    end)
  end,
})
