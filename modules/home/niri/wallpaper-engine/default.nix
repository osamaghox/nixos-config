{ config, pkgs, ... }:

{
  services.linux-wallpaperengine = {
    enable = true;
    
    # حل مشكلة الـ assets التي واجهناها:
    # الموديول يسمح لنا بتحديد المسار. سنستخدم المسار الموجود داخل الحزمة:
    assetsPath = "${pkgs.linux-wallpaperengine}/share/linux-wallpaperengine/assets";

    wallpapers = [
      {
        monitor = "DP-1"; # تأكد من اسم شاشتك
        wallpaperId = "${config.home.homeDirectory}/Pictures/Wallpapers/Steam/2910465940";
        scaling = "fill";
        fps = 60;
        audio.silent = true; # كتم الصوت إذا أردت
      }
    ];
  };
}
