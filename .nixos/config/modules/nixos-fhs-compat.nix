{ config, pkgs, ... }:

let
  rev = "57ca0a2229afe6f104d925f7eeea4147a7c18b04"; # or "master"
  fhs = fetchTarball {
    url = "https://github.com/woynert/nixos-fhs-compat/archive/${rev}.tar.gz";
    sha256 = "0ji6q470v43jw9r339mgaini9f3qi4nrp6qihvn7can685nfpmfw";
  };

in
{
  imports = [
    #"${fhs}"
    "/plan/2-dev/fork/nixos-fhs-compat/default.nix"
  ];

  environment.fhs.enable = true;
  environment.lsb.enable = true;

  environment.fhs.linkLibs = false;
  environment.fhs.linkExes = false;
  environment.fhs.setSchemaPaths = true;

  #environment.fhs.linkLibs = true;
  #environment.fhs.linkLibs = true;
  #environment.fhs.linkExes = true;
  #environment.fhs.setSchemaPaths = true;
  #environment.lsb.enableDesktop = true;
  #environment.lsb.support32Bit = true;
}
