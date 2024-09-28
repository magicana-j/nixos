{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    ntfs3g htop wget curl git neofetch fastfetch xarchiver p7zip
    gnome.gnome-keyring
    google-chrome

    python312 go

    # Audio
    easyeffects

    # Graphics
    gimp shotwell inkscape

    # Video
    vokoscreen-ng
    obs-studio
    easyeffects

    # Utilities
    isoimagewriter
    lm_sensors
    gparted

    # Editor
    kdePackages.kate

    # Office
    libreoffice-fresh

    # Gnome
    dconf
    gnome.gnome-tweaks
  ];
