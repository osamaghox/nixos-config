{ config, lib, pkgs, ... }:

let
  cfg = config.systemSettings.pipewire;
in
{
  options = {
    systemSettings.pipewire = {
      enable = lib.mkEnableOption "Enable Pipewire";
    };
  };

  config = lib.mkIf cfg.enable {
    services.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # lowLatency.enable = true;
    };
    hardware.alsa.enablePersistence = true;
    environment.systemPackages = with pkgs; [ pulseaudioFull ];
  };
}
