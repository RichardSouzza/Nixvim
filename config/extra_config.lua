-- Allows Neovim to use language-specific indent rules

vim.cmd("filetype plugin indent on")

-- Enable clip and powershell for WSL
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = { "sh", "-c", "iconv -f UTF-8 -t UTF-16LE | clip.exe" },
      ["*"] = { "sh", "-c", "iconv -f UTF-8 -t UTF-16LE | clip.exe" },
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
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

-- Mute Satellite errors
-- The plugin has errors in the 'nvim_win_text_height' method
-- when calculating the height in small buffers.

do
  local orig = vim._print_error

  vim._print_error = function(msg)
    if type(msg) ~= "string" then
      return orig(msg)
    end

    if msg:match("satellite") and msg:match("Buffer with this name already exists") then
      return
    end

    orig(msg)
  end
end
