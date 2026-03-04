{ config, lib, pkgs, username, ... }:

let
  cfg = config.systemSettings.virtualization;
in
{
  options = {
    systemSettings.virtualization = {
      enable = lib.mkEnableOption "Enable KVM/QEMU Virtualization";
    };
  };

  config = lib.mkIf cfg.enable {
    # Add user to libvirtd group
    users.users.${username}.extraGroups = [ "libvirtd" ];

    # Install necessary packages for virtual machines
    environment.systemPackages = with pkgs; [
      virt-manager
      virt-viewer
      spice
      spice-gtk
      spice-protocol
      virtio-win
      win-spice
      adwaita-icon-theme
    ];

    # Manage the virtualisation services
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          swtpm.enable = true;
        };
      };
      spiceUSBRedirection.enable = true;
    };

    # Enable agent for better integration (Copy/Paste, Auto-resize)
    services.spice-vdagentd.enable = true;
  };
}
