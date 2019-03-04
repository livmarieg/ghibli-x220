{ config, pkgs, ... }: 

{ 
  imports = [ 
    <nixos-hardware/lenovo/thinkpad/x220>
    ./docs.nix
    ./env.nix
    ./fonts.nix
    ./hw.nix 
    ./home.nix
    ./i18n.nix
    ./net.nix
    ./nixpkgs.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./sound.nix
    ./time.nix
    ./users.nix
    ./xdg.nix
    ./systemd.nix
    ./system.nix
    (import (builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz) {}).nixos
  ];
}
