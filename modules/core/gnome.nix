{ config, lib, pkgs, ... }:

let
  cfg = config.systemSettings.gnome;

in
{
  options = {
    systemSettings.gnome = {
      enable = lib.mkEnableOption "Enable Gnome Desktop Manager";  
    };
  };

config = lib.mkIf cfg.enable {

    # 2. Enable GDM Login Manager (Display Manager)
    services.xserver.displayManager.gdm.enable = true;

    # 3. Enable GNOME Desktop Environment
    services.xserver.desktopManager.gnome.enable = true;

    # Exclude unnecessary GNOME default applications
    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
      gnome-photos
      gnome-music
      geary # Email client
    ];
  };
}
