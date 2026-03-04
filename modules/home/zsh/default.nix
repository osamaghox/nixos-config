{ config, lib, pkgs, host, ... }:

let
  cfg = config.userSettings.zsh;
in
{
  ### 1. تعريف الخيار (Option)
  options.userSettings.zsh = {
    enable = lib.mkEnableOption "Enable Zsh";
  };

  ### 2. التنفيذ (Implementation)
  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      
      autosuggestion.enable = true;   
      syntaxHighlighting.enable = true;

      enableCompletion = true; 
      history = {
        size = 10000;
        path = "${config.home.homeDirectory}/.zsh_history";
      };

      shellAliases = {
        # نظام NixOS
        ll = "ls -l";
        update = "sudo nixos-rebuild switch --flake ~/nixos-config#${host}";
        garbage = "nix-collect-garbage -d"; # تنظيف الملفات القديمة لتوفير مساحة
        cdconf = "cd ~/nixos-config"; # انتقال سريع لمجلد الإعدادات
      };
    };
  };
}