# noctalia config options
# https://docs.noctalia.dev/getting-started/nixos/#config-ref

{ pkgs, inputs, ... }:
{
  imports = [
    ./noctalia.nix
    ./colors.nix
  ];
}






