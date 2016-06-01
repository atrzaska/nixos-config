{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.cleanTmpDir = true;
  time.timeZone = "Europe/Warsaw";
  hardware.pulseaudio.enable = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.enableAllFirmware = true;
  services.ntp.enable = true;
  services.openssh.enable = true;
  services.udev.packages = [ pkgs.fuse ];
  programs.zsh.enable = true;
  nixpkgs.config.allowUnfree = true;
  security.setuidPrograms = [ "pmount" "pumount" ];

  environment.variables = {
    BROWSER = "google-chrome-stable";
  };
}
