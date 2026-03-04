{ config, lib, pkgs, ... }:

let
  cfg = config.systemSettings.bootloader;
in
{
  options = {
    systemSettings.bootloader = {
      enable = lib.mkEnableOption "Custom bootloader configuration";
    };
  };

  config = lib.mkIf cfg.enable {
    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
        systemd-boot.configurationLimit = 10;
      };

      kernelPackages = pkgs.linuxPackages;
      supportedFilesystems = [ "ntfs" ];
    };
  };
}
