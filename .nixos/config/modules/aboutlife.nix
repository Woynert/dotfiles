{ config, pkgs, ... }:

let
  # Always update the sha256 when updating the rev, even for some gibberish
  # If the same sha256 is left nix won't update the tarball
  # TODO: come up with something better

  rev = "f434e9647b872f8aa75389aa1083873cf99966ce"; # or "master"
  aboutlife = fetchTarball {
    url = "https://github.com/woynert/aboutlife/archive/${rev}.tar.gz";
    sha256 = "1df8f1dw1y12fqi47b1a453s958qy112krn7si8ypy5x4m39fd25";
  };

in
{
  imports = [
    "${aboutlife}/service.nix"
  ];

  services.aboutlife.enable = true;
}
