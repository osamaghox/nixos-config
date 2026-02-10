{ pkgs, ... }:

{
  # 2. تفعيل مدير الدخول GDM (شاشة تسجيل الدخول)
  services.xserver.displayManager.gdm.enable = true;

  # 3. تفعيل بيئة سطح المكتب GNOME
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-photos
    gnome-music
    geary # برنامج الإيميل
  ];
}
