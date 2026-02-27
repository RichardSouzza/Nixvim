{
  keymaps = [
    {
      key = "<leader>dB";
      action.__raw = "function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end";
      mode = "n";
      options = {
        desc = "Breakpoint Condition";
      };
    }
    {
      key = "<leader>db";
      action.__raw = "function() require('dap').toggle_breakpoint() end";
      mode = "n";
      options = {
        desc = "Toggle Breakpoint";
      };
    }
    {
      key = "<leader>dc";
      action.__raw = "function() require('dap').continue() end";
      mode = "n";
      options = {
        desc = "Run/Continue";
      };
    }
    {
      key = "<leader>da";
      action.__raw = "function() require('dap').continue({ before = get_args }) end";
      mode = "n";
      options = {
        desc = "Run with Args";
      };
    }
    {
      key = "<leader>dC";
      action.__raw = "function() require('dap').run_to_cursor() end";
      mode = "n";
      options = {
        desc = "Run to Cursor";
      };
    }
    {
      key = "<leader>dg";
      action.__raw = "function() require('dap').goto_() end";
      mode = "n";
      options = {
        desc = "Go to Line (No Execute)";
      };
    }
    {
      key = "<leader>di";
      action.__raw = "function() require('dap').step_into() end";
      mode = "n";
      options = {
        desc = "Step Into";
      };
    }
    {
      key = "<leader>dj";
      action.__raw = "function() require('dap').down() end";
      mode = "n";
      options = {
        desc = "Down";
      };
    }
    {
      key = "<leader>dk";
      action.__raw = "function() require('dap').up() end";
      mode = "n";
      options = {
        desc = "Up";
      };
    }
    {
      key = "<leader>dl";
      action.__raw = "function() require('dap').run_last() end";
      mode = "n";
      options = {
        desc = "Run Last";
      };
    }
    {
      key = "<leader>do";
      action.__raw = "function() require('dap').step_out() end";
      mode = "n";
      options = {
        desc = "Step Out";
      };
    }
    {
      key = "<leader>dO";
      action.__raw = "function() require('dap').step_over() end";
      mode = "n";
      options = {
        desc = "Step Over";
      };
    }
    {
      key = "<leader>dP";
      action.__raw = "function() require('dap').pause() end";
      mode = "n";
      options = {
        desc = "Pause";
      };
    }
    {
      key = "<leader>dr";
      action.__raw = "function() require('dap').repl.toggle() end";
      mode = "n";
      options = {
        desc = "Toggle REPL";
      };
    }
    {
      key = "<leader>ds";
      action.__raw = "function() require('dap').session() end";
      mode = "n";
      options = {
        desc = "Session";
      };
    }
    {
      key = "<leader>dt";
      action.__raw = "function() require('dap').terminate() end";
      mode = "n";
      options = {
        desc = "Terminate";
      };
    }
    {
      key = "<leader>dw";
      action.__raw = "function() require('dap.ui.widgets').hover() end";
      mode = "n";
      options = {
        desc = "Widgets";
      };
    }
    # {
    #   key = "<F5>";
    #   action = "<CMD>call vimspector#Launch()<CR>";
    #   mode = "n";
    # }
    # {
    #   key = "<S-F5>";
    #   action = "<CMD>call vimspector#Continue()<CR>";
    #   mode = "n";
    # }
    # {
    #   key = "<F6>";
    #   action = "<CMD>call vimspector#StepOver()<CR>";
    #   mode = "n";
    # {
    #   key = "<F7>";
    #   action = "<CMD>call vimspector#StepInto()<CR>";
    #   mode = "n";
    # }
    # {
    #   key = "<S-F7>";
    #   action = "<CMD>call vimspector#StepOut()<CR>";
    #   mode = "n";
    # }
    # {
    #   key = "<F9>";
    #   action = "<CMD>call vimspector#ToggleBreakpoint()<CR>";
    #   mode = "n";
    # }
    # {
    #   key = "<F10>";
    #   action = "<CMD>call vimspector#Stop()<CR>";
    #   mode = "n";
    # }
  ];
}
