{ pkgs, ... }:
{
  # imports = [ inputs.nix-gaming.nixosModules.default ];
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    git
  ];

  time.timeZone = "Asia/Aden";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ar_YE.UTF-8";
    LC_IDENTIFICATION = "ar_YE.UTF-8";
    LC_MEASUREMENT = "ar_YE.UTF-8";
    LC_MONETARY = "ar_YE.UTF-8";
    LC_NAME = "ar_YE.UTF-8";
    LC_NUMERIC = "ar_YE.UTF-8";
    LC_PAPER = "ar_YE.UTF-8";
    LC_TELEPHONE = "ar_YE.UTF-8";
    LC_TIME = "ar_YE.UTF-8";
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";
}
