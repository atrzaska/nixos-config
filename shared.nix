{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    chromium
    curl
    di
    file
    firefoxWrapper
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
    sshfsFuse
    wget
    vim
    xdotool
    zsh
    cryptsetup
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.cleanTmpDir = true;
  i18n.consoleFont = "Lat2-Terminus16";
  i18n.consoleKeyMap = "pl";
  i18n.defaultLocale = "en_US.UTF-8";
  networking.hostName = "nixos";
  networking.hostId = "05bedf19";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowPing = true;
  networking.firewall.logRefusedConnections = false;
  networking.firewall.allowedTCPPorts = [ 22 80 139 445 25565 8766 16261 16262 16263 16264 16265 16266 16267 16268 16269 16270 16271 16272 ];
  networking.firewall.allowedUDPPorts = [ 137 138 25565 8766 16261 ];
  time.timeZone = "Europe/Warsaw";
  hardware.pulseaudio.enable = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.enableAllFirmware = true;
  fonts.enableFontDir = true;
  fonts.enableGhostscriptFonts = true;
  fonts.fonts = with pkgs; [ corefonts terminus_font dejavu_fonts ];
  services.ntp.enable = true;
  services.openssh.enable = true;
  services.udev.packages = [ pkgs.fuse ];
  programs.zsh.enable = true;
  nixpkgs.config.allowUnfree = true;
  security.setuidPrograms = [ "pmount" "pumount" ];


  environment.variables = {
    BROWSER = "chromium-browser";
  };
}
