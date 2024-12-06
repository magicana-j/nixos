{ config, pkgs, ... }:

{
  # Wayfire
  programs.wayfire = {
    enable = true;
    plugins = wayfirePlugins; [
      wcm
      wf-shell
      wayfire-plugins-extra
    ];
    xwayland.enable = true;
  }
}
