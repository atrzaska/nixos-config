
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs,  ... }:

{
  # == BOOT == 
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/disk/by-id/ata-";

  boot.initrd.luks.devices = [ 
    { name = "nixos-luksroot"; device = "/dev/disk/by-uuid/df"; } 
  ];
  boot.initrd.luks.cryptoModules = [ "serpent" "sha512" "xts" ];


  # == Secyrity == 
  networking.firewall = {
    enable = true;
    allowPing = true;
    logRefusedConnections = false;
  };

  security.sudo.enable = true;


  # == System settings == 
  time.timeZone = "Europe/Oslo";

  boot.cleanTmpDir = true;

  networking.hostName = "dunnoyet";
  networking.networkmanager.enable = true;

  # Enable systemwide fonts
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      terminus_font
      dejavu_fonts
    ];
  };

  # Select internationalisation properties.
  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "no-latin1";
    defaultLocale = "en_US.UTF-8";
  };



  # == Services ==  
  services.openssh.enable = true;
  services.printing.enable = true;
  hardware.pulseaudio.enable = true;


  # == Desktop == 
  # Allow unfree packages, because the nvidia display driver is unfree. Also enable Flash. 
  nixpkgs.config = { 
    allowUnfree = true; 
    firefox = {
      enableAdobeFlash = true; 
    };
  };

  environment.systemPackages = with pkgs; [
    # System software
    docker
    file
    git
    imagemagick
    ntfs3g
    tmux
    vim_configurable
    wget
    nmap
    p7zip

    # User software
    firefoxWrapper
    i3status
    dmenu
    rxvt_unicode
  ];

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = [ "intel" ];
    # norwegian keyboard layout
    layout = "no";
    synaptics.enable = true;
    # xkbOptions = "eurosign:e";

    displayManager.sddm.enable = true;
    windowManager.i3.enable = true;
    windowManager.default = "i3";
    
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.s = {
    createHome = true;
    home = "/home/s";    
    extraGroups = [ "wheel" ];
    useDefaultShell = true;
    isNormalUser = true;
  };
}