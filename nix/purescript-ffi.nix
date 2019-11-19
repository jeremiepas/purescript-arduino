
{ pkgs ? import <nixpkgs> {}}:
let
  ffi-cpp = pkgs.fetchFromGitHub {
      owner = "andyarvanitis";
      repo = "purescript-native-cpp-ffi";
      rev = "268567879eed9a1da8450f07277382a76c658a90";
      sha256 = "0x9p5zzv4n31hrzz5c9x14xj3rvzgbzbn0c9z3yvz85xsm2pcwhw";

    };
in
  ffi-cpp