{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    samba
  ];

  services.samba = {
    enable = true;
    shares = {
      share = {
        path = "/home/share";
        "read only" = "yes";
        "browseable" = "yes";
        "guest ok" = "no";
        "valid users" = "andrzej";
      };
    };

    extraConfig = ''
    guest account = nobody
    map to guest = bad user
    '';
  };
}
