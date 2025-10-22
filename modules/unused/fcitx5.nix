{ config, pkgs, ... }:

{

  i18n.inputMethod = {
    #enabled = "fcitx5";
    enable = true;
    type = "fcitx5";
    fcitx5.addons = [pkgs.fcitx5-mozc];
    fcitx5.waylandFrontend = true;
  };

}
