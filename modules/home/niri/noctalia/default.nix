# noctalia config options
# https://docs.noctalia.dev/getting-started/nixos/#config-ref

{ ... }:
{
  imports = [
    ./noctalia.nix
    ./colors.nix
  ];
}



