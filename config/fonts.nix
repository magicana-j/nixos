 
{ config, pkgs, ... }:

{

    fonts = {
        packages = with pkgs; [
            noto-fonts
            noto-fonts-cjk-serif
            noto-fonts-cjk-sans
            noto-fonts-emoji
            takao
            ipafont
            ipaexfont
            source-code-pro
      	    migmix
            nerdfonts
            fira-code
        ];

        fontDir.enable = true;
        fontconfig = {
            defaultFonts = {
                serif = ["Noto Serif CJK JP" "Noto Color Emoji"];
                sansSerif = ["Noto Sans CJK JP" "Noto Color Emoji"];
                monospace = ["Noto Sans Mono CJK JP" "Noto Color Emoji"];
                emoji = ["Noto Color Emoji"];
            };
        };
    };

}
