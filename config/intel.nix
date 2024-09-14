{ config, pkgs, ... }:

{

    hardware.opengl = {
        enable = true;
        extraPackages = with pkgs; [
            onevpl-intel-gpu
            mesa
            intel-media-driver
            intel-media-sdk
            libvdpau-va-gl
            vaapiIntel
            vaapiVdpau
        ];
    };

}
