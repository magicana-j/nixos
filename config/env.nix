{ config, pkgs, ... }:

{
  # ENV
  environment.variables = {
    "WLR_NO_HARDWARE_CURSORS" = "1";
    "WLR_RENDERER" = "pixman";
    "WLR_RENDERER_ALLOW_SOFTWARE" = "1";
    "LIBGL_ALWAYS_SOFTWARE" = "1";
  };

}
