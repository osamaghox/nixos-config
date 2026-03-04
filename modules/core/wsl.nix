{ config, lib, pkgs, inputs, username, ... }:

let
  cfg = config.systemSettings.wsl;
in
{
  imports = [ inputs.nixos-wsl.nixosModules.default ];

  options.systemSettings.wsl = {
    enable = lib.mkEnableOption "Enable WSL Specific Configuration";
  };

  # 2. التنفيذ (Implementation)
  config = lib.mkIf cfg.enable {
    environment.enableAllTerminfo = true;

    wsl = {
      enable = true; # هذا السطر هو ما سيقوم بتفعيل موديول WSL فعلياً
      wslConf.automount.root = "/mnt";
      wslConf.interop.appendWindowsPath = false;
      wslConf.network.generateHosts = false;
      defaultUser = username;
      startMenuLaunchers = true;
      docker-desktop.enable = false;
    };
  };

}

