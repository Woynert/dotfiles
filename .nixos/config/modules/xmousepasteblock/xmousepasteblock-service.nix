{ pkgs, config, lib, ... }:
with lib;
{
  options.services.xmousepasteblock = {
    enable = mkEnableOption "Enable xmousepasteblock service";
    greeter = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.services.xmousepasteblock.enable {
    systemd.user.services.xmousepasteblock = {
      description = "Middle mouse button primary X selection/clipboard paste disabler";
      wantedBy = [ "graphical-session.target" ];
      partOf = [ "graphical-session.target" ];

      startLimitIntervalSec = 350;
      startLimitBurst = 10;
      serviceConfig = {
        ExecStart = "${pkgs.xmousepasteblock}/bin/xmousepasteblock";
        Restart = "always";
        RestartSec = 10;
      };
    };
  };
}
