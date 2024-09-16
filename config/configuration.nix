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
            ./sound-pipewire.nix
            ./services.nix
            ./network.nix
            ./fonts.nix
            ./gnome.nix
            ./lxqt.nix
            ./ime.nix
            ./locale.nix
            ./firewall.nix
            ./bluetooth.nix
            ./flatpak.nix
            ./programs.nix
            ./steam.nix
            ./virtualisation.nix
        ];

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.junin = {
        isNormalUser = true;
        description = "Junin Krishna";
        extraGroups = [
            "networkmanager"
            "wheel"
            "libvirt"
            "video"
            "audio"
            #"vboxusers"
        ];
        shell = pkgs.zsh;
    };

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            ll = "ls -l";
            la = "ls -la";
            update = "sudo nixos-rebuild switch";
            upgrade = "sudo nixos-rebuild switch --upgrade";
        };

        histSize = 10000;
    };

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
    system.stateVersion = "24.05"; # Did you read the comment?

}
