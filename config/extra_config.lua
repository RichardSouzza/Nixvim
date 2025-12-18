-- Enable clip and powershell for WSL
if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
        name = "WslClipboard",
        copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe",
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
