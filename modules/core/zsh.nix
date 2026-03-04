{ config, lib, pkgs, username, ... }:

let
  cfg = config.systemSettings.zsh;
in
{
  options.systemSettings.zsh = {
    enable = lib.mkEnableOption "Enable Zsh as the default shell for the user";
  };

  config = lib.mkIf cfg.enable {
    environment.shells = with pkgs; [ zsh ];

    programs.zsh.enable = true;

    users.users.${username}.shell = pkgs.zsh;
  };
}
