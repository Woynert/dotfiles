{ config, pkgs, ... }:

let
  # Always update the sha256 when updating the rev, even for some gibberish
  # If the same sha256 is left nix won't update the tarball
  # TODO: come up with something better

  rev = "bf23d885fcdec26d7518308a058ceac503ba4a6e"; # or "master"
  aboutlife = fetchTarball {
    url = "https://github.com/woynert/aboutlife/archive/${rev}.tar.gz";
    sha256 = "11xi1xvpc9i8jk82s6vzzj5qf8brrq4jrj450060c4apmiadbs0n";
  };

in
{
  imports = [
    "${aboutlife}/service.nix"
  ];

  services.aboutlife.enable = true;
}
