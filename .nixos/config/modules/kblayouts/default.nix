{ lib, ... }:

{
  services.xserver = {
    extraLayouts.woynert =  {
      description = "Woynert custom US + Latam";
      languages = [ "eng" ];
      symbolsFile = ./woynert;
    };
    # restart display manager for it to take effect
    displayManager.sessionCommands = "setxkbmap woynert";
  };
}

