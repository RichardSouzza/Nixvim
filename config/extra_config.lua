-- Allow Neovim to use language-specific indent rules

vim.cmd("filetype plugin indent on")

-- Enable syntax highlighting

vim.cmd("syntax on")

-- Configure clipboard for WSL

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = { "sh", "-c", "iconv -f UTF-8 -t UTF-16LE | clip.exe" },
      ["*"] = { "sh", "-c", "iconv -f UTF-8 -t UTF-16LE | clip.exe" },
    },
    paste = {
      ["+"] = {
        "powershell.exe",
        "-NoProfile",
        "-Command",
        "[Console]::OutputEncoding=[System.Text.Encoding]::UTF8; "
          .. "$t = Get-Clipboard -Raw; "
          .. '$t = $t -replace "`r`n", "`n"; '
          .. '$t = $t -replace "`r", ""; '
          .. "[Console]::Out.Write($t)",
      },
      ["*"] = {
        "powershell.exe",
        "-NoProfile",
        "-Command",
        "[Console]::OutputEncoding=[System.Text.Encoding]::UTF8; "
          .. "$t = Get-Clipboard -Raw; "
          .. '$t = $t -replace "`r`n", "`n"; '
          .. '$t = $t -replace "`r", ""; '
          .. "[Console]::Out.Write($t)",
      },
    },
    cache_enabled = 0,
  }
end

-- Configure diff

vim.o.diffopt =
  "internal,filler,closeoff,indent-heuristic,linematch:60,algorithm:histogram"

-- Ignore builtin colorschemes

vim.opt.wildignore:append({
  "blue.vim",
  "darkblue.vim",
  "delek.vim",
  "desert.vim",
  "elflord.vim",
  "evening.vim",
  "industry.vim",
  "koehler.vim",
  "lunaperche.vim",
  "morning.vim",
  "murphy.vim",
  "pablo.vim",
  "peachpuff.vim",
  "quiet.vim",
  "retrobox.vim",
  "ron.vim",
  "shine.vim",
  "slate.vim",
  "torte.vim",
  "unokai.vim",
  "vim.lua",
  "wildcharm.vim",
  "zaibatsu.vim",
  "zellner.vim",
})

-- Set persistence

vim.opt.sessionoptions = {
  -- "buffers",
  "curdir",
  -- "folds",
  "globals",
  "help",
  "skiprtp",
  -- "tabpages",
  "winsize",
}

-- Open arrow buffers on init

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.schedule(function()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local ft = vim.api.nvim_buf_get_option(buf, "filetype")

        if ft == "snacks_dashboard" then return end
      end

      local arrow_files = vim.g.arrow_filenames or {}
      local cwd = vim.loop.cwd()

      for _, filename in ipairs(arrow_files) do
        local fullpath = cwd .. "/" .. filename

        if vim.fn.filereadable(fullpath) == 1 then
          vim.cmd("badd " .. fullpath)
        end
      end

      if #arrow_files > 0 then
        vim.cmd("edit " .. cwd .. "/" .. arrow_files[1])

        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_get_name(buf) == "" then
            vim.cmd("bwipeout " .. buf)
          end
        end
      end
    end)
  end,
})

-- Invert search direction

vim.keymap.set("n", "n", "N")
vim.keymap.set("n", "N", "n")

-- Remap 'Comment' and set 'Search code' keymap
-- https://github.com/neovim/neovim/discussions/29075#discussioncomment-11140291

local copy_keymap = function(mode, cur_lhs, new_lhs)
  local map_data = vim.fn.maparg(cur_lhs, mode, false, true)
  map_data.lhs, map_data.lhsraw = new_lhs, vim.keycode(new_lhs)
  vim.fn.mapset(map_data)
end

copy_keymap("n", "gc", "gb")
copy_keymap("x", "gc", "gb")
copy_keymap("o", "gc", "gb")
copy_keymap("n", "gcc", "gbb")

vim.keymap.del("n", "gc")
vim.keymap.del("x", "gc")
vim.keymap.del("o", "gc")
vim.keymap.del("n", "gcc")

vim.keymap.set("n", "gc", function()
  Snacks.picker.grep({ regex = false })
end, { desc = "Search code", noremap = true, nowait = true })

-- Disable scrolloff on click to prevent scrolling

vim.keymap.set(
  "n",
  "<LeftMouse>",
  ":let temp=&so<CR>:set so=0<CR><LeftMouse>:let &so=temp<CR>",
  { noremap = true, silent = true }
)

-- Periodically scan the workspace for diagnostics

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  callback = function()
    vim.opt_local.cursorline = true
  end,
})
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
  callback = function()
    vim.opt_local.cursorline = false
  end,
})

function pp(str)
  vim.schedule(function()
    print(str)
  end)
end

function scan_workspace()
  for _, client in ipairs(vim.lsp.get_clients()) do
    require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
    pp("Scanning...")
  end
end

function scan_workspace2()
  for _, client in ipairs(vim.lsp.get_clients()) do
    if vim.tbl_get(client.config, "filetypes") then
      print("loading for " .. client.name)
      require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
    end
  end
end

-- local timer = vim.uv.new_timer()
-- timer:start(1000, 0, vim.schedule_wrap(scan_workspace2))
