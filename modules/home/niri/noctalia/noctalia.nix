{ pkgs, inputs, username, ... }:
{
      programs.noctalia-shell = {
        enable = true;
        settings = {
          bar = {
            density = "compact";
            position = "right";
            showCapsule = false;
            widgets = {
              left = [
                { id = "ControlCenter"; useDistroLogo = true; }
                { id = "Network"; }
                { id = "Bluetooth"; }
              ];
              center = [
                { id = "Workspace"; hideUnoccupied = false; labelMode = "none"; }
              ];
              right = [
                { id = "Battery"; alwaysShowPercentage = false; warningThreshold = 30; }
                { id = "Clock"; formatHorizontal = "HH:mm"; formatVertical = "HH mm"; useMonospacedFont = true; usePrimaryColor = true; }
              ];
            };
          };
          colorSchemes.predefinedScheme = "Monochrome";
        #  general = {
        #    avatarImage = "/home/${username}/.face";
        #    radiusRatio = 0.2;
        #  };
          location = {
            monthBeforeDay = true;
            name = "Marseille, France";
          };
        };
      };
    }
