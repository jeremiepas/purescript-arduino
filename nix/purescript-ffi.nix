
{ pkgs ? import <nixpkgs> {}}:
let
  easyPS = import (pkgs.fetchFromGitHub {
    owner = "andyarvanitis";
    repo = "purescript-native-cpp-ffi";
    rev = "268567879eed9a1da8450f07277382a76c658a90";
    sha256 = "0mmjvqpkns964sjkbw0waqb47vfhg9r0fp9y0b5pizpikmw3fbp2";
  }) { inherit pkgs; };
  
in
  easyPS