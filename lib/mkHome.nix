{ nixpkgs, home-manager, inputs }:

user: system:

home-manager.lib.homeManagerConfiguration {
  pkgs = nixpkgs.legacyPackages.${system};

  extraSpecialArgs = {
    inherit inputs user;
  };

  modules = [
    ../home-manager/${user}/home.nix
  ];
}
