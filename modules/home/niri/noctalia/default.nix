# noctalia config options
# https://docs.noctalia.dev/getting-started/nixos/#config-ref

{ pkgs, inputs, ... }:
{
  imports = [
  inputs.noctalia.homeModules.default
    ./noctalia.nix
    ./colors.nix
  ];
}





