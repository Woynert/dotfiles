# Configuration to allow Nix tools to use NixOS overlays
# see https://nixos.wiki/wiki/Overlays#Using_nixpkgs.overlays_from_configuration.nix_as_.3Cnixpkgs-overlays.3E_in_your_NIX_PATH

final: prev:
with prev.lib;
let
  # Load the system config and get the `nixpkgs.overlays` option
  overlays = (import <nixpkgs/nixos> { }).config.nixpkgs.overlays;
in
  # Apply all overlays to the input of the current "main" overlay
  foldl' (flip extends) (_: prev) overlays final
