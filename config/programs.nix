 
{ config, pkgs, ... }:

{
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        wget curl git neofetch p7zip
        gnome.gnome-keyring
        # Development
        gcc cmake go python3Full jdk
        # Audio
        easyeffects
        # Graphics
        gimp shotwell
        # Utilities
        isoimagewriter
        # Editor
        kdePackages.kate
#        networkmanagerapplet
    ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # Install firefox.
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

}
