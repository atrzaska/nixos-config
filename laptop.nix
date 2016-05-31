{ config, pkgs, ... }:

{
  imports = [
    ./postgresql.nix
    ./virtualization.nix
  ];

  environment.systemPackages = with pkgs; [
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
    gnome3.eog
    gimp
    imagemagick
    rxvt_unicode-with-plugins
    exif
    ncdu
  ];

  networking.hostName = "nixos";
  networking.hostId = "05bedf19";
  hardware.bluetooth.enable = true;
  hardware.bumblebee.enable = true;
  hardware.cpu.intel.updateMicrocode = true;
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
}
