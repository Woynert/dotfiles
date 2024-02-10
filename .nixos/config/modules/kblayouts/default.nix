{ lib, ... }:

let
  myCondition = builtins.pathExists /home/woynert/.xkb/symbols/woynert;

in
{
  services.xserver.extraLayouts.woynert = lib.mkIf myCondition {
    description = "Woynert custom US - Latam amalgamation";
    languages = [ "eng" ];
    symbolsFile = /home/woynert/.xkb/symbols/woynert;
  };
}

