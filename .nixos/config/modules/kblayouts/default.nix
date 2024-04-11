{ lib, ... }:

{
  services.xserver = {
    extraLayouts.woynert =  {
      description = "Woynert custom US + Latam";
      languages = [ "eng" ];
      symbolsFile = ./woynert;
    };
    layout = lib.mkForce "woynert";
  };
}

