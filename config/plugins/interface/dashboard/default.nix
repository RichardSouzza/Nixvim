{ lib, ... }:

{
  plugins = {
    snacks.settings.dashboard = {
      enable = true;
      pane_gap = 8;

      preset = {
        header = lib.concatStringsSep "\n" [
          "                                                                   "
          "      ████ ██████           █████      ██                    "
          "     ███████████             █████                            "
          "     █████████ ███████████████████ ███   ███████████  "
          "    █████████  ███    █████████████ █████ ██████████████  "
          "   █████████ ██████████ █████████ █████ █████ ████ █████  "
          " ███████████ ███    ███ █████████ █████ █████ ████ █████ "
          "██████  █████████████████████ ████ █████ █████ ████ ██████"
        ];

        keys = [
          { icon = " "; key = "n"; desc = "New Scratch";     action.__raw = builtins.readFile ./new_scratch_action.lua; }
          { icon = " "; key = "f"; desc = "Find File";       action  = ":lua Snacks.dashboard.pick('files')";           }
          { icon = " "; key = "c"; desc = "Find Text";       action  = ":lua Snacks.dashboard.pick('live_grep')";       }
          { icon = "󰭤 "; key = "s"; desc = "Find Scratch";    action  = ":lua Snacks.scratch.select()";                  }
          { icon = " "; key = "w"; desc = "Recent Files";    action  = ":lua Snacks.dashboard.pick('oldfiles')";        }
          { icon = " "; key = "x"; desc = "Restore Session"; action  = ":lua require('persistence').select()";          }
          { icon = " "; key = "b"; desc = "Browse Repo";     action  = ":lua Snacks.gitbrowse()";                       }
          { icon = " "; key = "q"; desc = "Quit";            action  = ":qa";                                           }
        ];
      };

      sections = [
        { section = "header"; indent = 2; }
        { section = "keys"; gap = 1; padding = 1; }
        {
          icon = " ";
          title = "Projects";
          section = "projects";
          limit = 5;
          indent = 2;
          padding = 1;
        }
        {
          title = " ";
          pane = 2;
          padding = 3;
        }
        {
          section = "terminal";
          cmd = "krabby name blastoise --no-title; sleep .1";
          pane = 2;
          height = 22;
          indent = 15;
        }
        {
          icon = " ";
          title = "Recent Files";
          section = "recent_files";
          limit = 5;
          pane = 2;
          indent = 2;
          padding = 1;
        }
        { key = "/"; action = ":lua Snacks.dashboard.pick('files')"; }
      ];
    };
  };
}
