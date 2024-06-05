{ config, pkgs, ... }:

let
  # Always update the sha256 when updating the rev, even for some gibberish
  # If the same sha256 is left nix won't update the tarball
  # TODO: come up with something better

  rev = "46cd33a5beacd33cfdcdeb581c17c3d76d1959b7"; # or "master"
  aboutlife = fetchTarball {
    url = "https://github.com/woynert/aboutlife/archive/${rev}.tar.gz";
    sha256 = "0azfhyzmrlkxhqhacid34k1x1zdjbgv8jqc8rxa15l7a3vdvdz2q";
  };

in
{
  imports = [
    "${aboutlife}/service.nix"
  ];

  services.aboutlife.enable = true;
}
