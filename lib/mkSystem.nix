{ nixpkgs, home-manager, inputs }:

host: user: system:

nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {
    inherit inputs user host;
  };

  modules = [
    # System config
    ../hosts/${host}/configuration.nix

    # Home Manager as NixOS module
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.backupFileExtension = "backup";
      home-manager.extraSpecialArgs = { inherit inputs user host; };

      home-manager.users.${user} =
        import ../hosts/${host}/home.nix;
    }
  ];
}
