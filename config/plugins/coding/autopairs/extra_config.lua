local npairs = require('nvim-autopairs')
local rule = require('nvim-autopairs.rule')

npairs.add_rules({
  rule('=', ';', 'dart'),
  rule('=', ';', 'nix'),
  rule('with', '; ', 'nix'),
})
