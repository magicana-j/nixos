# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  hardware.graphics = {
    enable = true;

    extraPackages = with pkgs; [
      #onevpl-intel-gpu
      vpl-gpu-rt
      mesa
      intel-media-driver
      intel-media-sdk
      libvdpau-va-gl
      vaapiIntel
      vaapiVdpau
    ];
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.


  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "jp";
    variant = "";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  #services.xserver.libinput.enable = true;

  # Configure console keymap
  console.keyMap = "jp106";

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ja_JP.UTF-8";
    LC_IDENTIFICATION = "ja_JP.UTF-8";
    LC_MEASUREMENT = "ja_JP.UTF-8";
    LC_MONETARY = "ja_JP.UTF-8";
    LC_NAME = "ja_JP.UTF-8";
    LC_NUMERIC = "ja_JP.UTF-8";
    LC_PAPER = "ja_JP.UTF-8";
    LC_TELEPHONE = "ja_JP.UTF-8";
    LC_TIME = "ja_JP.UTF-8";
  };


  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.amuharai = {
    isNormalUser = true;
    description = "Amuharai";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "libvirt"
    ];
  };

  i18n.inputMethod = {
    #enabled = "fcitx5";
    enable = true;
    type = "fcitx5";
    fcitx5.addons = [pkgs.fcitx5-mozc];
    fcitx5.waylandFrontend = true;
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-emoji
      #takao
      source-code-pro
      #migmix
      nerdfonts
      udev-gothic-nf
    ];

    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif CJK JP" "Takao PMincho" "IPA PMincho" "Noto Color Emoji"];
        sansSerif = ["Noto Sans CJK JP" "Takao PGothic" "IPA PGothic" "Noto Color Emoji"];
        monospace = ["Noto Sans Mono CJK JP" "Takao Gothic" "IPA Gothic" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  services.tailscale.enable = true;
  networking.firewall = {
    enable = true;
    trustedInterfaces = ["tailscale0"];
    allowedUDPPorts = [];
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services.gnome.gnome-keyring.enable = true;

  environment.shellAliases = {
    ls="ls -F --color=auto";
    ll="ls -lh";
    la="ls -la";
  };

#  programs.bash = {
#    enable = true;
#    completion.enable = true;
#    enableLsColors = true;
#  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
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


  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;


  # Flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    ntfs3g htop wget curl git neofetch fastfetch xarchiver p7zip

    google-chrome

    # Audio
    #audacity
    #easyeffects

    # Graphics
    gimp inkscape

    # Video
    #obs-studio
    #handbrake
    vlc

    # Utilities
    isoimagewriter
    lm_sensors
    gparted
    unetbootin
    ventoy-full

    # Development
    #gcc cmake go rustc rustfmt cargo ghc stack
    #jdk nodejs_23 python3Full

    # Office
    libreoffice-fresh

    # System
    gnome-boxes
    gnome-software

    # Gnome
    # dconf
    # gnome.gnome-tweaks
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs.firefox.enable = true;

  programs.nano.nanorc = ''
    set softwrap
    set linenumbers
    set autoindent
    set tabtospaces
    set tabsize 2
  '';

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

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.starship = {
    enable = true;
  };


  virtualisation.podman = {
    enable = true;
    dockerSocket.enable = true;
    dockerCompat = true;
    extraPackages = with pkgs; [
      dive
      podman-tui
      podman-compose
      #podman-desktop
    ];
  };

  virtualisation.libvirtd = {
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [(pkgs.OVMF.override {
          secureBoot = true;
          tpmSupport = true;
        }).fd];
      };
    };
  };

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}

