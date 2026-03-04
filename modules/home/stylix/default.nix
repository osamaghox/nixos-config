{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.userSettings.stylix;
in
{
  options.userSettings.stylix = {
    enable = lib.mkEnableOption "Enable Stylix system-wide theming";
  };

  config = lib.mkIf cfg.enable {
    
    imports = [ inputs.stylix.homeModules.stylix ];

    stylix = {
      enable = true;
      
      base16Scheme = ./themes/fleur-dark.yaml;

      targets = {
        gtk.enable = true;
      };

      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 24;
      };

      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrains Mono Nerd Font";
        };
        
        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };
        
        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
        };

        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };
      };

      # opacity = {
      #   applications = 0.9;
      #   terminal = 0.9;
      # };
    };
  };
}
