let
  nixpkgsSrc =  builtins.fetchGit {
    url = "https://github.com/NixOS/nixpkgs.git";
    rev = "d5291756487d70bc336e33512a9baf9fa1788faf";
    ref = "refs/tags/19.09";
    };
  
  pkgs =  import (
    nixpkgsSrc
  ) { };
  pkgs' = import ./nix/vscode.nix {inherit pkgs ;}
  // import ./nix/purescript.nix {inherit pkgs ;};
  
  native-purescript-cpp = import ./nix/native-purescript-cpp.nix {inherit pkgs ;};
  pname = "purescriptearningbook";
  version = "0.0.1";
  name = pname + "-" + version;
in 
  pkgs.stdenv.mkDerivation rec {
    inherit version pname name;

    buildInputs = with pkgs // pkgs';
    [ 
      vscode
      native-purescript-cpp
      purty
      purs
      arduino
      psc-package
      gcc
      libpcap
    ];

  shellHook = ''
    cp -r "${pkgs.arduino}/share/arduino/hardware/arduino/avr/cores/arduino/" "$PWD/ffi/"
  '';
}