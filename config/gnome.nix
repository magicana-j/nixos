{ config, pkgs, ... }:

{
    services.xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
    };
    
    environment.gnome.excludePackages = (with pkgs; [
        gnome-tour
        gnome-connections
    ]) ++ (with pkgs.gnome; [
        epiphany
        geary
    ]);

#    environment.systemPackages = with pkgs.gnomeExtensions; [
#        wayland-or-X11
#        applications-menu
#        kimpanel
#    ];

}

