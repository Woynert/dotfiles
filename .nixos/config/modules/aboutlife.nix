{ config, pkgs, ... }:

let
  # Always update the sha256 when updating the rev, even for some gibberish
  # If the same sha256 is left nix won't update the tarball
  # TODO: come up with something better

  rev = "51a5043d183ef9de8a3a0e45a3b93e25dcf1f896"; # or "master"
  aboutlife = fetchTarball {
    url = "https://github.com/woynert/aboutlife/archive/${rev}.tar.gz";
    sha256 = "094v4il2lrma9ypazds3caykyxjpyqxim5yazy4vajxs566limd2";
  };

in
{
  imports = [
    "${aboutlife}/service.nix"
  ];

  services.aboutlife.enable = true;
}
