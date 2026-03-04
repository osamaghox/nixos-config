{ config, lib, pkgs, username, ... }:

let
  cfg = config.systemSettings.docker;
in
{
  options.systemSettings.docker = {
    enable = lib.mkEnableOption "Enable Docker Service";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      enableOnBoot = true;
      autoPrune.enable = true;
    };

    # إضافة المستخدم لمجموعة docker ليعمل بدون sudo
    users.users.${username}.extraGroups = [ "docker" ];
  };
}
