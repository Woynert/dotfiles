{ config, pkgs, options, ... }:

{

  # Configuration to allow Nix tools to use NixOS overlays
  # see https://nixos.wiki/wiki/Overlays#Using_nixpkgs.overlays_from_configuration.nix_as_.3Cnixpkgs-overlays.3E_in_your_NIX_PATH
  # WARNING: All overlays will be applied to Nix-shell

  nix.nixPath =
    options.nix.nixPath.default ++
    [ "nixpkgs-overlays=/etc/nixos/config/overlays-compat/" ]
  ;

  # My custom overlays

  nixpkgs.overlays = [(final: prev: {
    vivaldi = prev.writeShellScriptBin "vivaldi" '' 
      #!/usr/bin/env sh
      echo "vivaldi"
    '';
  })];
}

