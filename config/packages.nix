{ pkgs }:

let
  nvimPython = pkgs.python311.withPackages (ps: with ps; [
    debugpy
    pynvim

    (buildPythonPackage {
      pname = "vimspector";
      version = "0-unstable-2026-01-11";
      src = pkgs.fetchFromGitHub {
        owner = "puremourning";
        repo = "vimspector";
        rev = "409005fac4f014b271ed3526f3c0d08c4d42ed19";
        hash = "sha256-Kyx3YHOvZ7xagbU4xzumEAshU7oZOssacQBb7bIRu98=";
      };

      sourceRoot = "source/python3";
      format = "other";
      doCheck = false;

      buildPhase = ''
        runHook preBuild
        echo "Skipping build, pure Python package"
        runHook postBuild
      '';

      installPhase = ''
        runHook preInstall
        mkdir -p $out/lib/python${python.pythonVersion}/site-packages
        cp -r vimspector $out/lib/python${python.pythonVersion}/site-packages/
        runHook postInstall
      '';

      propagatedBuildInputs = [
        ps.debugpy
        ps.pynvim
      ];

      meta = {
        homepage = "https://github.com/puremourning/vimspector";
        license = lib.licenses.asl20;
      };
    })
  ]);

in
{
  inherit nvimPython;
}
