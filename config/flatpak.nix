{ config, pkgs, ... }:

{
  # Flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;
}
