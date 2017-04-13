{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
  /*boot.loader.grub.extraEntries = ''
    menuentry "Windows 10" {
      insmod part_msdos
      insmod ntfs
      set root='hd0,msdos1'
      if [ x$feature_platform_search_hint = xy ]; then
        search --no-floppy --fs-uuid --set=root --hint-bios=hd0,msdos1 --hint-efi=hd0,msdos1 --hint-baremetal=ahci0,msdos1  26BA008B45CBCAEA
      else
        search --no-floppy --fs-uuid --set=root 26BA008B45CBCAEA
      fi
      chainloader +1
    }
  '';*/
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.cleanTmpDir = true;

  hardware.bluetooth.enable = true;
  hardware.bumblebee.enable = true;
  hardware.cpu.intel.updateMicrocode = true;
  hardware.pulseaudio.enable = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.enableAllFirmware = true;

  networking.hostName = "nixos";
  networking.hostId = "05bedf19";

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
    25565
  ];

  networking.firewall.allowedUDPPorts = [
    137
    138
    8766
    16261
    25565
  ];

  i18n.consoleFont = "Lat2-Terminus16";
  i18n.consoleKeyMap = "pl";
  i18n.defaultLocale = "en_US.UTF-8";
  fonts.enableFontDir = true;
  fonts.enableGhostscriptFonts = true;

  fonts.fonts = with pkgs; [
    corefonts
    terminus_font
    ubuntu_font_family
    dejavu_fonts
    inconsolata
    unifont
    ubuntu_font_family
    noto-fonts
    source-code-pro
    symbola
  ];

  time.timeZone = "Europe/Warsaw";

  nixpkgs.config.packageOverrides = pkgs: rec {
    qemu = pkgs.qemu.override { spiceSupport = true; };
  };

  environment.systemPackages = with pkgs; [
    wget
    qemu
    python27Packages.docker_compose
    atom
    bundler
    bind
    ctags
    direnv
    disnix
    elixir
    gitFull
    gettext
    go
    jq
    nmap
    ncat
    nixops
    nix-prefetch-scripts
    nix-repl
    nox
    nodejs
    python
    python34
    ruby
    redis
    tig
    silver-searcher
    wireshark-qt
    parallel
    pkgconfig
    tmux
    tree
    gnupg
    gcc
    bash
    curl
    openssl
    sqlite
    patch
    readline
    zlib
    libyaml
    libxml2
    libxslt
    libtool
    bison
    v8
    nodejs
    which
    pkgconfig
    libyaml
    ncurses
    google-chrome
    curl
    di
    file
    gcc
    gnumake
    ghostscript
    htop
    iftop
    inotify-tools
    jfsutils
    keepass
    keychain
    lsof
    ntfs3g
    nettools
    pmount
    pwgen
    sshfsFuse
    wget
    vim
    xdotool
    zsh
    jre
    dropbox
    transmission_gtk
    vlc
    acpi
    atom
    bundix
    bundler
    cryptsetup
    direnv
    erlang
    gettext
    gimp
    gitAndTools.git-crypt
    gnome3.eog
    gnome3.gnome-system-monitor
    hdparm
    irssi
    libreoffice
    mpv
    mutt
    ncmpcpp
    keybase
    openconnect
    pavucontrol
    perlPackages.ImageExifTool
    pg_top
    pkgconfig
    postgresql
    powertop
    redis
    rtorrent
    screenfetch
    scrot
    tilda
    unetbootin
    unrar
    which
    wirelesstools
    xarchiver
    samba
    p7zip
    unzip
    unrar
    mpv
    scrot
    ffmpeg
    libreoffice
    mutt
    irssi
    audacious
    gimp
    imagemagick
    rxvt_unicode-with-plugins
    exif
    ncdu
  ];

  services.ntp.enable = true;
  services.openssh.enable = true;
  services.udev.packages = [ pkgs.fuse ];
  services.printing.enable = true;
  services.xserver.enable = true;
  services.xserver.layout = "pl";
  services.xserver.videoDrivers = [ "intel" ];
  services.xserver.synaptics.enable = true;
  services.xserver.synaptics.twoFingerScroll = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.desktopManager.default = "gnome3";
  services.xserver.desktopManager.gnome3.enable = true;
  services.postgresql.enable = true;
  services.postgresql.package = pkgs.postgresql95;
  services.postgresql.authentication = "local all all ident";
  services.postgresql.initialScript = ./postgresql.sql;
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

  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;

  programs.zsh.enable = true;
  nixpkgs.config.allowUnfree = true;
  /*security.setuidPrograms = [ "pmount" "pumount" ];*/

  environment.variables = {
    BROWSER = "google-chrome-stable";
  };

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

  system.stateVersion = "17.03";
}
