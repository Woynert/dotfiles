{ config, pkgs, ... }:

let
  rev = "8c3178619d0d7a3c35370f4579d4494ec7680a7f"; # or "master"
  fhs = fetchTarball {
    url = "https://github.com/woynert/nixos-fhs-compat/archive/${rev}.tar.gz";
    sha256 = "0cbdpxdjvw83zw2v406bgn145f53wg4djd5mgbay8x1i1xmf0sp1";
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
