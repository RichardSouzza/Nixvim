require("cinnamon").setup({
  keymaps = {
    basic = true,
    extra = false,
  },
  options = {
    mode = "cursor",
    max_delta = {
      time = 250,
    },
  },
})

-- Lualine breadcrumbs highlight

local hl = vim.api.nvim_get_hl(0, { name = "lualine_b_normal" })

vim.api.nvim_set_hl(0, "SagaBoolean", { fg = hl.fg, bg = hl.bg })
vim.api.nvim_set_hl(0, "SagaClass", { fg = hl.fg, bg = hl.bg })
vim.api.nvim_set_hl(0, "SagaField", { fg = hl.fg, bg = hl.bg })
vim.api.nvim_set_hl(0, "SagaFileName", { fg = hl.fg, bg = hl.bg })
vim.api.nvim_set_hl(0, "SagaFolder", { fg = hl.fg, bg = hl.bg })
vim.api.nvim_set_hl(0, "SagaFolderName", { fg = hl.fg, bg = hl.bg })
vim.api.nvim_set_hl(0, "SagaFunction", { fg = hl.fg, bg = hl.bg })
vim.api.nvim_set_hl(0, "SagaMethod", { fg = hl.fg, bg = hl.bg })
vim.api.nvim_set_hl(0, "SagaSep", { fg = hl.fg, bg = hl.bg })

--------------------------------

require("satellite").setup({
  show_always = true,
  excluded_buftypes = {
    "nofile",
    "popup",
    "prompt",
    "scratch",
    "terminal",
  },
  excluded_filetypes = {
    "neo-tree",
  },
  handlers = {
    marks = {
      enable = false, -- Very unstable
    },
  },
})

require("sunglasses").setup({
  filter_percent = 0.4,
  excluded_filetypes = {
    "toggleterm",
  },
  excluded_highlights = {},
  can_shade_callback = function(opts)
    -- opts: { window_id = number, buffer = number, filetype = string, filename = string }
    local conditions = {
      function()
        return vim.api.nvim_get_option_value("diff", { win = opts.window })
      end,
    }

    for _, condition in ipairs(conditions) do
      if condition() then
        return false
      end
    end

    return true
  end,
})
vim.cmd("SunglassesDisable")

require("scrollEOF").setup({
  insert_mode = true,
})
