let
  mkKeymap = { key, action, desc }:
    {
      mode = [ "n" "x" ];
      key = key;
      action = "<CMD>MultipleCursors${action}<CR>";
      options = {
        desc = desc;
        silent = true;
      };
    };

in
{
  keymaps = [
    (mkKeymap { key = "<C-Up>"; action = "AddUp"; desc = "Add cursor and move up"; })
    (mkKeymap { key = "<C-Down>"; action = "AddDown"; desc = "Add cursor and move down"; })
    (mkKeymap { key = "<A-n>"; action = "JumpNextMatch"; desc = "Jump to next cword"; })
    (mkKeymap { key = "<A-S-n>"; action = "JumpPrevMatch"; desc = "Jump to previous cword"; })
    (mkKeymap { key = "<C-n>"; action = "AddJumpNextMatch"; desc = "Add cursor and jump to next cword"; })
    (mkKeymap { key = "<C-S-n>"; action = "AddJumpPrevMatch"; desc = "Add cursor and jump to previous cword"; })
  ];
}
