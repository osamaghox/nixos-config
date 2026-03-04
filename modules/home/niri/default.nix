{ config, lib, pkgs, inputs, username, ... }:

let
  cfg = config.userSettings.niri;
in
{

  imports = [ inputs.noctalia.homeModules.default ];

  options.userSettings.niri = {
    enable = lib.mkEnableOption "Enable Niri and associated tools";
  };

  config = lib.mkIf cfg.enable {

    programs.noctalia-shell = {
      enable = true;
      systemd.enable = true;
    };

    home.packages = with pkgs; [
      xwayland-satellite
      pavucontrol
      pamixer
      playerctl
      helvum
      wl-clipboard
      cliphist
      wl-clip-persist
      libnotify
      grim
      slurp
      swappy
    ];

    xdg.configFile."niri/config.kdl".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/${username}/nixos-config/modules/home/niri/config.kdl";

    systemd.user.services.xwayland-satellite = {
      Unit = {
        Description = "Xwayland satellite service";
        After = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite :1";
        Restart = "always";
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };
}
