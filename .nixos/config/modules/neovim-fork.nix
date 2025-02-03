{ pkgs, config, ... }:

{
  # NOTE: Using overlays on a nix-shell is different
  # see https://nixos.wiki/wiki/Overlays#Applying_overlays_manually

  nixpkgs.overlays = [(final: prev: {

    # replacing neovim-unwrapped with my own

    neovim-unwrapped = prev.neovim-unwrapped.overrideAttrs(final: prev: {
      name = "neovim-unwrapped-woyfork";
      version = "0.10.2-woyfork";

      rev = "0d546dd87bfe0662ed9b3281442c4d39a6fd1481";
      src = pkgs.fetchFromGitHub {
        owner = "woynert";
        repo = "neovim";
        rev = final.rev;
        hash = "sha256-cqtSpMw41M6AlM2kLbIxApKr0Vmlh4aMCDtpVqtOiHI=";
      };

      # local development:
      #src = builtins.path {
        #path = "/plan/2-dev/fork/neovim";
        #name = "neovim-src";
      #};
      #src = pkgs.fetchGit {
        #url = "file:///plan/2-dev/fork/neovim";
        #rev = "21b29a2ccc6810f61337f8088161dfd2a9f8c3d8";
      #};
    });

  })];
}
