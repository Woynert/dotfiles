{ pkgs, config, ... }:

let

  # find stable channels here! https://status.nixos.org/
  # unstable revision required only for discord-screenaudio
  unstable = import
    (builtins.fetchTarball {
      url = "https://github.com/nixos/nixpkgs/tarball/f8e2ebd66d097614d51a56a755450d4ae1632df1";
      sha256 = "03cxv9h218dj7kc5hb0yrclshgbq20plyrvnfdaw5payyy9gbsfr";
    })
    { config = config.nixpkgs.config; };

  wrapped = pkgs.writeShellScriptBin "discord-screenaudio" ''
    # workaround until this pkgs is added to the stable branch
    # this way it doesn't collide with the fhs
    LD_LIBRARY_PATH= exec ${unstable.discord-screenaudio}/bin/discord-screenaudio
  '';

in
{
  # see https://nixos.wiki/wiki/Nix_Cookbook#Wrapping_packages
  environment.systemPackages = [
    (pkgs.symlinkJoin {
      name = "discord-screenaudio";
      paths = [
        wrapped
        unstable.discord-screenaudio
      ];
    })
  ];
}

