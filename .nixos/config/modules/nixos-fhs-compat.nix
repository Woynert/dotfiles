{ config, pkgs, ... }:

let
  rev = "eb859b2bbb3a4d6f806022ade7787124e40e22ff"; # or "master"
  fhs = fetchTarball {
    url = "https://github.com/woynert/nixos-fhs-compat/archive/${rev}.tar.gz";
    sha256 = "0pqn5kccyr9vmc1lia9v76r70pzwqzk4qhm4yg2py6s87fm4qf3l";
  };

in
{
  imports = [
    "${fhs}"
    #"/plan/2-dev/fork/nixos-fhs-compat/default.nix"
  ];

  environment.lsb.enable = true;
  environment.lsb.set_schema_paths = true;
  environment.lsb.link_elf_interpreter = true;

  #environment.fhs.enable = true;
  #environment.lsb.enable = true;

  #environment.fhs.linkLibs = false;
  #environment.fhs.linkExes = false;
  #environment.fhs.setSchemaPaths = true;
  #environment.fhs.link_elf_interpreter = true;

  #environment.fhs.linkLibs = true;
  #environment.fhs.linkLibs = true;
  #environment.fhs.linkExes = true;
  #environment.fhs.setSchemaPaths = true;
  #environment.lsb.enableDesktop = true;
  #environment.lsb.support32Bit = true;
}
