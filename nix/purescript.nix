{ pkgs ? import <nixpkgs> {}}:
let
  easyPS = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    rev = "ccc9b9abff991fd474a452976fe7d50063f1855b";
    sha256 = "0mmjvqpkns964sjkbw0waqb47vfhg9r0fp9y0b5pizpikmw3fbp2";
  }) { inherit pkgs; } ;
in
  easyPS