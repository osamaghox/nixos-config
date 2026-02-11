{ pkgs, lib, config, ... }:

let
  # دالة مساعدة لإنشاء قائمة wlr-which-key
  mkMenu = menu: let
    configFile = pkgs.writeText "config.yaml"
      (lib.generators.toYAML {} {
        anchor = "bottom-right";
        # يمكنك تخصيص الخط والألوان هنا
        font = "JetBrainsMono Nerd Font"; 
        background = "#1e1e2e";
        color = "#cdd6f4";
        # تمرير القائمة التي نحددها في الأسفل
        inherit menu;
      });
  in
    pkgs.writeShellScriptBin "my-menu" ''
      exec ${lib.getExe pkgs.wlr-which-key} --config ${configFile}
    '';
in
{
  # 1. تفعيل البكج (إضافته للنظام)
  home.packages = [ pkgs.wlr-which-key ];

  # 2. إعدادات Niri
  programs.niri.settings = {
    binds = {
      "Mod+Shift+D".action.spawn = [
        (lib.getExe (mkMenu [
          { key = "f"; desc = "Firefox"; cmd = "firefox"; }
          { key = "g"; desc = "Ghostty"; cmd = "ghostty"; }
        ]))
      ];
    };
  };
}
