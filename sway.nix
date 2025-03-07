{ config, pkgs, ... }:

{
  # Sway --

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  #services.xserver.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      libsForQt5.qt5.qtwayland
      swaybg swaylock swayidle wl-clipboard wf-recorder
      mako grim slurp kitty foot alacritty wofi wlogout
      pcmanfm xfce.thunar xfce.thunar-archive-plugin
      pavucontrol
      networkmanagerapplet
    ];
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export MOZ_ENABLE_WAYLAND=1
    '';
  };

  programs.waybar.enable = true;
  qt.platformTheme = "qt5ct";
  hardware.graphics.enable32Bit = true;

  systemd.user.services.kanshi = {
    description = "kanshi daemon";
    serviceConfig = {
      Type = "simple";
      ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
    };
  };

  security.pam.services.swaylock = {};
  # -- Sway

}
