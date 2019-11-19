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

  ffi-cpp = import ./nix/purescript-ffi.nix {inherit pkgs; };
  arduinoSTL = import ./nix/arduinoSTL.nix {inherit pkgs; };

  pname = "purescriptearningbook";
  version = "0.0.1";
  name = pname + "-" + version;
in 
  pkgs.stdenv.mkDerivation rec {
    inherit version pname name;

    buildInputs = with pkgs // pkgs';
    [ 
      arduinoSTL
      boost
      vscode
      ffi-cpp
      purty
      purs
      arduino
      psc-package
      gcc
      libpcap
    ];

  shellHook = ''
    export ARDUINO_STL=${arduinoSTL}
    export BOOST=${pkgs.boost}
    export FFI_SRC=$PWD/ffi
    export ARDUINO_APLICATIOON=${pkgs.arduino}

    mkdir ffi
    cp -r "${pkgs.arduino}/share/arduino/hardware/arduino/avr/cores/arduino/" "$FFI_SRC/arduino"
    cp -r "${ffi-cpp}/" "$FFI_SRC/purscript"
    chmod 777 -R $FFI_SRC
    rm -f $FFI_SRC/arduino/hooks.cpp
    rm -f $FFI_SRC/arduino/main.cpp
  '';
}