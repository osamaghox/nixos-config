{ config, lib, pkgs, host, username, ... }:

{

  system.stateVersion = "25.11";

  imports = [
    ./../../modules/core
   # ./hardware-configuration.nix
  ];


  
}
