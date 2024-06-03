{ config, pkgs, ... }:
{
  imports = [
    ./xmousepasteblock-service.nix
  ];

  services.xmousepasteblock.enable = true;
}
