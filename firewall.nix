{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowPing = true;
  networking.firewall.logRefusedConnections = false;
  networking.nameservers = [ "8.8.8.8" "8.8.4.4"];

  networking.firewall.allowedTCPPorts = [
    22
    80
    139
    445
    25565
    8766
    16261
    16262
    16263
    16264
    16265
    16266
    16267
    16268
    16269
    16270
    16271
    16272
  ];

  networking.firewall.allowedUDPPorts = [
    137
    138
    25565
    8766
    16261
  ];
}
