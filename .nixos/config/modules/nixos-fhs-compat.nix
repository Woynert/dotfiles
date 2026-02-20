{ config, pkgs, ... }:

let
  rev = "f7401e10ffe6dd3288f81fc8285389f9f66b04ed"; # or "master"
  fhs = fetchTarball {
    url = "https://github.com/woynert/nixos-fhs-compat/archive/${rev}.tar.gz";
    sha256 = "1phg52nj4yyr7b8vzgxxbqhig9hh855ipna58l5snw2p78r385zc";
  };

in
{
  imports = [
    "${fhs}"
    #"/plan/2-dev/fork/nixos-fhs-compat/default.nix"
  ];

  environment.fhs.enable = true;
  environment.lsb.enable = true;

  environment.fhs.linkLibs = false;
  environment.fhs.linkExes = false;
  environment.fhs.setSchemaPaths = true;
  environment.fhs.link_elf_interpreter = true;

  #environment.fhs.linkLibs = true;
  #environment.fhs.linkLibs = true;
  #environment.fhs.linkExes = true;
  #environment.fhs.setSchemaPaths = true;
  #environment.lsb.enableDesktop = true;
  #environment.lsb.support32Bit = true;
}
