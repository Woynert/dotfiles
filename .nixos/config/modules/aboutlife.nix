{ config, pkgs, ... }:

let
  aboutlife = fetchTarball {
    url = "https://github.com/woynert/aboutlife/archive/master.tar.gz";
    sha256 = "0h4rm2ipai79a2xy3cpdjm4pqpfrgz8cafm3i1pk7w8in3kf63ji";
  };

in
{
  imports = [
    "${aboutlife}/service.nix"
  ];

  services.aboutlife.enable = true;
}
