{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    ntfs3g htop wget curl git neofetch fastfetch xarchiver p7zip

    google-chrome

    # Audio
    audacity
    # easyeffects

    # Graphics
    gimp shotwell inkscape

    # Video
    obs-studio
    handbrake
    kazam
    vlc

    # Utilities
    isoimagewriter
    lm_sensors
    gparted
    unetbootin
    ventoy-full

    # Office
    libreoffice-fresh

    # System
    gnome-boxes

    # Gnome
    # dconf
    # gnome.gnome-tweaks
  ];
}
