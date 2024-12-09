{ config, pkgs, ... }:

{

  virtualisation.podman = {
    enable = true;
    dockerSocket.enable = true;
    dockerCompat = true;
    extraPackages = with pkgs; [
      dive
      podman-tui
      podman-compose
      podman-desktop
    ];
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

}
