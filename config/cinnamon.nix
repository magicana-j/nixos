 
{ config, pkgs, ... }:

{
    services.xserver.enable = true;

    # lightdm Login Manager.
    services.xserver.displayManager.lightdm.enable = true;

    #services.xserver.desktopManager.enlightenment.enable = true;
    services.xserver.desktopManager.cinnamon.enable = true;
    #services.xserver.desktopManager.mate.enable = true;
    #services.xserver.desktopManager.pantheon.enable = true;
}
