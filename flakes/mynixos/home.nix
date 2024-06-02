{config, pkgs, ... }:
{
  home = rec {
    username = "junin";
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    gcc go nodejs-slim nodePackages.wrangler
    python312
    discord
    discord-ptb
    gnome.totem
    gnome.evince
    parsec-bin
    remmina
    slack
    vscode
    easyeffects
    shotwell
  ];

  programs.git = {
    enable = true;
    userName = "magicana-j";
    userEmail = "zima0524@hotmail.co.jp";
  };

  programs.gh = {
    enable = true;
    extensions = with pkgs; [gh-markdown-preview];
    settings = {
      editor = "nano";
    };
  };

  programs.neovim = {
    enable = true;

    #extraLuaConfig = builtins.readFile ./init.lua;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.starship = {
    enable = true;
  };

}
