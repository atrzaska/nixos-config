{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./fonts.nix
    ./shared.nix
    ./laptop.nix
    ./work.nix
    ./nas.nix
    ./users.nix
  ];
}
