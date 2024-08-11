{ config, pkgs, ... }:

{

    virtualisation.podman = {
        enable = true;
        #networkSocket.enable = true;
        extraPackages = with pkgs; [
            dive
            podman-tui
            docker-compose
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

#    virtualisation.virtualbox.host = {
#        enable = true;
#        enableExtensionPack = true;
#    };

}
