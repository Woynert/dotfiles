{ pkgs, config, ... }:

let

  # Find stable channels here! https://status.nixos.org/
  # Example nixpkgs-26.05pre998534.d233902339c0
  unstable = builtins.fetchTarball {
      url = "https://github.com/nixos/nixpkgs/tarball/d233902339c0";
      sha256 = "1485vqhb8cwym1m75v61i10j427vazszaklkwj2wmm80k8sijjyz";
  };
  unstable_imported = import unstable { };
in
{
  environment.systemPackages = [
    unstable_imported.nix-sweep
  ];
}

