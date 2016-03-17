{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bundler
    ctags
    docker
    elixir
    git
    gettext
    nixops
    nix-prefetch-scripts
    nix-repl
    nox
    nodejs
    python
    ruby
    python27Packages.docker_compose
    qemu
    rethinkdb
    tig
    source-code-pro
    silver-searcher
    sublime
    wireshark-qt
    go
    jq
    # bind
    # direnv
    # disnix
    # libcaca
    # libffi
    # poppler_utils
    libsass
    libxml2
    nmap
    ncat
    parallel
    pkgconfig
    tmux
    tree
  ];

  services.postgresql.enable = true;
  services.postgresql.package = pkgs.postgresql95;
  services.postgresql.authentication = "local all all ident";
  services.postgresql.initialScript = ./configuration.sql;

  nixpkgs.config.packageOverrides = pkgs: rec {
    qemu = pkgs.qemu.override { spiceSupport = true; };
  };
}
