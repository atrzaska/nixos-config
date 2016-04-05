{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cryptsetup
    chromium
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
  nixpkgs.config.chromium.enablePepperFlash = true;
  nixpkgs.config.chromium.enablePepperPDF = true;
  nixpkgs.config.chromium.icedtea = true;
  security.setuidPrograms = [ "pmount" "pumount" ];

  environment.variables = {
    BROWSER = "chromium-browser";
  };
}
