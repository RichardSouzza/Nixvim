-- Configure clipboard for WSL

if vim.fn.has('wsl') == 1 then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = { 'sh', '-c', 'iconv -f UTF-8 -t UTF-16LE | clip.exe' },
      ['*'] = { 'sh', '-c', 'iconv -f UTF-8 -t UTF-16LE | clip.exe' },
    },
    paste = {
      ['+'] = {
        'powershell.exe',
        '-NoProfile',
        '-Command',
        '[Console]::OutputEncoding=[System.Text.Encoding]::UTF8; '
          .. '$t = Get-Clipboard -Raw; '
          .. '$t = $t -replace "`r`n", "`n"; '
          .. '$t = $t -replace "`r", ""; '
          .. '[Console]::Out.Write($t)',
      },
      ['*'] = {
        'powershell.exe',
        '-NoProfile',
        '-Command',
        '[Console]::OutputEncoding=[System.Text.Encoding]::UTF8; '
          .. '$t = Get-Clipboard -Raw; '
          .. '$t = $t -replace "`r`n", "`n"; '
          .. '$t = $t -replace "`r", ""; '
          .. '[Console]::Out.Write($t)',
      },
    },
    cache_enabled = 0,
  }
end
