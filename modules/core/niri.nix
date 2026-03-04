{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.niri;
in
{

  options = {
    systemSettings.niri = {
      enable = lib.mkEnableOption "Enable Niri Scrollable Window Manager";
    };
  };

  config = lib.mkIf cfg.enable {
    # Enable the Niri compositor
    programs.niri = {
      enable = true;
    };

  services.upower.enable = true;

    
    # XDG Portals configuration for Wayland (niri)
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config = {
        # Using "gtk" as the primary portal for niri
        common.default = [ "gtk" ];
        niri.default = [ "gtk" ];
      };

      # Only install the portal backends needed for niri
      extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk 
      ];
    };
  };
}
