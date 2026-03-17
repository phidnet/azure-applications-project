{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "pipzone";

  buildInputs = with pkgs; [
    python312
    python312Packages.pip
    python312Packages.virtualenv
    unixODBC
  ];

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.unixODBC
  ];

  shellHook = ''
    if [ ! -d venv ]; then
      echo "Creating virtual environment..."
      python -m venv venv
    fi

    source venv/bin/activate
  '';
}