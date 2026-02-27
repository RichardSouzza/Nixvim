-- Allow Neovim to use language-specific indent rules

vim.cmd("filetype plugin indent on")

-- Enable syntax highlighting

vim.cmd("syntax on")

-- Enable clip and powershell for WSL

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
        "[Console]::OutputEncoding=[System.Text.Encoding]::UTF8; " .. "$t = Get-Clipboard -Raw; " .. '$t = $t -replace "`r`n", "`n"; ' .. '$t = $t -replace "`r", ""; ' .. "[Console]::Out.Write($t)",
      },
      ["*"] = {
        "powershell.exe",
        "-NoProfile",
        "-Command",
        "[Console]::OutputEncoding=[System.Text.Encoding]::UTF8; " .. "$t = Get-Clipboard -Raw; " .. '$t = $t -replace "`r`n", "`n"; ' .. '$t = $t -replace "`r", ""; ' .. "[Console]::Out.Write($t)",
      },
    },
    cache_enabled = 0,
  }
end

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

-- Disable scrolloff on click to prevent scrolling

vim.keymap.set("n", "<LeftMouse>", ":let temp=&so<CR>:set so=0<CR><LeftMouse>:let &so=temp<CR>", { noremap = true, silent = true })

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

local timer = vim.uv.new_timer()
timer:start(1000, 0, vim.schedule_wrap(scan_workspace2))
