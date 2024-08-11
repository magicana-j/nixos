
{ config, pkgs, ... }:

{
    # gnome exclude
    services.gnome.evolution-data-server.enable = pkgs.lib.mkForce false;
    services.gnome.gnome-online-accounts.enable = pkgs.lib.mkForce false;
    programs.gnome-terminal.enable = pkgs.lib.mkForce false;

    environment.gnome.excludePackages = with pkgs; [
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
    ];
}
