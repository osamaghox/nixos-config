{ pkgs, inputs, ... }:

{
  imports = [ inputs.stylix.homeModules.stylix ];

  stylix = {
    enable = true;
   # image = ./wallpapers/nature.jpg; # اختر صورتك المفضلة
   # base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
   base16Scheme = ./themes/fleur-dark.yaml;

    
    # ستعرف Stylix تلقائياً أنك تستخدم Niri وتقوم بتلوين الـ focus-ring
    targets = { 
     # niri.enable = true;
      gtk.enable = true;
     };
    
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

fonts = {
      monospace = {
        # الطريقة الجديدة: استدعاء الخط مباشرة كحزمة منفصلة
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono Nerd Font";
      };
      
      # Stylix يحتاج أحياناً لتعريف هذه القيم لتجنب أخطاء الـ null
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
    };

# opacity = {
#    applications = 0.9;
#    desktop = 0.9;
#    popups = 0.9;
#    terminal = 0.9;
#  };

  };
}
