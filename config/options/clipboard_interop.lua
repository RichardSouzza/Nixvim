-- Configure clipboard for WSL with Interop fix

--[[
sudo tee /usr/local/bin/fix-wsl-interop >/dev/null <<'EOF'
#!/bin/sh
mountpoint -q /proc/sys/fs/binfmt_misc || mount -t binfmt_misc none /proc/sys/fs/binfmt_misc
grep -qx enabled /proc/sys/fs/binfmt_misc/WSLInterop 2>/dev/null && exit 0
[ -e /proc/sys/fs/binfmt_misc/WSLInterop ] && echo -1 > /proc/sys/fs/binfmt_misc/WSLInterop
echo ':WSLInterop:M::MZ::/init:PF' > /proc/sys/fs/binfmt_misc/register
EOF
sudo chown root:root /usr/local/bin/fix-wsl-interop
sudo chmod 755 /usr/local/bin/fix-wsl-interop

echo "$USER ALL=(root) NOPASSWD: /usr/local/bin/fix-wsl-interop" | sudo tee /etc/sudoers.d/wsl-interop
sudo chmod 440 /etc/sudoers.d/wsl-interop
sudo visudo -c
--]]

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
