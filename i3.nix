{ config, pkgs, ... }:

{
    # i3wm --
    environment.pathsToLink = ["/libexec"];

    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    services.xserver.enable = true;

    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
    };

    services.xserver.desktopManager = {
        xterm.enable = false;
    };

    services.xserver.windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
            dmenu i3status i3lock i3blocks
        ];
    };

    programs.dconf.enable = true;
    # -- i3wm

}

