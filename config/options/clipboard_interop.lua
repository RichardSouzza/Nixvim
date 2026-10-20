-- Configure clipboard for WSL with Interop fix

if vim.fn.has('wsl') == 1 then
  local fix = 'sudo -n /usr/local/bin/fix-wsl-interop >/dev/null 2>&1'

  local copy_script = [[
tmp=$(mktemp) || exit 1
trap 'rm -f "$tmp"' EXIT
cat > "$tmp"
try_copy() {
  win32yank.exe -i --crlf < "$tmp" 2>/dev/null \
    || iconv -f UTF-8 -t UTF-16LE < "$tmp" | clip.exe 2>/dev/null
}
try_copy && exit 0
]] .. fix .. [[ && try_copy
]]

  local ps_paste =
    [[powershell.exe -NoProfile -Command '[Console]::OutputEncoding=[System.Text.Encoding]::UTF8; $t = Get-Clipboard -Raw; $t = $t -replace "`r`n", "`n"; $t = $t -replace "`r", ""; [Console]::Out.Write($t)']]

  local paste_script = [[
try_paste() {
  win32yank.exe -o --lf 2>/dev/null || ]] .. ps_paste .. [[

}
try_paste && exit 0
]] .. fix .. [[ && try_paste
]]

  local copy = { 'sh', '-c', copy_script }
  local paste = { 'sh', '-c', paste_script }

  vim.g.clipboard = {
    name = 'WslClipboardSelfHealing',
    copy = { ['+'] = copy, ['*'] = copy },
    paste = { ['+'] = paste, ['*'] = paste },
    cache_enabled = 0,
  }
end
