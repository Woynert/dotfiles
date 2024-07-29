{ config, pkgs, ... }:

let
  # Always update the sha256 when updating the rev, even for some gibberish
  # If the same sha256 is left nix won't update the tarball
  # TODO: come up with something better

  rev = "3338c35d70c07ed4e85847e55aa060017a1c2633"; # or "master"
  aboutlife = fetchTarball {
    url = "https://github.com/woynert/aboutlife/archive/${rev}.tar.gz";
    sha256 = "0sx1gnngxihv1f3vzr1q9icj8hrq7gmq7bklkrp2hcac4x5wwj0x";
  };

in
{
  imports = [
    "${aboutlife}/service.nix"
  ];

  services.aboutlife.enable = true;
}
