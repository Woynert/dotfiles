{ pkgs, config, ... }:

{
  # NOTE: Using overlays on a nix-shell is different
  # see https://nixos.wiki/wiki/Overlays#Applying_overlays_manually

  nixpkgs.overlays = [(final: prev: {

    # replacing neovim-unwrapped with my own

    neovim-unwrapped = prev.neovim-unwrapped.overrideAttrs(final: prev: {
      name = "neovim-unwrapped-woyfork";
      version = "0.9.5-woyfork";

      rev = "6bdb4d1693d789a1db3d39943d66ce57a9cbd09f";
      src = pkgs.fetchFromGitHub {
        owner = "woynert";
        repo = "neovim";
        rev = final.rev;
        hash = "sha256-tcLtrMwMHCGT/yZ7hOsQx5LBz46rfH3lBO/tYLS8Yx0=";
      };
    });

  })];
}
