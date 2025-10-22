{ config, pkgs, ... }:

{
    # picom
    services.picom.enable = true;
    services.picom.fade = true;
    services.picom.shadow = false;
    services.picom.shadowExclude = [
        "window_type *= 'toolbar'"
        "window_type *= 'dock'"
        "window_type *= 'desktop'"
    ];
    services.picom.fadeExclude = [
      "window_type *= 'menu'"
    ];
    services.picom.fadeSteps = [
      0.04
      0.04
    ];
}
