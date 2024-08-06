# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.flatpak.enable = true;
  xdg.portal.enable = true;

  # for Hyprland
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget curl git neofetch p7zip
#    zed-editor
#    gcc go python3 jdk
#    scala
#    clojure sbcl chicken gauche guile # Lisp / Scheme
#    swiProlog #swiPrologWithGui # Prolog
#    vscode
    easyeffects
    isoimagewriter
#    blueman
    # Pentesting tool
#    john johnny lynis metasploit nikto nmap wpscan social-engineer-toolkit
#    burpsuite wireshark thc-hydra sqlmap apktool ffuf bettercap

    # Hyprland apps
    alacritty kitty wezterm wori hyprpaper swww mako hyprshot wlogout swaylock grim slupr wl-copy

    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
        set encoding=utf-8
        set number
        set relativenumber
        set autoindent
        set smartindent
        set expandtab
        set tabstop=2
        set shiftwidth=2
        set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
        if &diff
          colorscheme blue
        endif
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [ ctrlp ];
      };
    };
  };

  programs.starship = {
    enable = true;
  };

}
