 
{ config, pkgs, ... }:

{

    fonts = {
        packages = with pkgs; [
#      noto-fonts-cjk-serif
#      noto-fonts-cjk-sans
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
                serif = ["TakaoPMincho" "Noto Color Emoji"];
                sansSerif = ["TakaoPGothic" "Noto Color Emoji"];
                monospace = ["IPAfont" "Noto Color Emoji"];
                emoji = ["Noto Color Emoji"];
            };
        };
    };

}
