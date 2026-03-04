{ config, lib, pkgs, inputs, username, ... }:

let
  cfg = config.systemSettings.wsl;
in
{
  options.systemSettings.wsl = {
    enable = lib.mkEnableOption "Enable WSL Specific Configuration";
  };

  config = lib.mkIf cfg.enable {
    imports = [ inputs.nixos-wsl.nixosModules.default ];

    environment.enableAllTerminfo = true;

    wsl = {
      enable = true;
      wslConf.automount.root = "/mnt";
      wslConf.interop.appendWindowsPath = false;
      wslConf.network.generateHosts = false;
      defaultUser = username;
      startMenuLaunchers = true;
      docker-desktop.enable = false; # نتركه معطلاً لأننا سنستخدم Docker الخاص بنا
    };
  };
}
