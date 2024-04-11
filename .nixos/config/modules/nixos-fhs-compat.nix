{ config, pkgs, ... }:

let
  fhs = fetchTarball {
    url = "https://github.com/Woynert/nixos-fhs-compat/archive/master.tar.gz";
    sha256 = "1hrlkfmffx9qwp4qfqnvh0kb12av6g3ld17p5k8jqsr1zaaw80q4";
  };

in
{
  imports = [
    "${fhs}"
  ];

  environment.fhs.enable = true;
  environment.lsb.enable = true;
  environment.fhs.linkLibs = true;
  environment.fhs.setSchemaPaths = true;
  environment.lsb.enableDesktop = true;
  environment.lsb.support32Bit = true;
}
