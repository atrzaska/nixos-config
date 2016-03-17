{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # i3
    xbindkeys
    xfce.thunar
    xfce.xfconf
    xorg.xbacklight
    p7zip
    unzip
    unrar
    mpv
    lxappearance
    dmenu
    i3status
    nitrogen
    scrot

    # personal
    ffmpeg
    libreoffice
    mpd
    mpc_cli
    ncmpcpp
    mutt
    irssi
    audacious
    eog
    gimp
    imagemagick
    pdf2svg
    rxvt_unicode-with-plugins
    pwgen
    exif
    glxinfo
    ncdu
  ];

  hardware.bluetooth.enable = true;
  hardware.bumblebee.enable = true;
  hardware.cpu.intel.updateMicrocode = true;
  services.printing.enable = true;
  services.xserver.enable = true;
  services.xserver.layout = "pl";
  services.xserver.autorun = true;
  services.xserver.videoDrivers = [ "intel" ];
  services.xserver.synaptics.enable = true;
  services.xserver.synaptics.twoFingerScroll = true;
  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.desktopManager.default = "none";
  services.xserver.windowManager.openbox.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.windowManager.default = "i3";
  nixpkgs.config.firefox.enableGoogleTalkPlugin = true;
  nixpkgs.config.firefox.enableAdobeFlash = true;
  nixpkgs.config.chromium.enablePepperFlash = true;
  nixpkgs.config.chromium.enablePepperPDF = true;
}
