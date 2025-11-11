{ config, pkgs, ... }:

let
  # Always update the sha256 when updating the rev, even for some gibberish
  # If the same sha256 is left nix won't update the tarball
  # TODO: come up with something better

  rev = "2d429131a161c3defc3327bcba68337e0e1e4cbc"; # or "master"
  aboutlife = fetchTarball {
    url = "https://github.com/woynert/aboutlife/archive/${rev}.tar.gz";
    sha256 = "0cc08slny96cyxa6c038kyd4iqalndyynw1xfxjfncrg0dv2k015";
  };

in
{
  imports = [
    "${aboutlife}/service.nix"
    #"/plan/2-dev/worklocal/aboutlife/service.nix"
  ];

  services.aboutlife.enable = true;
}
