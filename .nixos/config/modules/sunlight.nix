{ pkgs, config, ... }:

let

  # unstable revision required only for discord-screenaudio
  #unstabless = import
    #(builtins.fetchTarball {
      #url = "https://github.com/nixos/nixpkgs/tarball/76612b17c0ce71689921ca12d9ffdc9c23ce40b2";
      #sha256 = "04cxv9h218dj7kc5hb0yrclshgbq20plyrvnfdaw5payyy3gbsfr";
    #})
    #{ config = config.nixpkgs.config; };

  # find stable channels here! https://status.nixos.org/
  unstable = builtins.fetchTarball {
      url = "https://github.com/nixos/nixpkgs/tarball/76612b17c0ce71689921ca12d9ffdc9c23ce40b2";
      sha256 = "03pmy2dv212mmxgcvwxinf3xy6m6zzr8ri71pda1lqggmll2na12";
  };

  unstable_imported = import unstable {};
in
{
  #imports = ["${unstable}/nixos/modules/services/networking/sunshine.nix"];
  #services.sunshine.enable = true;
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
  };

  #environment.systemPackages = [
    #unstable_imported.krita
  #];

}

