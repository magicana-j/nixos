{ config, pkgs, ... }:

{

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome.gnome-terminal
    gnome.gnome-system-monitor
    gnome.gnome-screenshot
    gnome.gnome-music
    gnome.gnome-keyring
    gnome.file-roller
    gnome.eog
    gnome.yelp
    gnome.totem
    gnome.gedit
    gnome.geary
    gnome.cheese
    orca
    epiphany
    gnome-text-editor
    gnome.nautilus
    gnome.gnome-contacts
    gnome.gnome-weather
    gnome.simple-scan
    gnome-photos
    evince
    gnome.gnome-disk-utility
    gnome-tour
  ]);

}
