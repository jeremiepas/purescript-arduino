{pkgs ? import <nixpkgs> {}, version ? "0.0.1" }:
let
  avrgcc-wrapper = pkgs.stdenv.mkDerivation rec {
    name = "avrgcc-wrapper-${version}";
    version = pkgs.stdenv.lib.strings.getVersion pkgs.avrgcc.name;
    nativeBuildInputs = [ pkgs.makeWrapper ];
    buildCommand = ''
      mkdir -p $out/bin
      for exe in gcc g++; do
        makeWrapper "${pkgs.avrgcc}/bin/avr-$exe" "$out/bin/avr-$exe" --add-flags "-B${pkgs.avrlibc}/avr/lib -isystem ${pkgs.avrlibc}/avr/include"
      done
      ln -s ${pkgs.avrgcc}/lib $out
    '';
  };
in avrgcc-wrapper