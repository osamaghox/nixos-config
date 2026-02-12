# configs to look for niri config in nixos
# https://github.com/JotaFab/s13los/blob/main/modules/home/programs/niri/niri.nix
# https://github.com/devluixos/luix_nix_config/tree/master/home/modules/niri


{ config, pkgs,username, ... }:
{
  imports = [
    ./noctalia
    ./audio
    ./clipboard
    ./notifications
    ./screenshot
  ];
	# xdg.configFile."niri/config.kdl".source = ./config.kdl;


xdg.configFile."niri/config.kdl".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/${username}/nixos-config/modules/home/niri/config.kdl";




	# xdg.configFile."swaylock/config".source = ./swaylock.conf;
  # home.file.".local/bin/nws.sh".source = ./nws.sh;
}










