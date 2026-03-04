{ config, lib, username, ... }:

let
  cfg = config.systemSettings.xserver;
in
{
  options.systemSettings.xserver = {
    enable = lib.mkEnableOption "Enable X11 and Auto-login (Not for WSL2)";
  };

  config = lib.mkIf cfg.enable {
    services = {
      xserver = {
        enable = true;
        xkb.layout = "us,ara";
        xkb.options = "grp:alt_shift_toggle";
      };

      displayManager.autoLogin = {
        enable = true;
        user = "${username}";
      };
      libinput.enable = true;
    };
    systemd.settings.Manager.DefaultTimeoutStopSec = "10s";
  };
}
