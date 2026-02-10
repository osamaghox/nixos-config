{ ... }:
{
  imports = [
    ./nixpkgs.nix
    ./bootloader.nix
    ./xserver.nix
    ./gnome.nix
    ./network.nix
    ./pipewire.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./user.nix
    ./wayland.nix
    ./virtualization.nix
  ];
}

