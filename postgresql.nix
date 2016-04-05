{ config, pkgs, ... }:

{
  services.postgresql.enable = true;
  services.postgresql.package = pkgs.postgresql95;
  services.postgresql.authentication = "local all all ident";
  services.postgresql.initialScript = ./postgresql.sql;
}
