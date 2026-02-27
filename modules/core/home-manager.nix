{ pkgs, inputs, username, host, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; }; 
    users.${username} = {
      imports = [ 
       ./../../modules/home
       ./../../hosts/${host}/home.nix
      ];

      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      programs.home-manager.enable = true;
    };
   backupFileExtension = "hm-backup";
 };

}
