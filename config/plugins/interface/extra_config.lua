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

require("satellite").setup({
  show_always = true,
  excluded_buftypes = {
    "nofile",
    "popup",
    "prompt",
    "scratch",
    "terminal",
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
  insert_mode = false,
})
