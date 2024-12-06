# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./intel.nix
      ./bootloader.nix
      ./devices.nix
      ./cinnamon.nix
      ./sound-pipewire.nix
      ./services.nix
      ./network.nix
      ./fonts.nix
      ./fcitx5.nix
      ./locale.nix
      ./firewall.nix
      ./bluetooth.nix
      ./flatpak.nix
      ./systempackages.nix
      ./programs.nix
      #./steam.nix
      #./virtualisation.nix
      #./_1password.nix
    ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.amuharai = {
    isNormalUser = true;
    description = "Amuharai";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirt"
      "video"
      "audio"
    ];
  };

  programs.bash = {
#    enable = true;
    completion.enable = true;
    enableLsColors = true;
#    shellAliases = {
#      ls = "ls -F --color=auto"
#      ll = "ls -lh";
#      la = "ls -la";
#    };
  };

#  programs.zsh = {
#    enable = true;
#    enableCompletion = true;
#    autosuggestions.enable = true;
#    syntaxHighlighting.enable = true;
#
#    shellAliases = {
#      ls = "ls -F --color=auto"
#      ll = "ls -lh";
#      la = "ls -la";
#    };
#
#    histSize = 10000;
#  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

  };



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
