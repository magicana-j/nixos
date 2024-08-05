# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

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
