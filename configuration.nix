{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./shared.nix
    ./laptop.nix
    ./work.nix
    ./nas.nix
  ];

  users = {
    defaultUserShell = "/run/current-system/sw/bin/zsh";

    extraUsers.andrzej = {
      createHome = true;
      home = "/home/andrzej";
      useDefaultShell = true;
      isNormalUser = true;
      uid = 1000;
    };

    extraGroups = {
      wheel.members = [ "andrzej" ];
      vboxusers.members = [ "andrzej" ];
      docker.members = [ "andrzej" ];
    };
  };
}
