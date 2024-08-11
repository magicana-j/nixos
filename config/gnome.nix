 
{ config, pkgs, ... }:

{
    services.xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
    };

    environment.gnome.excludePackages = (with pkgs; [
        gnome-tour
    ]) ++ (with pkgs.gnome; [
        epiphany
        geary
        totem
        tali
        iagno
        hitori
        atomix
    ]);
}
