 
{ config, pkgs, ... }:

{

    # Set your time zone.
    time.timeZone = "Asia/Tokyo";

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

    # Keyboard and Fonts

    i18n.inputMethod = {
        enabled = "fcitx5";
        fcitx5.addons = [pkgs.fcitx5-mozc];
        fcitx5.waylandFrontend = true;
    };

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
