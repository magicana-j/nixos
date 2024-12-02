{ config, pkgs, ... }:

{

  fonts = {
    packages = with pkgs; [
      noto-fonts
      #noto-fonts-cjk-serif
      #noto-fonts-cjk-sans
      noto-fonts-emoji
      takao
      source-code-pro
      migmix
      nerdfonts
      udev-gothic-nf
    ];

    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif CJK JP" "Takao PMincho" "IPA PMincho" "Noto Color Emoji"];
        sansSerif = ["Noto Sans CJK JP" "Takao PGothic" "IPA PGothic" "Noto Color Emoji"];
        monospace = ["Noto Sans Mono CJK JP" "Takao Gothic" "IPA Gothic" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };

}
