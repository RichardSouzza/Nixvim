let
  mkKeymap = { key, action, case, desc }:
    {
      mode = [ "n" "v" ];
      key = "ç${key}";
      action = "<CMD>lua require('textcase').${action}('to_${case}')<CR>";
      options = {
        desc = desc;
        silent = true;
      };
    };

in
{
  keymaps = [
    (mkKeymap { key = "."; action = "current_word"; case = "dot_case";      desc = "Convert to 'dot.case'";      })
    (mkKeymap { key = "a"; action = "current_word"; case = "phrase_case";   desc = "Convert to 'phrase case'";   })
    (mkKeymap { key = "c"; action = "current_word"; case = "camel_case";    desc = "Convert to 'camelCase'";     })
    (mkKeymap { key = "d"; action = "current_word"; case = "dash_case";     desc = "Convert to 'dash-case'";     })
    (mkKeymap { key = "f"; action = "current_word"; case = "path_case";     desc = "Convert to 'path/case'";     })
    (mkKeymap { key = "l"; action = "current_word"; case = "lower_case";    desc = "Convert to 'lower case'";    })
    (mkKeymap { key = "n"; action = "current_word"; case = "constant_case"; desc = "Convert to 'CONSTANT_CASE'"; })
    (mkKeymap { key = "p"; action = "current_word"; case = "pascal_case";   desc = "Convert to 'PascalCase'";    })
    (mkKeymap { key = "s"; action = "current_word"; case = "snake_case";    desc = "Convert to 'snake_case'";    })
    (mkKeymap { key = "t"; action = "current_word"; case = "title_case";    desc = "Convert to 'Title Case'";    })
    (mkKeymap { key = "u"; action = "current_word"; case = "upper_case";    desc = "Convert to 'UPPER CASE'";    })

    (mkKeymap { key = ">"; action = "lsp_rename"; case = "dot_case";      desc = "LSP rename 'dot.case'";      })
    (mkKeymap { key = "A"; action = "lsp_rename"; case = "phrase_case";   desc = "LSP rename 'phrase case'";   })
    (mkKeymap { key = "C"; action = "lsp_rename"; case = "camel_case";    desc = "LSP rename 'camelCase'";     })
    (mkKeymap { key = "D"; action = "lsp_rename"; case = "dash_case";     desc = "LSP rename 'dash-case'";     })
    (mkKeymap { key = "F"; action = "lsp_rename"; case = "path_case";     desc = "LSP rename 'path/case'";     })
    (mkKeymap { key = "L"; action = "lsp_rename"; case = "lower_case";    desc = "LSP rename 'lower case'";    })
    (mkKeymap { key = "N"; action = "lsp_rename"; case = "constant_case"; desc = "LSP rename 'CONSTANT_CASE'"; })
    (mkKeymap { key = "P"; action = "lsp_rename"; case = "pascal_case";   desc = "LSP rename 'PascalCase'";    })
    (mkKeymap { key = "S"; action = "lsp_rename"; case = "snake_case";    desc = "LSP rename 'snake_case'";    })
    (mkKeymap { key = "T"; action = "lsp_rename"; case = "title_case";    desc = "LSP rename 'Title Case'";    })
    (mkKeymap { key = "U"; action = "lsp_rename"; case = "upper_case";    desc = "LSP rename 'UPPER CASE'";    })
  ];
}
