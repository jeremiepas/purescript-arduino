{pkgs ? import <nixpkgs> {}}:
let
  arduinoSTL = pkgs.fetchFromGitHub {
      owner = "mike-matera";
      repo = "ArduinoSTL";
      rev = "7411816e2d8f49d96559dbaa47e327816dde860c";
      sha256 = "1gi7j2add2kxzgsvagib5156raxd7aw2xvxv9i55d9kx588kp7ws";

    };
in
  arduinoSTL
