{ config, pkgs, ... }:

# Extracted from
# https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/by-name/gr/graphite/package.nix

let
  graphite_overlay = final: prev: {
    graphite_editor = final.callPackage ./package.nix { };
  };
in
{
  nixpkgs.overlays = [
    graphite_overlay
  ];

  environment.systemPackages = with pkgs; [
    graphite_editor
  ];
}

