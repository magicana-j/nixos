 
{ config, pkgs, ... }:

{
    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "jp";
        variant = "";
    };

    # Enable touchpad support (enabled default in most desktopManager).
    #services.xserver.libinput.enable = true;

    # Configure console keymap
    console.keyMap = "jp106";
}
