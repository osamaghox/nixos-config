{ pkgs, lib, config, ... }:

{
  programs.niri.settings = {
    # This config is in the KDL format: https://kdl.dev
    # Check the wiki for a full description of the configuration:
    # https://yalter.github.io/niri/Configuration:-Introduction

    # Input device configuration.
    input = {
      keyboard = {
        xkb = {
          # You can set rules, model, layout, variant and options.
          # For example: layout = "us,ru";
        };
        # Enable numlock on startup.
        numlock = true;
      };

      touchpad = {
        tap = true;
        natural-scroll = true;
      };

      # Focus windows and outputs automatically when moving the mouse into them.
      focus-follows-mouse.max-scroll-amount = "0%";
    };

    # Settings that influence how windows are positioned and sized.
    layout = {
      # Set gaps around windows in logical pixels.
      gaps = 16;

      # Options: "never", "always", "on-overflow"
      center-focused-column = "never";

      preset-column-widths = [
        { proportion = 1.0 / 3.0; }
        { proportion = 1.0 / 2.0; }
        { proportion = 2.0 / 3.0; }
      ];

      default-column-width = { proportion = 0.5; };

      focus-ring = {
        # width of the ring
        width = 4;
        # Color of the ring on the active monitor.
        active-color = "#7fc8ff";
        # Color of the ring on inactive monitors.
        inactive-color = "#505050";
      };

      border = {
        enable = false; # "off" in KDL
        width = 4;
        active-color = "#ffc87f";
        inactive-color = "#505050";
        urgent-color = "#9b0000";
      };

      shadow = {
        # softness controls the shadow blur radius.
        softness = 30;
        spread = 5;
        offset = { x = 0; y = 5; };
        color = "#0007";
      };
    };

    # screenshot-path property
    screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

    # Window rules
    window-rules = [
      {
        # Work around WezTerm's initial configure bug
        match.app-id = "^org\\.wezfurlong\\.wezterm$";
        default-column-width = {};
      }
      {
        # Open the Firefox picture-in-picture player as floating
        match = {
          app-id = "firefox$";
          title = "^Picture-in-Picture$";
        };
        open-floating = true;
      }
    ];

    binds = {
      # Show a list of important hotkeys.
      "Mod+Shift+Slash".action.show-hotkey-overlay = [];

      # Suggested binds for running programs:
      "Mod+T".action.spawn = [ "ghostty" ];
      "Mod+D".action.spawn = [ "fuzzel" ];
      "Super+Alt+L".action.spawn = [ "swaylock" ];

      # Use spawn-sh to run a shell command.
      "Super+Alt+S".action.spawn = [ "sh" "-c" "pkill orca || exec orca" ];

      # Volume keys mappings for PipeWire.
      "XF86AudioRaiseVolume".action.spawn = [ "sh" "-c" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0" ];
      "XF86AudioLowerVolume".action.spawn = [ "sh" "-c" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-" ];
      "XF86AudioMute".action.spawn = [ "sh" "-c" "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" ];
      "XF86AudioMicMute".action.spawn = [ "sh" "-c" "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle" ];

      # Media keys using playerctl.
      "XF86AudioPlay".action.spawn = [ "playerctl" "play-pause" ];
      "XF86AudioStop".action.spawn = [ "playerctl" "stop" ];
      "XF86AudioPrev".action.spawn = [ "playerctl" "previous" ];
      "XF86AudioNext".action.spawn = [ "playerctl" "next" ];

      # Brightness key mappings.
      "XF86MonBrightnessUp".action.spawn = [ "brightnessctl" "--class=backlight" "set" "+10%" ];
      "XF86MonBrightnessDown".action.spawn = [ "brightnessctl" "--class=backlight" "set" "10%-" ];

      # Navigation & Layout
      "Mod+O".action.toggle-overview = [];
      "Mod+Q".action.close-window = [];

      "Mod+Left".action.focus-column-left = [];
      "Mod+Down".action.focus-window-down = [];
      "Mod+Up".action.focus-window-up = [];
      "Mod+Right".action.focus-column-right = [];
      "Mod+H".action.focus-column-left = [];
      "Mod+J".action.focus-window-down = [];
      "Mod+K".action.focus-window-up = [];
      "Mod+L".action.focus-column-right = [];

      "Mod+Ctrl+Left".action.move-column-left = [];
      "Mod+Ctrl+Down".action.move-window-down = [];
      "Mod+Ctrl+Up".action.move-window-up = [];
      "Mod+Ctrl+Right".action.move-column-right = [];

      # Workspace navigation
      "Mod+Page_Down".action.focus-workspace-down = [];
      "Mod+Page_Up".action.focus-workspace-up = [];
      "Mod+1".action.focus-workspace = 1;
      "Mod+2".action.focus-workspace = 2;
      "Mod+3".action.focus-workspace = 3;
      "Mod+4".action.focus-workspace = 4;
      "Mod+5".action.focus-workspace = 5;
      "Mod+6".action.focus-workspace = 6;
      "Mod+7".action.focus-workspace = 7;
      "Mod+8".action.focus-workspace = 8;
      "Mod+9".action.focus-workspace = 9;

      "Mod+Ctrl+1".action.move-column-to-workspace = 1;
      "Mod+Ctrl+2".action.move-column-to-workspace = 2;
      "Mod+Ctrl+3".action.move-column-to-workspace = 3;

      # Column management
      "Mod+BracketLeft".action.consume-or-expel-window-left = [];
      "Mod+BracketRight".action.consume-or-expel-window-right = [];
      "Mod+Comma".action.consume-window-into-column = [];
      "Mod+Period".action.expel-window-from-column = [];

      "Mod+R".action.switch-preset-column-width = [];
      "Mod+Shift+R".action.switch-preset-window-height = [];
      "Mod+F".action.maximize-column = [];
      "Mod+Shift+F".action.fullscreen-window = [];
      "Mod+C".action.center-column = [];

      "Mod+Minus".action.set-column-width = "-10%";
      "Mod+Equal".action.set-column-width = "+10%";

      "Mod+V".action.toggle-window-floating = [];
      "Mod+W".action.toggle-column-tabbed-display = [];

      # Screenshots
      "Print".action.screenshot = [];
      "Ctrl+Print".action.screenshot-screen = [];
      "Alt+Print".action.screenshot-window = [];

      # Exit/Quit
      "Mod+Shift+E".action.quit = [];
      "Mod+Shift+P".action.power-off-monitors = [];
    };
  };
}
