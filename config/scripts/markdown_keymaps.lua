function()
  local function toggle_checkbox_line(line)
    if line:find("%[ %]") then
      return line:gsub("%[ %]", "[x]", 1)
    elseif line:find("%[[xX]%]") then
      return line:gsub("%[[xX]%]", "[ ]", 1)
    end
    return line
  end

  local function set_heading(level)
    local line = vim.api.nvim_get_current_line()
    local content = line:gsub("^%s*#+%s+", "")

    if level == 0 then
      vim.api.nvim_set_current_line(content)
      return
    end

    local prefix = string.rep("#", level) .. " "
    vim.api.nvim_set_current_line(prefix .. content)
  end

  vim.keymap.set("n", "<space>",
    function()
      local line = vim.api.nvim_get_current_line()
      local new = toggle_checkbox_line(line)

      if new ~= line then
        vim.api.nvim_set_current_line(new)
      end
    end
  , { buffer = true, desc = "Toggle checkbox" })

  vim.keymap.set("n", "<C-h>0", function() set_heading(0) end, { buffer = true, desc = "Promote line to level-0 heading" })
  vim.keymap.set("n", "<C-h>1", function() set_heading(1) end, { buffer = true, desc = "Promote line to level-1 heading" })
  vim.keymap.set("n", "<C-h>2", function() set_heading(2) end, { buffer = true, desc = "Promote line to level-2 heading" })
  vim.keymap.set("n", "<C-h>3", function() set_heading(3) end, { buffer = true, desc = "Promote line to level-3 heading" })
  vim.keymap.set("n", "<C-h>4", function() set_heading(4) end, { buffer = true, desc = "Promote line to level-4 heading" })
  vim.keymap.set("n", "<C-h>5", function() set_heading(5) end, { buffer = true, desc = "Promote line to level-5 heading" })
  vim.keymap.set("n", "<C-h>6", function() set_heading(6) end, { buffer = true, desc = "Promote line to level-6 heading" })

  vim.keymap.set("v", "<C-b>",  [[c****<Esc>hP]],       { buffer = true, desc = "Wrap selection in **bold**"          })
  vim.keymap.set("v", "<C-c>",  [[c``<Esc>P]],          { buffer = true, desc = "Wrap selection in `inline code`"     })
  vim.keymap.set("v", "<C-i>",  [[c**<Esc>P]],          { buffer = true, desc = "Wrap selection in *italic*"          })
  vim.keymap.set("v", "<C-s>",  [[c~~~~<Esc>hP]],       { buffer = true, desc = "Wrap selection in ~~strikethrough~~" })

  vim.keymap.set("v", "<C-k>",  [[:s/^/> /<CR>gv]],     { buffer = true, desc = "Convert selection to blockquote"     })
  vim.keymap.set("v", "<C-l>",  [[:s/^/- /<CR>gv]],     { buffer = true, desc = "Convert selection to bullet list"    })
  vim.keymap.set("v", "<C-n>",  [[:s/^/1. /<CR>gv]],    { buffer = true, desc = "Convert selection to numbered list"  })
  vim.keymap.set("v", "<C-x>",  [[:s/^/- [ ] /<CR>gv]], { buffer = true, desc = "Convert selection to checkbox list"  })
end
