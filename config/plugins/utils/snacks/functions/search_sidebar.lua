function()
  local function is_neotree_open()
    local visible = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      local ft = vim.api.nvim_buf_get_option(buf, "filetype")
      if ft == "neo-tree" then
        visible = true
        break
      end
    end
    return visible
  end

  local function restore_sidebar()
    if _G.neotree_was_open then
      vim.cmd("Neotree focus")
      vim.cmd("wincmd p")
    end
  end

  Snacks.picker.grep({
    auto_close = false,
    diagnostics = true,
    diagnostics_open = false,
    git_status = true,
    git_status_open = false,
    git_untracked = true,
    follow_file = true,
    focus = "list",
    jump = { close = false },
    layout = { preset = "sidebar", preview = false },
    regex = false,
    supports_live = true,
    watch = true,
    on_close = function()
      restore_sidebar()
    end,
  })

  _G.neotree_was_open = is_neotree_open()
  vim.cmd("Neotree close")
end
