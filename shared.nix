{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cryptsetup
    google-chrome
    curl
    di
    file
    firefox
    gcc
    gnumake
    ghostscript
    htop
    iftop
    inetutils
    inotify-tools
    jfsutils
    keepass
    keychain
    lsof
    ntfs3g
    man_db
    manpages
    nettools
    pmount
    posix_man_pages
    pwgen
    sshfsFuse
    wget
    vim
    xdotool
    zsh
    jre

    # custom installed
    # chromium
    # sublimetext3-3103
    # thunar
    # thunar-volman
    # zlib
    # zlib-static
    # icedtea-web
    # libmtp
    # librsvg
    # libva-intel-driver
    # libva-vdpau-driver
    # libvdpau
    # libvdpau-va-gl
    # libxml2
    acpi
    adwaita-icon-theme
    atom
    bundix
    bundler
    compton
    conky
    cryptsetup
    direnv
    eog
    erlang
    gettext
    gimp
    git-crypt
    gnome-system-monitor
    gnome-themes-standard
    gnupg
    hdparm
    irssi
    libreoffice
    lxappearance
    mpv
    mutt
    ncmpcpp
    nodejs-keybase
    obconf
    openconnect
    pavucontrol
    perl-Image-ExifTool
    pg_top
    pkg-config
    postgresql
    powertop
    pyGtkGlade
    python35Packages.livestreamer
    redis
    rtorrent
    screenfetch
    scrot
    tilda
    unetbootin
    unrar
    which
    wirelesstools
    xbindkeys
    xfconf
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
  nixpkgs.config.firefox.enableAdobeFlash = true;
  nixpkgs.config.firefox.icedtea = true;
  # nixpkgs.config.chromium.enablePepperFlash = true;
  # nixpkgs.config.chromium.enablePepperPDF = true;
  # nixpkgs.config.chromium.icedtea = true;
  security.setuidPrograms = [ "pmount" "pumount" ];

  environment.variables = {
    BROWSER = "chromium-browser";
  };
}
