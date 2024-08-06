# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ja_JP.UTF-8";
    LC_IDENTIFICATION = "ja_JP.UTF-8";
    LC_MEASUREMENT = "ja_JP.UTF-8";
    LC_MONETARY = "ja_JP.UTF-8";
    LC_NAME = "ja_JP.UTF-8";
    LC_NUMERIC = "ja_JP.UTF-8";
    LC_PAPER = "ja_JP.UTF-8";
    LC_TELEPHONE = "ja_JP.UTF-8";
    LC_TIME = "ja_JP.UTF-8";
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = [pkgs.fcitx5-mozc];
  };


  fonts = {
    packages= with pkgs; [
#      noto-fonts-cjk-serif
#      noto-fonts-cjk-sans
      noto-fonts-emoji
      takao
      ipafont
      ipaexfont
      source-code-pro
      source-han-code-jp
      nerdfonts
      fira-code
    ];

    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = ["Takao P Mincho" "Noto Color Emoji"];
        sansSerif = ["Takao P Gothic" "Noto Color Emoji"];
        monospace = ["Source Code Pro" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };

}
