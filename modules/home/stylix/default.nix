{ pkgs, ... }:

{

  imports = [ inputs.noctalia.homeModules.default ];

  stylix = {
    enable = true;
    image = ./wallpapers/nature.jpg; # اختر صورتك المفضلة
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    
    # ستعرف Stylix تلقائياً أنك تستخدم Niri وتقوم بتلوين الـ focus-ring
    targets = { 
      niri.enable = true;
      gtk.enable = true;
     };
    
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrainsMono Nerd Font";
      };
    };
  };
}
