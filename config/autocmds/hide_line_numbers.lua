-- Show/hide line numbers

do
  local hidden_group = 'LineNrHidden'
  local ignored_buftypes = { terminal = true }
  local last_win = nil

  local function sync_linenr_highlight()
    local cur = vim.api.nvim_get_current_win()
    if cur == last_win then return end
    last_win = cur

    local normal_hl = vim.api.nvim_get_hl(0, { name = 'Normal' })
    vim.api.nvim_set_hl(0, hidden_group, { fg = normal_hl.bg })

    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_is_valid(win) then
        local buf = vim.api.nvim_win_get_buf(win)
        local buftype = vim.api.nvim_get_option_value('buftype', { buf = buf })
        if win == cur or ignored_buftypes[buftype] then
          vim.api.nvim_set_option_value('winhighlight', '', { win = win })
        else
          vim.api.nvim_set_option_value(
            'winhighlight',
            'LineNr:' .. hidden_group .. ',CursorLineNr:' .. hidden_group,
            { win = win }
          )
        end
      end
    end
  end

  local timer = vim.uv.new_timer()
  timer:start(50, 100, vim.schedule_wrap(sync_linenr_highlight))
end
