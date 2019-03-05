{ config, pkgs, ... }: 

{ 
  imports = [ 
    <nixos-hardware/lenovo/thinkpad/x220>
    ./boot.nix
    ./docs.nix
    ./env.nix
    ./fonts.nix
    ./fs.nix
    ./home.nix
    ./hw.nix 
    ./i18n.nix
    ./net.nix
    ./nix.nix
    ./nixpkgs.nix
    ./power.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./sound.nix
    ./swap.nix
    ./systemd.nix
    ./system.nix
    ./time.nix
    ./users.nix
    ./xdg.nix
    (import (builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz) {}).nixos
  ];
}
