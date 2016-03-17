{ config, pkgs, ... }:

{
  services.samba = {
    enable = true;
    shares = {
      share = {
        path = "/mnt/share";
        "read only" = "yes";
        "browseable" = "yes";
        "guest ok" = "no";
        "valid users" = "andrzej";
      }
    };

    extraConfig = ''
    guest account = nobody
    map to guest = bad user
    '';
  };
}
