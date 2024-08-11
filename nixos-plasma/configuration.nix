# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "pixy"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.


  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

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


  # ENV
  environment.variables = {
    "WLR_NO_HARDWARE_CURSORS" = "1";
    "WLR_RENDERER" = "pixman";
    "WLR_RENDERER_ALLOW_SOFTWARE" = "1";
    "LIBGL_ALWAYS_SOFTWARE" = "1";
  };

  # picom
  services.picom.enable = true;
  services.picom.fade = true;
  services.picom.shadow = false;
  services.picom.shadowExclude = [
    "window_type *= 'toolbar'"
    "window_type *= 'dock'"
    "window_type *= 'desktop'"
  ];
  #services.picom.fadeExclude = [ 
  #  "window_type *= 'menu'"
  #];
  #services.picom.fadeSteps = [
  #  0.04
  #  0.04
  #];  


  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.desktopManager.plasma6.enable = true;

  # lightdm Login Manager.
#  services.xserver.displayManager.lightdm.enable = true;

  # window manager
  # swaywm
    #programs.sway.enable = true;  
    #programs.sway.extraPackages = with pkgs; [
    #  waybar rofi slurp grim wf-recorder
    #  fuzzel foot
    #];

  # hypr
  #services.xserver.windowManager.hypr.enable = true;

  # hyprland
  #programs.hyprland.enable = true;
  #programs.hyprland.enableNvidiaPatches = true;

  # openbox
  #services.xserver.windowManager.openbox.enable = true;

  # Desktop Environtment
  #services.xserver.desktopManager.lxqt.enable = true;
  #services.xserver.desktopManager.budgie.enable = true;
  #services.xserver.desktopManager.deepin.enable = true;
  #services.xserver.desktopManager.xfce.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;
  #services.xserver.desktopManager.pantheon.enable = true;
  #services.xserver.desktopManager.mate.enable = true;
  #services.xserver.desktopManager.cinnamon.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
  #services.xserver.desktopManager.enlightenment.enable = true;

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


  # Enable CUPS to print documents.
  services.printing.enable = true;

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

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  #services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.junin = {
    isNormalUser = true;
    description = "Junin";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirt"
    ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

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


  # Keyboard and Fonts
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "jp";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "jp106";

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = [pkgs.fcitx5-mozc];
    fcitx5.waylandFrontend = true;
  };


  fonts = {
    packages = with pkgs; [
#      noto-fonts-cjk-serif
#      noto-fonts-cjk-sans
      noto-fonts-emoji
      takao
      ipafont
      ipaexfont
      source-code-pro
      source-han-code-jp
      nerdfonts
      fira-code
    ];

    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = ["TakaoPMincho" "Noto Color Emoji"];
        sansSerif = ["TakaoPGothic" "Noto Color Emoji"];
        monospace = ["Source Han Code JP" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };


  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs:
        with pkgs; [
          migu
        ];
    };
  };


  # Virtualisation
  virtualisation.containers.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
    #networkSocket.enable = true;
  };

  virtualisation.libvirtd = {
    enable = true;
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

  programs.virt-manager = {
    enable = true;
  };


  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget curl git neofetch p7zip
#    zed-editor
    # Development
    gcc cmake go python3Full jdk
    # Audio
    easyeffects
    # Graphics
    gimp shotwell
    # Utilities
    isoimagewriter
    # Bluetooth
#    blueman
    # Podman/Docker
    dive podman-tui docker-compose
    # Editor
    kdePackages.kate
    networkmanagerapplet
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

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


  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.starship = {
    enable = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
