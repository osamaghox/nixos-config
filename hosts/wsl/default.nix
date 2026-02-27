{
  username,
  host,
  pkgs,
  inputs,
  ...
}: {

    
  imports = [
    inputs.nixos-wsl.nixosModules.default
    ./../../modules/core
  ];

  # FIXME: change to your tz! look it up with "timedatectl list-timezones"


 
  environment.enableAllTerminfo = true;


  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    wslConf.interop.appendWindowsPath = false;
    wslConf.network.generateHosts = false;
    defaultUser = username;
    startMenuLaunchers = true;

    # Enable integration with Docker Desktop (needs to be installed)
    docker-desktop.enable = false;
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true;
  };


  }

