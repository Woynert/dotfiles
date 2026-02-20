{ config, pkgs, ... }:

# Extracted from
# https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/by-name/bo/boomer/package.nix
# To generate lock file:
# https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/nim.section.md

let
  boomer_overlay = final: prev: {
    boomer = final.callPackage ./package.nix { };
  };
in
{
  nixpkgs.overlays = [
    boomer_overlay
  ];

  environment.systemPackages = with pkgs; [
    boomer
  ];
}

