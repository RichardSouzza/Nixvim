function()
  function forward_char()
    local char = vim.fn.getchar()
    if char ~= "" then
      local found = vim.fn.search(char .. "$", true)
      if found > 0 then
        vim.fn.cursor(0, found - 1)
      end
    end
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

  local function set_heading_and_append(level)
    set_heading(level)
    vim.cmd("normal! $A")
  end

  local function toggle_checkbox_line(line)
    if line:find("%[ %]") then
      return line:gsub("%[ %]", "[x]", 1)
    elseif line:find("%[[xX]%]") then
      return line:gsub("%[[xX]%]", "[ ]", 1)
    end
    return line
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

  vim.keymap.set("i", "<C-h>0", function() set_heading_and_append(0) end, { buffer = true, desc = "Promote line to level-0 heading" })
  vim.keymap.set("i", "<C-h>1", function() set_heading_and_append(1) end, { buffer = true, desc = "Promote line to level-1 heading" })
  vim.keymap.set("i", "<C-h>2", function() set_heading_and_append(2) end, { buffer = true, desc = "Promote line to level-2 heading" })
  vim.keymap.set("i", "<C-h>3", function() set_heading_and_append(3) end, { buffer = true, desc = "Promote line to level-3 heading" })
  vim.keymap.set("i", "<C-h>4", function() set_heading_and_append(4) end, { buffer = true, desc = "Promote line to level-4 heading" })
  vim.keymap.set("i", "<C-h>5", function() set_heading_and_append(5) end, { buffer = true, desc = "Promote line to level-5 heading" })
  vim.keymap.set("i", "<C-h>6", function() set_heading_and_append(6) end, { buffer = true, desc = "Promote line to level-6 heading" })

  vim.keymap.set("n", "<C-b>",   [[a****<Esc>hi]],       { buffer = true, desc = "Insert **bold**"                     })
  vim.keymap.set("n", "<C-c>",   [[a``<Esc>i]],          { buffer = true, desc = "Insert `inline code`"                })
  vim.keymap.set("n", "<C-C>",   [[a``````<Esc>i]],      { buffer = true, desc = "Insert `code block`"                 })
  vim.keymap.set("n", "<C-j>",   [[a**<Esc>i]],          { buffer = true, desc = "Insert *italic*"                     })
  vim.keymap.set("n", "<C-t>",   [[a~~~~<Esc>hi]],       { buffer = true, desc = "Insert ~~strikethrough~~"            })

  vim.keymap.set("n", "<C-k>",   [[I> ]],                { buffer = true, desc = "Insert blockquote"                   })
  vim.keymap.set("n", "<C-l>",   [[I- ]],                { buffer = true, desc = "Insert bullet list"                  })
  vim.keymap.set("n", "<C-S-l>", [[I1. ]],               { buffer = true, desc = "Insert numbered list"                })
  vim.keymap.set("n", "<C-x>",   [[I- [ ] ]],            { buffer = true, desc = "Insert checkbox list"                })

  vim.keymap.set("i", "<C-b>",   [[****<Esc>hi]],        { buffer = true, desc = "Insert **bold**"                     })
  vim.keymap.set("i", "<C-c>",   [[``<Esc>i]],           { buffer = true, desc = "Insert `inline code`"                })
  vim.keymap.set("i", "<C-C>",   [[``````<Esc>hhi]],     { buffer = true, desc = "Insert ```code block```"             })
  vim.keymap.set("i", "<C-j>",   [[**<Esc>i]],           { buffer = true, desc = "Insert *italic*"                     })
  vim.keymap.set("i", "<C-t>",   [[~~~~<Esc>hi]],        { buffer = true, desc = "Insert ~~strikethrough~~"            })

  vim.keymap.set("i", "<C-k>",   [[> ]],                 { buffer = true, desc = "Insert blockquote"                   })
  vim.keymap.set("i", "<C-l>",   [[- ]],                 { buffer = true, desc = "Insert bullet list"                  })
  vim.keymap.set("i", "<C-S-l>", [[1. ]],                { buffer = true, desc = "Insert numbered list"                })
  vim.keymap.set("i", "<C-x>",   [[- [ ] ]],             { buffer = true, desc = "Insert checkbox list"                })

  vim.keymap.set("v", "<C-b>",   [[c****<Esc>hP]],       { buffer = true, desc = "Wrap selection in **bold**"          })
  vim.keymap.set("v", "<C-c>",   [[c``<Esc>P]],          { buffer = true, desc = "Wrap selection in `inline code`"     })
  vim.keymap.set("v", "<C-C>",   [[c``````<Esc>hhP]],    { buffer = true, desc = "Wrap selection in ```code block```"  })
  vim.keymap.set("v", "<C-i>",   [[c**<Esc>P]],          { buffer = true, desc = "Wrap selection in *italic*"          })
  vim.keymap.set("v", "<C-t>",   [[c~~~~<Esc>hP]],       { buffer = true, desc = "Wrap selection in ~~strikethrough~~" })

  vim.keymap.set("v", "<C-k>",   [[:s/^/> /<CR>gv]],     { buffer = true, desc = "Convert selection to blockquote"     })
  vim.keymap.set("v", "<C-l>b",  [[:s/^/- /<CR>gv]],     { buffer = true, desc = "Convert selection to bullet list"    })
  vim.keymap.set("v", "<C-l>n",  [[:s/^/1. /<CR>gv]],    { buffer = true, desc = "Convert selection to numbered list"  })
  vim.keymap.set("v", "<C-x>",   [[:s/^/- [ ] /<CR>gv]], { buffer = true, desc = "Convert selection to checkbox list"  })
end
