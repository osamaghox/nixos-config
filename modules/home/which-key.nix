{ pkgs, lib, ... }: 

let
  mkMenu = menu: let
    configFile = pkgs.writeText "config.yaml"
      (lib.generators.toYAML {} {
        anchor = "bottom-right";
        # ...
        inherit menu;
      });
  in
    pkgs.writeShellScriptBin "my-menu" ''
      exec ${lib.getExe pkgs.wlr-which-key} ${configFile}
    '';
in
{
  wayland.windowManager.hyprland.settings.bind = [
    ("SUPERSHIFT, D, exec, " + lib.getExe (mkMenu [
       {
         key = "f";
         desc = "Firefox";
         cmd = "firefox";
       }
    ]))
  ];
}
