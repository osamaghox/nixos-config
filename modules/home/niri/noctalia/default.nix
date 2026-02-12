# noctalia config options
# https://docs.noctalia.dev/getting-started/nixos/#config-ref

{ pkgs, inputs, ... }:

{

  imports = [   inputs.noctalia.homeModules.default ];

      programs.noctalia-shell = {
        enable = true;
        systemd.enable = true;
          };
        }








