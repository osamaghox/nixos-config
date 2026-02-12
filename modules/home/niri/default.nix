# configs to look for niri config in nixos
# https://github.com/JotaFab/s13los/blob/main/modules/home/programs/niri/niri.nix
# https://github.com/devluixos/luix_nix_config/tree/master/home/modules/niri


{ config, pkgs, ... }:
{
  imports = [
    ./noctalia
    ./which-key
    ./niri.nix

  ];
	xdg.configFile."niri/config.kdl".source = ./config.kdl;
	# xdg.configFile."swaylock/config".source = ./swaylock.conf;
  # home.file.".local/bin/nws.sh".source = ./nws.sh;
}


