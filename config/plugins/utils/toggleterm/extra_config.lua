local Terminal = require("toggleterm.terminal").Terminal

local scooter = Terminal:new({
  cmd = "scooter --hidden",
  display_name = "Scooter",
  direction = "float",
  dir = "git_dir",
  hidden = false,
  on_open = function()
    vim.cmd("SunglassesEnable")
  end,
  on_close = function()
    vim.cmd("SunglassesDisable")
  end,
})

function Scooter()
  scooter:toggle()
end

function goto_previous_buffer()
  vim.cmd("stopinsert")

  local buffers = vim.fn.getbufinfo({ buflisted = 1 })

  table.sort(buffers, function(a, b)
    return a.lastused > b.lastused
  end)

  for _, buf in ipairs(buffers) do
    if buf.bufnr ~= vim.api.nvim_get_current_buf() then
      local ft = vim.bo[buf.bufnr].filetype
      if ft ~= "toggleterm" then
        vim.api.nvim_set_current_buf(buf.bufnr)
        return
      end
    end
  end
end
