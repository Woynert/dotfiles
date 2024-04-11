{ config, pkgs, ... }:
let
  script = pkgs.writeTextFile {
    name = "auto-shutdown-daemon";
    text = builtins.readFile ./auto-shutdown-daemon.sh;
    executable = true;
  };
in
{
  config.systemd.user.services.auto_shutdown = {
    description = "auto-shutdown";
    wantedBy = [ "graphical-session.target" ]; # TTY sessions are fine
    partOf = [ "graphical-session.target" ];

    path = config.environment.systemPackages; # give access to all pkgs
    startLimitIntervalSec = 350;
    startLimitBurst = 10;
    serviceConfig = {
      ExecStart = script;
      Restart = "always";
      RestartSec = 3;
    };
  };
}

