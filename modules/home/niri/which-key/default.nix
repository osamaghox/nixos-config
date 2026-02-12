{ pkgs, lib, config, ... }:

let
  mkMenu = menu: let
    configFile = pkgs.writeText "config.yaml"
      (lib.generators.toYAML {} {
        anchor = "bottom-right";
        font = "JetBrainsMono Nerd Font"; 
        background = "#1e1e2e";
        color = "#cdd6f4";
        inherit menu;
      });
  in
    "${pkgs.writeShellScript "my-menu-script" ''
      exec ${lib.getExe pkgs.wlr-which-key} --config ${configFile}
    ''}";

  myLauncher = mkMenu [
    { key = "f"; desc = "Firefox"; cmd = "firefox"; }
    { key = "g"; desc = "Ghostty"; cmd = "ghostty"; }
  ];
in
{
  home.packages = [ pkgs.wlr-which-key ];

  # إنشاء ملف صغير يحتوي فقط على الأوامر المولدة من Nix
  xdg.configFile."niri/nix-binds.kdl".text = ''
    binds {
        "Mod+Shift+D" { spawn "${myLauncher}"; }
    }
  '';
}
