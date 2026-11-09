-- Configure clipboard for WSL

if vim.fn.has('wsl') == 1 then
  if vim.fn.executable('win32yank.exe') == 1 then
    vim.g.clipboard = {
      name = 'win32yank-wsl',
      copy = {
        ['+'] = 'win32yank.exe -i --crlf',
        ['*'] = 'win32yank.exe -i --crlf',
      },
      paste = {
        ['+'] = 'win32yank.exe -o --lf',
        ['*'] = 'win32yank.exe -o --lf',
      },
      cache_enabled = 0,
    }
  else
    local powershell_paste = {
      'powershell.exe',
      '-NoProfile',
      '-Command',
      '[Console]::OutputEncoding=[System.Text.Encoding]::UTF8; '
        .. '$t = Get-Clipboard -Raw; '
        .. '$t = $t -replace "`r`n", "`n"; '
        .. '$t = $t -replace "`r", ""; '
        .. '[Console]::Out.Write($t)',
    }

    vim.g.clipboard = {
      name = 'WslClipboard',
      copy = {
        ['+'] = { 'sh', '-c', 'iconv -f UTF-8 -t UTF-16LE | clip.exe' },
        ['*'] = { 'sh', '-c', 'iconv -f UTF-8 -t UTF-16LE | clip.exe' },
      },
      paste = {
        ['+'] = powershell_paste,
        ['*'] = powershell_paste,
      },
      cache_enabled = 0,
    }
  end
end
