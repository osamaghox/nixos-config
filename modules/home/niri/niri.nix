{ pkgs, lib, ... }:

let
  # قراءة الإعداد الافتراضي من نظام niri
  baseConfig = builtins.readFile "${pkgs.niri.doc}/share/doc/niri/default-config.kdl";

  # 1. استبدال الطرفية الافتراضية بـ KGX
  # ملاحظة: niri افتراضياً يستخدم alacritty أو foot، سنقوم باستبدالهما
  kgxConfig = lib.replaceStrings [ 
    "spawn-at-startup \"alacritty\""
    "spawn-at-startup \"foot\""
    "Mod+T { spawn \"alacritty\"; }"
    "Mod+T { spawn \"foot\"; }"
  ] [ 
    "spawn-at-startup \"kgx\""
    "spawn-at-startup \"kgx\""
    "Mod+T { spawn \"kgx\"; }"
    "Mod+T { spawn \"kgx\"; }"
  ] baseConfig;

  # 2. تعريف اختصارات Noctalia
  noctaliaLauncherBinds = ''
    Mod+Space hotkey-overlay-title="Noctalia: Launcher" { spawn "noctalia-shell" "ipc" "call" "launcher" "toggle"; }
    Mod+D hotkey-overlay-title="Noctalia: Launcher" { spawn "noctalia-shell" "ipc" "call" "launcher" "toggle"; }
    Mod+S hotkey-overlay-title="Noctalia: Control Center" { spawn "noctalia-shell" "ipc" "call" "controlCenter" "toggle"; }
    Mod+Comma hotkey-overlay-title="Noctalia: Settings" { spawn "noctalia-shell" "ipc" "call" "settings" "toggle"; }
  '';

  # 3. استبدال Fuzzel بـ Noctalia في الملف
  noFuzzelConfig = lib.replaceStrings [
    "Mod+D hotkey-overlay-title=\"Run an Application: fuzzel\" { spawn \"fuzzel\"; }"
  ] [
    "${noctaliaLauncherBinds}"
  ] kgxConfig;

in
{
  # تأكد من أنك قمت بتعريف هذه المجلدات أو احذف ما لا تحتاجه منها
  imports = [
    # ./audio
    # ./clipboard
    # ./noctalia
    # ./notifications
  ];

  # كتابة الإعداد النهائي إلى مسار niri
  xdg.configFile."niri/config.kdl".text = noFuzzelConfig;
}
