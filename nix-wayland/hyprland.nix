{ config, pkgs, ... }:

{
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    environment.sessionVariables = {
        WLR_NO_HARDWARE_CURSORS = "1";
#        NIXOS_OZONE_WL = "1";
        MOZ_ENABLE_WAYLAND = "1";
        XDG_SESSION_TYPE = "wayland";
        WLR_DRM_NO_MODIFIERS = "1";
    };

    hardware = {
        opengl.enable = true;
    };

    programs = {
        waybar.enable = true;
    };

}
