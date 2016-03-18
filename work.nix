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
    python34
    ruby
    python27Packages.docker_compose
    qemu
    rethinkdb
    tig
    source-code-pro
    silver-searcher
    # sublimetext3
    atom
    wireshark-qt
    go
    jq
    libsass
    libxml2
    nmap
    ncat
    parallel
    pkgconfig
    tmux
    tree
    bind
    direnv
    disnix
    redis
    linuxPackages.virtualbox
  ];

  services.postgresql.enable = true;
  services.postgresql.package = pkgs.postgresql95;
  services.postgresql.authentication = "local all all ident";
  services.postgresql.initialScript = ./configuration.sql;
  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
  virtualisation.libvirtd.enable = true;
  # nixpkgs.config.virtualbox.enableExtensionPack = true;

  nixpkgs.config.packageOverrides = pkgs: rec {
    qemu = pkgs.qemu.override { spiceSupport = true; };
  };

}
