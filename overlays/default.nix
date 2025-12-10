[
  (final: prev: {
    vimUtils = prev.vimUtils // {
      buildVimPlugin = args:
        let plugin = prev.vimUtils.buildVimPlugin args;
        in plugin.overrideAttrs (old: {
          postInstall = (old.postInstall or "") + ''
            find $out/doc -type f -name "*.md" -delete || true
            find $out/doc -type f -name "*.txt" -delete || true
            rm -f $out/doc/tags || true
          '';
        });
    };
  })
]
