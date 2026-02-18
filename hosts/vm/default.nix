{ lib,username, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  # Bootloader for virutalbox only because its not real pc.
  boot.loader.systemd-boot.enable = lib.mkForce false;

  # maybe you need to change this to vda in some virtual machines
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  virtualisation.virtualbox.guest.clipboard = true;


  # allow local remote access to make it easier to toy around with the system
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      PermitRootLogin = "yes";
    };
  };

# تأكد من إضافة المستخدم لمجموعة vboxsf
users.users.${username}.extraGroups = [ "vboxsf" ];

fileSystems."/home/USER/windows-share" = {
  device = "vb-windows-shared"; # نفس الاسم الذي وضعته في VirtualBox
  fsType = "vboxsf";
  options = [ "rw" "nofail" "uid=1000" "gid=1000" ];
};

}




