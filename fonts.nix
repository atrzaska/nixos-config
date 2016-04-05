{ config, pkgs, ... }:

{
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
}
