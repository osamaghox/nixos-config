{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.alacritty;
in
{
  options.userSettings.alacritty = {
    enable = lib.mkEnableOption "Enable Alacritty terminal";
  };

  config = lib.mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
    };
  };
}
