{ pkgs ? import <nixpkgs> {}}:
let
  vscode = pkgs.vscode-with-extensions.override {
      vscodeExtensions = with pkgs.vscode-extensions; [
          bbenoist.Nix
      ]
      ++
      pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
              name = "prettier-vscode";
              publisher = "esbenp";
              version = "2.3.0";
              sha256 = "0jv1pzm8bpd7ajvl797gbvxllic1ir8lwc93lq54bdyaizj9sbvz";
          }
          {
              name = "vscode-purty";
              publisher = "mvakula";
              version = "0.3.0";
              sha256 = "0hjp3c7aw6ykzw6aim72hmissdxmr63fy5nyhzwlljjyzc66m7fs";
          }
          {
              name = "language-purescript";
              publisher = "nwolverson";
              version = "0.2.1";
              sha256 = "18n35wp55c6k1yr2yrgg2qjmzk0vhz65bygfdk0z2p19pa4qhxzs";
          }
          {
              name = "ide-purescript";
              publisher = "nwolverson";
              version = "0.20.8";
              sha256 = "16avxmb1191l641r6pd99lw2cgq8gdfipb9n7d0czx1g9vfjr3ip";
          }
      ];
  };
in 
  vscode