{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker
    qemu
    linuxPackages.virtualbox
    python27Packages.docker_compose
  ];

  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;

  nixpkgs.config.packageOverrides = pkgs: rec {
    qemu = pkgs.qemu.override { spiceSupport = true; };
  };
}
