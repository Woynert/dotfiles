{ config, pkgs, ... }:

let
  # Always update the sha256 when updating the rev, even for some gibberish
  # If the same sha256 is left nix won't update the tarball
  # TODO: come up with something better

  rev = "5886df6d83924e3614b6ca2cb276b528014c44b1"; # or "master"
  aboutlife = fetchTarball {
    url = "https://github.com/woynert/aboutlife/archive/${rev}.tar.gz";
    sha256 = "10fxf6far2480c6yjsa6z0qnzq9ngjwprxghz99g7hb8m65rj564";
  };

in
{
  imports = [
    "${aboutlife}/service.nix"
    #"/plan/2-dev/worklocal/aboutlife/service.nix"
  ];

  services.aboutlife.enable = true;
}
