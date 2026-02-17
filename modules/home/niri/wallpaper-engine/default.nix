{ config, pkgs, ... }:

{
  # إضافة الحزمة ليكون لديك اختصار لها في الترمينال (اختياري لكن مفيد)
  home.packages = [ pkgs.linux-wallpaperengine ];

  systemd.user.services.wallpaper-engine = {
    Unit = {
      Description = "Wallpaper Engine for Niri";
      # نربط الخدمة بجلسة واي لاند لضمان التشغيل الصحيح مع Niri
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Service = {
      # ملاحظة: تأكد من تغيير DP-1 لاسم شاشتك الحقيقي
      # وتغيير 12345678 لرقم المجلد الصحيح في الـ Workshop
      ExecStart = "${pkgs.linux-wallpaperengine}/bin/linux-wallpaperengine --screen-root DP-1 ${config.home.homeDirectory}/.local/share/Steam/steamapps/workshop/content/431960/12345678";
      Restart = "always";
      # لضمان عدم توقف الخدمة فوراً إذا تأخرت الواجهة في التحميل
      RestartSec = 3; 
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
